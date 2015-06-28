//
//  NSOperation+AddDependencies.m
//  ReviewsBackend
//
//  Created by Christoph Lauterbach on 15.06.15.
//  Copyright © 2015 Christoph Lauterbach. All rights reserved.
//

#import "NSOperation+AddDependencies.h"

@implementation NSOperation (AddDependencies)

- (void)addDependencies:(nonnull NSArray *)operations
{
    for (NSOperation *operation in operations) {
        [self addDependency:operation];
    }
}

@end
