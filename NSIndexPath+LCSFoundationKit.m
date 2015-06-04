//
//  NSIndexPath+LCSFoundationKit.m
//  LCSFoundationKit
//
//  Created by Christoph Lauterbach on 12.01.15.
//  Copyright (c) 2015 Christoph Lauterbach. All rights reserved.
//

#import "NSIndexPath+LCSFoundationKit.h"

@implementation NSIndexPath (LCSFoundationKit)

+ (NSArray*)arrayWithIndexPathsFirstIndex:(NSUInteger)firstIndex secondIndexSex:(NSIndexSet*)secondIndexSet
{
    NSMutableArray *array = [NSMutableArray new];
    [secondIndexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSUInteger indexArr[] = {firstIndex, idx};
        [array addObject:[NSIndexPath indexPathWithIndexes:indexArr length:2]];
    }];
    return array;
}

@end
