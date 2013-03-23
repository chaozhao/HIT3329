//
//  CrashAndBurnViewController.h
//  CrashAndBurn
//
//  Created by Mark Makdad on 5/30/11.
//  Copyright 2011 Long Weekend LLC, All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrashAndBurnViewController : UIViewController
{
  NSInteger _nextIndex;
}

- (IBAction) crashAndBurnBtnPressed:(id)sender;

@property (retain) NSMutableArray *imageHistory;
@property (retain, nonatomic) IBOutlet UIImageView *burnImage;

@end
