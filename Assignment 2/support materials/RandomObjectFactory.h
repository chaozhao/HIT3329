//
//  RandomObjectFactory.h
//
//  Created by Mark Makdad on 5/30/11.
//  Copyright 2011 Long Weekend LLC, All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomObjectFactory : NSObject

/**
 * \brief     Static factory method to generate NSObject subclasses, randomly
 * \return    An NSObject-subclass Objective-C object.
 * \details   The object is autoreleased.
 */
+ (id) randomNSObject;

@end
