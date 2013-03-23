//
//  RandomObjectFactory.m
//
//  Created by Mark Makdad on 5/30/11.
//  Copyright 2011 Long Weekend LLC, All rights reserved.
//

#import "RandomObjectFactory.h"

// Private interfaces
@interface RandomObjectFactory ()
+ (CGRect) _randomFrame;
+ (UILabel*) _factoryUILabel;
+ (UIButton*) _factoryUIButton;
+ (UIView*) _factoryUIView;
+ (UIColor*) _factoryUIColor;
+ (NSString*) _factoryNSString;
+ (NSDictionary*) _factoryNSDictionary;
+ (NSData*) _factoryNSData;
+ (NSNumber*) _factoryNSNumber;
@end

@implementation RandomObjectFactory

+ (id) randomNSObject
{
  // Seed the random generator & get a random number between 0 - 7
  arc4random_stir();
  NSInteger randomNum = arc4random() % 8;
  
  // Return value of anonymous type, but conforms to NSObject protocol
  id<NSObject> returnObj = nil;
  
  switch (randomNum)
  {
    case 0:
      returnObj = [[self class] _factoryUILabel];
      break;
    case 1:
      returnObj = [[self class] _factoryUIButton];
      break;
    case 2:
      returnObj = [[self class] _factoryUIView];
      break;
    case 3:
      returnObj = [[self class] _factoryUIColor];
      break;
    case 4:
      returnObj = [[self class] _factoryNSString];
      break;
    case 5:
      returnObj = [[self class] _factoryNSDictionary];
      break;
    case 6:
      returnObj = [[self class] _factoryNSNumber];
      break;
    case 7:
      returnObj = [[self class] _factoryNSData];
      break;
  }
  
  return returnObj;
}

#pragma mark -
#pragma mark Private Methods


/**
 * Generates a 100x100 CGRect positioned randomly between
 * (0,100) and (219,199)
 */
+ (CGRect) _randomFrame
{
  CGFloat x = arc4random() % 220;
  CGFloat y = (arc4random() % 200) + 100;
  return CGRectMake(x, y, 100, 100);
}


/**
 * Initializes an autoreleased UILabel with a random frame & default text
 */
+ (UILabel*) _factoryUILabel
{
  CGRect randomFrame = [[self class] _randomFrame];
  UILabel *label = [[[UILabel alloc] initWithFrame:randomFrame] autorelease];
  label.text = @"UILabel";
  return label;
}


/**
 * Initializes an autoreleased UIButton with a random frame & default text
 */
+ (UIButton*) _factoryUIButton
{
  CGRect randomFrame = [[self class] _randomFrame];
  UIButton *button = [[[UIButton alloc] initWithFrame:randomFrame] autorelease];
  button.titleLabel.text = @"UIButton";
  return button;
}


/**
 * Initializes an autoreleased UIView with a random frame
 */
+ (UIView*) _factoryUIView
{
  CGRect randomFrame = [[self class] _randomFrame];
  UIView *aView = [[[UIView alloc] initWithFrame:randomFrame] autorelease];
  return aView;
}


/**
 * Initializes an autoreleased UIColor set to [UIColor greenColor]
 */
+ (UIColor*) _factoryUIColor
{
  return [UIColor greenColor];
}


/**
 * Initializes an autoreleased NSString set to "NSString"
 */
+ (NSString*) _factoryNSString
{
  // Note the extended format here because simply returning @"NSString" would yield
  // an object with retain count of MAX_INT
  return [NSString stringWithString:@"NSString"];
}


/**
 * Initializes an autoreleased NSDictionary, empty
 */
+ (NSDictionary*) _factoryNSDictionary
{
  return [NSDictionary dictionary];
}


/**
 * Initializes an autoreleased NSData, empty
 */
+ (NSData*) _factoryNSData
{
  return [NSData data];
}


/**
 * Initializes an autoreleased NSNumber initialized to 42
 */
+ (NSNumber*) _factoryNSNumber
{
  return [NSNumber numberWithInt:42];
}

@end
