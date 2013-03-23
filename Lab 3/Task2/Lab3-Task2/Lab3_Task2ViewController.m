//
//  Lab3_Task2ViewController.m
//  Lab3-Task2
//
//  Created by Chao Zhao on 13/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lab3_Task2ViewController.h"

@implementation Lab3_Task2ViewController

@synthesize labInfo;

-(IBAction)action:(id)sender
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"info" ofType:@"plist"];
    NSLog(@"path:%@", plistPath);
    id theid = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    NSMutableDictionary *mutaDictionary = theid; 
    NSString *tempStr;
    for (id key in mutaDictionary)
    {
        tempStr = [mutaDictionary valueForKey:key];
        //[mutaDictionary setObject:[tempStr lowercaseString] forKey
    }
    for (id key in mutaDictionary) 
    {
        NSLog(@"key: %@, value: %@", key, [mutaDictionary valueForKey:key]);
    }
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"path:%@", documentPath);
    [mutaDictionary writeToFile:documentPath atomically:YES];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:documentPath];
    if (fileExists == YES)
    {
        NSLog(@"file Exists");
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
        
    [super viewDidLoad];
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
