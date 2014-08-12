//
//  NSArray+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSArray+LCSFoundationKit.h"

@implementation NSArray (LCSFoundationKit)

- (id)anyObject
{
    return [self anyObjectStoreIndexIn:NULL];
}

- (id)anyObjectStoreIndexIn:(NSUInteger*)returnIndex
{
    NSUInteger count = self.count;
    if (count == 0) {
        *returnIndex = NSNotFound;
        return nil;
    }
    
    NSUInteger index = arc4random_uniform((unsigned int)count);
    
    *returnIndex = index;
    
    return self[index];
}

@end
