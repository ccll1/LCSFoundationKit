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
 *  @return A random object. <code>nil</code> if the receiver contains no objects.
 */
- (id)anyObject;

/**
 *  Returns a random object of the receiver and stores the index of the object in an out-only parameter.
 *
 *  @param index A index index of the returned object. Out-only. <code>NSNotFound</code> if the receiver contains no objects.
 *
 *  @return A random object. <code>nil</code> if the receiver contains no objects.
 */
- (id)anyObjectStoreIndexIn:(NSUInteger*)index;

/**
 *  Enumerates all combinations of the objects stored in the receiver. idxA is always guaranteed to be less than idxB. Doesn't do anything if the receiver contains less than two elements.
 *
 *  @param block A block to execute.
 */
- (void)enumerateDoubleCombinationsObjectsUsingBlock:(void (^)(id objA, NSUInteger idxA, id objB, NSUInteger idxB, BOOL * stop))block;


/**
 *  Returns an index set covering all indexes in the receiver.
 */
@property (readonly) NSIndexSet *allIndexes;

@end
