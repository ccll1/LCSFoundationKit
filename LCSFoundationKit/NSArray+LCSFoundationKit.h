//
//  NSArray+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LCSFoundationKit)

/**
 *  Returns a random object of the receiver.
 *
 *  @return A random object. nil if the receiver contains no objects.
 */
- (id)anyObject;

/**
 *  Returns a random object of the receiver and stores the index of the object in an out-only parameter.
 *
 *  @param index A index index of the returned object. Out-only. NSNotFound if the receiver contains no objects.
 *
 *  @return A random object. nil if the receiver contains no objects.
 */
- (id)anyObjectStoreIndexIn:(NSUInteger*)index;

@end
