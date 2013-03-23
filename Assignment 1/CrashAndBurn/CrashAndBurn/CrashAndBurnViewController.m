//
//  CrashAndBurnViewController.m
//  CrashAndBurn
//
//  Created by Mark Makdad on 5/30/11.
//  Copyright 2011 Long Weekend LLC, All rights reserved.
//

#import "CrashAndBurnViewController.h"

// Private prototypes
@interface CrashAndBurnViewController ()
- (NSString*) _nextImageFilename;
@end

@implementation CrashAndBurnViewController

@synthesize imageHistory, burnImage;

#pragma mark - IBActions

// Cycle through different images when the user presses the button
- (IBAction) crashAndBurnBtnPressed:(id)sender
{
	NSString *nextImageFilename = [self _nextImageFilename];
    
	// Set the image
    
    UIImage *nextImage = [UIImage imageWithContentsOfFile:nextImageFilename];
   self.burnImage.image = nextImage;
  
  [self.imageHistory addObject:nextImage];
}

#pragma mark - Private Methods

- (NSString*) _nextImageFilename
{
  NSString *nextFilename;
  NSArray *imagePaths = [[NSArray alloc] init];  
  imagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"Assets"];
  // Double-check to make sure the array isn't out of bounds
  if (_nextIndex < [imagePaths count])
  {
      nextFilename = [imagePaths objectAtIndex:_nextIndex];
      _nextIndex++;
  }
  else
  {
      _nextIndex =0;
    nextFilename = [imagePaths objectAtIndex:_nextIndex];
      _nextIndex++;
  }
    return nextFilename;
}

#pragma mark - Class Plumbing

- (void)dealloc
{
  // Release our retained properties
  [imageHistory release];
  [burnImage release];
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.imageHistory = [NSMutableArray array];
  _nextIndex = (NSInteger)self.imageHistory;
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  
  self.burnImage = nil;
}


@end
