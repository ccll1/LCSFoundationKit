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
 *  @return A random index. If the index set is empty, this method returns <code>NSNotFound</code>.
 */
- (NSUInteger)randomIndex;

/**
 *  Creates and returns an instance of <code>NSIndexSet</code> which contains a subset of the receivers indexes consiting of <code>count</code> random indexes.
 *
 *  @param count The number of desired indexes.
 *
 *  @return The new index set with <code>count</code> elements. If the receiver has no elements, returns an empty index set. If the <code>count</code> parameter is larger than the number of elements in the receiver, returns a copy of the receiver. If the <code>count</code> parameter is <code>0</code>, returns an empty <code>NSIndexSet</code>.
 */
- (instancetype)indexSetWithRandomIndicesCount:(NSUInteger)count;

/**
 *  Returns a new index set formed by adding the indexes in a given index set to the receiving index set.
 *
 *  @param other The index set to add to the receiving set.
 *
 *  @return A new index set formed by adding the objects in <code>other</code> to the receiving set.
 */
- (instancetype)unionIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Returns a new index set formed by the indexes which are existant in the receiver as well as in a given index set.
 *
 *  @param other The index set with which to form the intersection.
 *
 *  @return A new index set formed by the indexes which are existant in the receiver as well as in the given index set.
 */
- (instancetype)intersectIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Returns a new index set formed by the indexes in the receiver minus the indexes in a given index set.
 *
 *  @param other The indexes which should not be existant in the returned index set.
 *
 *  @return A new index set formed by the indexes in the receiver minus the indexes in the given index set.
 */
- (instancetype)minusIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Returns the number of indexes which are existant in both the receiver and a given index set.
 *
 *  @param other The index set with which to form the intersection.
 *
 *  @return The number of indexes which are existant in both the receiver and the given index set.
 */
- (NSUInteger)intersectionCountWithIndexSet:(NSIndexSet * __unsafe_unretained)other;

/**
 *  Executes a given Block using every double combination of the indexes in the receiver. If the receiver contains less than two elements, the block will not be executed.
 *
 *  @param block The Block to apply to elements in the set. The Block takes three arguments:<br/>
 *  <code>idxA</code> The first index of the combination.<br/>
 *  <code>idxB</code> The second index of the combination. This index is always greater than <code>idxA</code>.<br/>
 *  <code>stop</code> A reference to a Boolean value. The block can set the value to <code>YES</code> to stop further processing of the set. The stop argument is an out-only argument. You should only ever set this Boolean to <code>YES</code> within the Block.
*
*   @see enumerateTripleIndexCombinationsUsingBlock:
 */
- (void)enumerateDoubleIndexCombinationsUsingBlock:(void (^)(NSUInteger idxA, NSUInteger idxB, BOOL *stop))block;

/**
 *  Executes a given Block using every triple combination of the indexes in the receiver. If the receiver contains less than two elements, the block will not be executed.
 *
 *  @param block The Block to apply to elements in the set. The Block takes four arguments:<br>
 *  <code>idxA</code> The first index of the combination.<br>
 *  <code>idxB</code> The second index of the combination. This index is always greater than <code>idxA</code>.<br> 
 *  <code>idxC</code> The second index of the combination. This index is always greater than <code>idxB</code>.<br>
 *  <code>stop</code> A reference to a Boolean value. The block can set the value to <code>YES</code> to stop further processing of the set. The stop argument is an out-only argument. You should only ever set this Boolean to <code>YES</code> within the Block.
 *
 *   @see enumerateDoubleIndexCombinationsUsingBlock:
 */
- (void)enumerateTripleIndexCombinationsUsingBlock:(void (^)(NSUInteger idxA, NSUInteger idxB, NSUInteger idxC, BOOL *stop))block;

/**
 *  Returns a NSString with a list of all the indexes in the receiver.
 *
 *  @return A NSString with a list of all the indexes in the receiver.
 */
- (NSString *)listDescription;

@end
