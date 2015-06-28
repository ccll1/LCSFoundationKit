//
//  NSOperation+AddDependencies.h
//  ReviewsBackend
//
//  Created by Christoph Lauterbach on 15.06.15.
//  Copyright © 2015 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperation (AddDependencies)

- (void)addDependencies:(nonnull NSArray *)operations;

@end
