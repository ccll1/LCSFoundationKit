//
//  NSArray+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSArray+LCSFoundationKit.h"

@implementation NSArray (LCSFoundationKit)

- (instancetype)shuffledArray
{
    NSMutableArray *shuffledArray = [self mutableCopy];
    
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    return [shuffledArray copy];
}

- (id)anyObject
{
    return [self anyObjectStoreIndexIn:NULL];
}

- (id)anyObjectStoreIndexIn:(NSUInteger*)returnIndex
{
    NSUInteger count = self.count;
    if (count == 0) {
        if (returnIndex != NULL) {
            *returnIndex = NSNotFound;
        }

        return nil;
    }
    else {
        NSUInteger index = arc4random_uniform((unsigned int)count);
        
        if (returnIndex != NULL) {
            *returnIndex = index;
        }
        
        return self[index];
    }
}

- (void)enumerateDoubleCombinationsObjectsUsingBlock:(void (^)(id objA, NSUInteger idxA, id objB, NSUInteger idxB, BOOL * stop))block
{
    NSUInteger count = self.count;
    if (count < 2) {
        return;
    }
    
    NSFastEnumerationState state;
    state.state = 0;
    state.itemsPtr = NULL;
    state.mutationsPtr = NULL;
    
    __unsafe_unretained id objects[count];
    
    [self countByEnumeratingWithState:&state objects:objects count:count];
    
    BOOL stop = NO;
    
    for (NSUInteger i = 0; i < count-1; i++) {
        for (NSUInteger j = i + 1; j < count; j++) {
            block(state.itemsPtr[i], i, state.itemsPtr[j], j, &stop);
            
            if (stop) {
                return;
            }
        }
    }
}

- (NSIndexSet*)allIndexes
{
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.count)];
}

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block {
    if (block == nil) {
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:block(obj, idx)];
    }];
    
    return [result copy];
}


@end
