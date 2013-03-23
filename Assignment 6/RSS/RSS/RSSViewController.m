//
//  RSSViewController.m
//  RSS
//
//  Created by Chao Zhao on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSViewController.h"

@implementation RSSViewController

@synthesize rssParser;
@synthesize tableView = _tableView;
@synthesize listData = _listData;
@synthesize titles;
@synthesize item;
@synthesize currentElement;
@synthesize currentTitle, currentDate, currentSummary, currentLink;

-(BOOL)saveData
{
    NSString *path = @"http://feeds.feedburner.com/techcrunch/";
    NSURL  *url = [NSURL URLWithString:path];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    if ( urlData )
    {
        NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString  *documentsDirectory = [paths objectAtIndex:0];  
        
        NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"rss.xml"];
        [urlData writeToFile:filePath atomically:YES];
        
        NSLog(@"OK");
        return YES;
    }
    
    return NO;
}
-(NSString*)loadData
{
    NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString  *documentsDirectory = [paths objectAtIndex:0];  
    NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"rss.xml"];
    
    return filePath;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [_listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"rss";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier]autorelease];
	}
	
	// Set up the cell
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	cell.textLabel.text =[[_listData objectAtIndex: storyIndex] objectForKey: @"title"];
	
	return cell;
}


- (void)parseXMLFileWithURL:(NSString *)URL
{	
	_listData = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];

    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    [rssParser parse];
}
-(void) parseXMLFileWithData:(NSData*)myData
{
    _listData = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithData:myData];
    
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    [rssParser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{			
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) 
    {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[_listData addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
        [titles addObject:currentTitle];
	}	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}	
}

- (void)parserDidEndDocument:(NSXMLParser *)parser 
{
	//NSLog(@"stories array has %d items", [_listData count]);
	[_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)refreshTableView:(id)sender
{
    NSLog(@"bt pressed");
    NSString *path = @"http://feeds.feedburner.com/TechCrunch/";
    
    // NSString *URLString = [[NSString alloc]initWithContentsOfURL:[NSURL URLWithString:path] encoding:(NSUTF8StringEncoding) error:nil];
    
    NSString *filePath = [[NSString alloc]init];
    NSURL *URL = [[NSURL alloc]initWithString:filePath];
    NSData *myData = [[NSData alloc]initWithContentsOfURL:URL];
    
    //
    [self saveData];
    filePath = [self loadData];
    myData = [NSData dataWithContentsOfFile:filePath];  
    
    [self parseXMLFileWithData:myData];   
    //
/*
    if ([self saveData])
    {
        [self parseXMLFileWithURL:path];
    } else {
        filePath = [self loadData];
        myData = [NSData dataWithContentsOfFile:filePath];  
        
        [self parseXMLFileWithData:myData];   
    }
  */  
    [_tableView reloadData];
    
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = @"http://feeds.feedburner.com/TechCrunch/";
  
    NSString *filePath = [[NSString alloc]init];
    NSURL *URL = [[NSURL alloc]initWithString:filePath];
    NSData *myData = [[NSData alloc]initWithContentsOfURL:URL];
//
    [self saveData];
    filePath = [self loadData];
    myData = [NSData dataWithContentsOfFile:filePath];  
    
    [self parseXMLFileWithData:myData];   
//
  /*  
    if ([self saveData])
    {
        [self parseXMLFileWithURL:path];
    } 
    else 
    {
        filePath = [self loadData];
        myData = [NSData dataWithContentsOfFile:filePath];  
        
        [self parseXMLFileWithData:myData];   
    }
*/
    [_tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
