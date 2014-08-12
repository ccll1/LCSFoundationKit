//
//  LCSFoundationKitTests.m
//  LCSFoundationKitTests
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSRegularExpression+LCSFoundationKit.h"

@interface NSRegularExpression_LCSFoundationKit_Tests : XCTestCase

@end

@implementation NSRegularExpression_LCSFoundationKit_Tests

- (void)testPositiveEmailRE
{
    NSArray *testStrings;
    testStrings = @[@"info@apple.com", @"x.x.x@email.x.com", @"mailto:info@apple.com", @"test+test@test.com"];
    
    for (NSString *testString in testStrings) {
        NSTextCheckingResult *result;
        result = [[NSRegularExpression emailRE] firstMatchInString:testString options:0 range:NSMakeRange(0, testString.length)];
        
        XCTAssertNotNil(result);
        XCTAssertTrue(result.numberOfRanges > 0);
        XCTAssertNotEqual([result rangeAtIndex:0].location, NSNotFound);
        
    }
}

- (void)testNegativeEmailRE
{
    NSLog(@"%@", [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 8)].description);
    
    NSArray *testStrings;
    testStrings = @[@"not an email", @"info @ apple.com", @"@apple.com", @""];
    
    for (NSString *testString in testStrings) {
        NSTextCheckingResult *result;
        result = [[NSRegularExpression emailRE] firstMatchInString:testString options:0 range:NSMakeRange(0, testString.length)];
        
        XCTAssertNil(result);
    }
}

- (void)testPositiveWebUrlRE
{
    NSArray *testStrings;
    testStrings = @[@"www.apple.com", @"http://www.apple.com", @"http://apple.com", @"https://www.apple.com", @"https://www.apple.com/support", @"https://www.apple.com/support"];
    
    for (NSString *testString in testStrings) {
        NSTextCheckingResult *result;
        result = [[NSRegularExpression webUrlRE] firstMatchInString:testString options:0 range:NSMakeRange(0, testString.length)];
        
        XCTAssertNotNil(result);
        XCTAssertTrue(result.numberOfRanges > 0);
        XCTAssertNotEqual([result rangeAtIndex:0].location, NSNotFound);
        
    }
}

- (void)testNegativeWebUrlRE
{
    NSArray *testStrings;
    testStrings = @[@"not an web url", @"apple.com", @"info@apple.com", @""];
    
    for (NSString *testString in testStrings) {
        NSTextCheckingResult *result;
        result = [[NSRegularExpression webUrlRE] firstMatchInString:testString options:0 range:NSMakeRange(0, testString.length)];
        
        XCTAssertNil(result);
    }
}

@end
