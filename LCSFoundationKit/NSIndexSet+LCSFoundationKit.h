//
//  NSIndexSet+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexSet (LCSFoundationKit)

/**
 *  Returns a random index from the index set.
 *
 *  @return A random index. If the index set doesn't contain any indexes, this method return NSNotFound.
 */
- (NSUInteger)randomIndex;

/**
 *  Creates and returns an instance of NSIndexSet which contains a subset of the receivers indexes consiting of count random indexes.
 *
 *  @param count The number of desired indexes.
 *
 *  @return The new index set with count elements. If the receiver has no elements, returns an empty index set. If the count parameter is larger than the number of elements in the receiver, returns a copy of the receiver.
 */
- (instancetype)indexSetWithRandomIndicesCount:(NSUInteger)count;

/**
 *  Returns a new index set formed by adding the indexes in a given index set to the receiving index set.
 *
 *  @param other The index set to add to the receiving set.
 *
 *  @return A new index set formed by adding the objects in other to the receiving set.
 */
- (instancetype)unionIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Returns a new index set formed by the indexes which are existant in the receiver as well as in a given index set.
 *
 *  @param other The index set with which to form the intersection.
 *
 *  @return A new index set formed by the indexes which are existant in the receiver as well as in a given index set.
 */
- (instancetype)intersectIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Returns a new index set formed by the indexes in the receiver minus the indexes in a given index set.
 *
 *  @param other The indexes which should not be existant in the returned index set.
 *
 *  @return A new index set formed by the indexes in the receiver minus the indexes in a given index set.
 */
- (instancetype)minusIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Returns the number of indexes which are existant in both the receiver and a given index set.
 *
 *  @param other The index set with which to form the intersection.
 *
 *  @return The number of indexes which are existant in both the receiver and a given index set.
 */
- (NSUInteger)intersectionCountWithIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Executes a given Block using every double combination of the indexes in the receiver. If the receiver contains less than two elements, the block will not be executed.
 *
 *  @param block The Block to apply to elements in the set. The Block takes three arguments: idxA) The first index of the combination. idxB) The second index of the combination. This index is always greater than idxA. stop) A reference to a Boolean value. The block can set the value to YES to stop further processing of the set. The stop argument is an out-only argument. You should only ever set this Boolean to YES within the Block.
 */
- (void)enumerateDoubleIndexCombinationsUsingBlock:(void (^)(NSUInteger idxA, NSUInteger idxB, BOOL *stop))block;

/**
 *  Executes a given Block using every triple combination of the indexes in the receiver. If the receiver contains less than two elements, the block will not be executed.
 *
 *  @param block The Block to apply to elements in the set. The Block takes four arguments: idxA) The first index of the combination. idxB) The second index of the combination. This index is always greater than idxA. idxC) The second index of the combination. This index is always greater than idxB. stop) A reference to a Boolean value. The block can set the value to YES to stop further processing of the set. The stop argument is an out-only argument. You should only ever set this Boolean to YES within the Block.
 */
- (void)enumerateTripleIndexCombinationsUsingBlock:(void (^)(NSUInteger idxA, NSUInteger idxB, NSUInteger idxC, BOOL *stop))block;

/**
 *  Returns a NSString with a list of all the indexes in the receiver.
 *
 *  @return A NSString with a list of all the indexes in the receiver.
 */
- (NSString *)listDescription;

@end
