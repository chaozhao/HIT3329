//
//  Lab2ViewController.m
//  Lab2
//
//  Created by Chao Zhao on 2/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lab2ViewController.h"

@implementation Lab2ViewController

@synthesize red,green,blue,lab;

-(IBAction)update:(id)sender
{
    float r=[red value]/255;  
    float g=[green value]/255;  
    float b=[blue value]/255;  
    //NSLog(@"red float value is: %f", r*255);
    //NSLog(@"green float value is: %f", g*255);
    //NSLog(@"blue float value is: %f", b*255);
    [lab setTextColor:[UIColor colorWithRed:r green:g blue:b alpha:1]]; 
    //NSLog(@"Update button pressed");
    

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
    lab.text=@"UITextView";//设定Lable的初始值  
    red.minimumValue=0;//设定Red的最小值为0  
    red.maximumValue=255;//设定Red的最大值为1  
    blue.minimumValue=0;//设定Blue的最小值为0  
    blue.maximumValue=255;//设定Blue的最大值为1  
    green.minimumValue=0;//设定Green的最小值为0  
    green.maximumValue=255;//设定Green的最打值为1 
    //[lab setTextColor:[UIColor blackColor]];     
}


- (void)viewDidUnload
{
    [super viewDidLoad];  
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
