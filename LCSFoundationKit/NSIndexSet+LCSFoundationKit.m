//
//  NSIndexSet+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSIndexSet+LCSFoundationKit.h"

@implementation NSIndexSet (LCSFoundationKit)

- (NSUInteger)randomIndex
{
    NSUInteger count    = self.count;
    
    if (count == 0) {
        return NSNotFound;
    }
    
    NSUInteger *indices = malloc(sizeof(NSUInteger) * count);
    [self getIndexes:indices maxCount:count inIndexRange:nil];

    NSUInteger randomIndex = indices[arc4random_uniform((unsigned int)count)];

    free(indices);

    return randomIndex;
}

- (NSIndexSet *)indexSetWithRandomIndicesCount:(NSUInteger)requestedCount
{
    NSUInteger count    = self.count;
    
    if (count == 0) {
        return [NSIndexSet new];
    }
    else if (requestedCount > count) {
        return [self copy];
    }
    
    NSUInteger *indices = malloc(sizeof(NSUInteger) * count);
    [self getIndexes:indices maxCount:count inIndexRange:nil];

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];

    do {
        [indexSet addIndex:indices[arc4random_uniform((unsigned int)count)]];
    } while (indexSet.count < requestedCount);

    free(indices);

    return [indexSet copy];
}

- (NSIndexSet *)unionIndexSet:(NSIndexSet * __unsafe_unretained)otherIndexSet
{
    NSMutableIndexSet *resultIndexSet = [self mutableCopy];
    [resultIndexSet addIndexes:otherIndexSet];
    return resultIndexSet;
}

- (NSIndexSet *)intersectIndexSet:(NSIndexSet * __unsafe_unretained)otherIndexSet
{
    NSIndexSet *resultIndexSet = [self indexesPassingTest:^BOOL(NSUInteger idx, BOOL *stop)
    {
        return [otherIndexSet containsIndex:idx];
    }];
    return resultIndexSet;
}

- (NSIndexSet *)minusIndexSet:(NSIndexSet * __unsafe_unretained)otherIndexSet
{
    NSIndexSet *resultIndexSet = [self indexesPassingTest:^BOOL(NSUInteger idx, BOOL *stop)
    {
        return ![otherIndexSet containsIndex:idx];
    }];
    return resultIndexSet;
}

- (NSUInteger)intersectionCountWithIndexSet:(NSIndexSet * __unsafe_unretained)otherIndexSet
{
    __block NSUInteger intersectionCount = 0;
    [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
    {
        if ([otherIndexSet containsIndex:idx]) {
            intersectionCount++;
        }
    }];

    return intersectionCount;
}

- (void)enumerateDoubleIndexCombinationsUsingBlock:(void (^)(NSUInteger idxA, NSUInteger idxB, BOOL *stop))block
{
    NSUInteger count = self.count;
    if (count < 2) {
        return;
    }

    NSUInteger *indices = malloc(sizeof(NSUInteger) * count);
    [self getIndexes:indices maxCount:count inIndexRange:nil];

    BOOL            stop = NO;
    for (NSUInteger idxA = 0; idxA < count - 1; idxA++) {
        for (NSUInteger idxB = idxA + 1; idxB < count; idxB++) {
            block(indices[idxA], indices[idxB], &stop);

            if (stop) {
                idxA = count;
                break;
            }
        }
    }
    free(indices);
}

- (void)enumerateTripleIndexCombinationsUsingBlock:(void (^)(NSUInteger, NSUInteger, NSUInteger, BOOL *))block
{
    NSUInteger count = self.count;
    if (count < 3) {
        return;
    }

    NSUInteger *indices = malloc(sizeof(NSUInteger) * count);
    [self getIndexes:indices maxCount:count inIndexRange:nil];

    BOOL            stop = NO;
    for (NSUInteger idxA = 0; idxA < count - 2; idxA++) {
        for (NSUInteger idxB = idxA + 1; idxB < count - 1; idxB++) {
            for (NSUInteger idxC = idxB + 1; idxC < count; idxC++) {
                block(indices[idxA], indices[idxB], indices[idxC], &stop);

                if (stop) {
                    idxA = count;
                    idxB = count;
                    break;
                }
            }
        }
    }

    free(indices);
}

- (NSString *)listDescription
{
    NSMutableString *string = [NSMutableString stringWithString:@"("];
    [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
    {
        [string appendFormat:@"%lu, ", (unsigned long) idx];
    }];
    if (self.count > 0) {
        [string replaceCharactersInRange:NSMakeRange(string.length - 2, 2) withString:@")"];
    }
    else {
        [string appendString:@")"];
    }
    return string;
}

@end
