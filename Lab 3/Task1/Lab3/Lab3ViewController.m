//
//  Lab3ViewController.m
//  Lab3
//
//  Created by 6555985 on 30/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lab3ViewController.h"

@implementation Lab3ViewController

@synthesize myLabel;

- (IBAction)ascending
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"actors_list" ofType:@"txt"];   
    NSString *textData = [NSString stringWithContentsOfFile:filePath encoding: NSUTF8StringEncoding error:nil];
    if (textData)
    {
        NSArray *lines = [textData componentsSeparatedByString:@"\n"];    
        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(localizedCompare:)];
        NSArray* sortedLines = [lines sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        myLabel.text = [sortedLines componentsJoinedByString:@"\n"];
    }
}

- (IBAction)decending
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"actors_list" ofType:@"txt"];   
    NSString *textData = [NSString stringWithContentsOfFile:filePath encoding: NSUTF8StringEncoding error:nil];
    if (textData)
    {
        NSArray *lines = [textData componentsSeparatedByString:@"\n"];  
        NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
        NSArray* sortedLines = [lines sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        myLabel.text = [sortedLines componentsJoinedByString:@"\n"];
    }
}
- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
