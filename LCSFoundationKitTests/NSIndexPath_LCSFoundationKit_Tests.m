//
//  NSIndexPath_LCSFoundationKit_Tests.m
//  LCSFoundationKit
//
//  Created by Christoph Lauterbach on 12.01.15.
//  Copyright (c) 2015 Christoph Lauterbach. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSIndexPath+LCSFoundationKit.h"

@interface NSIndexPath_LCSFoundationKit_Tests : XCTestCase

@end

@implementation NSIndexPath_LCSFoundationKit_Tests

- (void)testIndexPathArray {
    NSArray *array = [NSIndexPath arrayWithIndexPathsFirstIndex:0 secondIndexSex:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 50)]];
    XCTAssertEqual(50, array.count);
    
}

@end
