//
//  NSMutableArray+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.06.2015.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSMutableArray+LCSFoundationKit.h"

@implementation NSMutableArray (LCSFoundationKit)

- (void)shuffle
{
    NSUInteger count = self.count;
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
