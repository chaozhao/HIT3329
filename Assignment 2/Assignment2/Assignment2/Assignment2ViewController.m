//
//  Assignment2ViewController.m
//  Assignment2
//
//  Created by Chao Zhao on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Assignment2ViewController.h"
#import "RandomObjectFactory.h"

@implementation Assignment2ViewController

-(IBAction)pressMe:(id)sender
{
    id aObj =  [RandomObjectFactory randomNSObject];
    if([aObj isKindOfClass:[UIView class]])
    {
        UIView *myView =(UIView*) aObj;
        if([myView respondsToSelector:@selector(backgroundColor)])
        {
            CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX; 
            CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
            CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
            UIColor *randomColor = [UIColor colorWithRed:red green:blue blue:green alpha:1];
            myView.backgroundColor = randomColor;
            [self.view addSubview:myView];
        }
    }
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
