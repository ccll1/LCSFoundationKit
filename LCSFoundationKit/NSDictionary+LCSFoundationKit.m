//
//  NSDictionary+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSDictionary+LCSFoundationKit.h"

@implementation NSDictionary (LCSFoundationKit)

- (id)firstKeyForObject:(id)objectToTestFor
{
    NSSet *keySet = [self keysOfEntriesPassingTest:^BOOL(id key, id obj, BOOL *stop) {
        if ([objectToTestFor isEqual:obj]) {
            *stop = YES;
            return YES;
        }
        else {
            return NO;
        }
    }];
    return keySet.anyObject;
}

@end
