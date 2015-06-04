//
//  NSIndexPath+LCSFoundationKit.h
//  LCSFoundationKit
//
//  Created by Christoph Lauterbach on 12.01.15.
//  Copyright (c) 2015 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (LCSFoundationKit)

+ (NSArray*)arrayWithIndexPathsFirstIndex:(NSUInteger)firstIndex secondIndexSex:(NSIndexSet*)secondIndexSet;

@end
