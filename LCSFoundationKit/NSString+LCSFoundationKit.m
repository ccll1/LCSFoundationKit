//
//  NSString+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSString+LCSFoundationKit.h"

#import "NSCharacterSet+LCSFoundationKit.h"
#import "NSRegularExpression+LCSFoundationKit.h"
#import "NSData+LCSFoundationKit.h"

#import <zlib.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (LCSFoundationKit)

+ (instancetype)UUIDString
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (NSString *)CFBridgingRelease(string);
}

- (BOOL)hasPrefixFromSet:(NSSet*)prefixSet
{
    NSParameterAssert(prefixSet != nil);
    
    NSSet *matchingPrefixes = [prefixSet objectsPassingTest:^BOOL(NSString *prefix, BOOL *stop) {
        if ([self hasPrefix:prefix]) {
            *stop = YES;
            return YES;
        }
        else {
            return NO;
        }
    }];
    
    return (matchingPrefixes.count > 0);
}

- (NSString *)md5WithAppendedSalt:(NSString *)salt
{
    NSParameterAssert(salt != nil);
    return [NSString stringWithFormat:@"%@%@", self, salt].md5;
}

- (NSString *)md5
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.md5Checksum;
}

 -(int)crc32Checksum
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return data.crc32Checksum;
}

- (NSString*)stringByStrippingByCharactersFromSet:(NSCharacterSet*)characterSet
{
    NSParameterAssert(characterSet != nil);

    NSArray *components = [self componentsSeparatedByCharactersInSet:characterSet];
    return [components componentsJoinedByString:@""];
}

- (NSString*)stringByShiftingLeftByNumberOfWhitespaces:(NSUInteger)numberOfWhitespaces
{
    NSString *regexPattern = [NSString stringWithFormat:@"^ {1,%lu}", (unsigned long)numberOfWhitespaces];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexPattern
                                                                           options:NSRegularExpressionAnchorsMatchLines
                                                                             error:nil];
    return [regex stringByReplacingMatchesInString:self
                                           options:0
                                             range:self.completeRange
                                      withTemplate:@""];
}

- (NSString*)stringByShiftingRightByNumberOfWhitespaces:(NSUInteger)numberOfWhitespaces
{
    NSString *whitespaceString = [@"" stringByPaddingToLength:numberOfWhitespaces+1
                                                   withString:@" "
                                              startingAtIndex:0];
    
    NSString *newString = [self stringByReplacingOccurrencesOfString:@"\n"
                                                          withString:[NSString stringWithFormat:@"\n%@", whitespaceString]];
    return [NSString stringWithFormat:@"%@%@", whitespaceString, newString];
}

- (NSRange)rangeOfStringShortenedToLastWordInRange:(NSRange)range
{
    static NSRegularExpression *static_wordCutRegex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static_wordCutRegex = [NSRegularExpression regularExpressionWithPattern:@"\\s+\\S*$" options:NSRegularExpressionCaseInsensitive|NSRegularExpressionUseUnicodeWordBoundaries error:nil];
//        static_wordCutRegex = [NSRegularExpression regularExpressionWithPattern:@"\\b.*$" options:NSRegularExpressionCaseInsensitive|NSRegularExpressionUseUnicodeWordBoundaries error:nil];
    });

    NSTextCheckingResult *result = [static_wordCutRegex firstMatchInString:self
                                                                   options:0
                                                                     range:range];
    
    if (result.range.location == 0) {
        return range;
    }
    else {
        return NSMakeRange(0, result.range.location);
    }
}

- (NSRange)rangeOfStringShortenedToLastSentenceInRange:(NSRange)range
{
    static NSRegularExpression *static_sentenceCutRegex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static_sentenceCutRegex = [NSRegularExpression regularExpressionWithPattern:@"[^\\.!?。，]+$|(?<=[\\.!?。，])$"
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:nil];
    });
    NSTextCheckingResult *result = [static_sentenceCutRegex firstMatchInString:self
                                                                       options:0
                                                                         range:range];
    
    if (result.range.location == 0) {
        return range;
    }
    else {
        return NSMakeRange(0, result.range.location);
    }
}



- (NSRange)completeRange
{
    return NSMakeRange(0, self.length);
}

- (NSString*)userForEmailString
{
    NSRange match = [self rangeOfString:@"@"];
    
    if (match.location != NSNotFound) {
        return [self substringToIndex:match.location];
    }
    else {
        return nil;
    }
}

- (NSString*)domainForEmailString
{
    NSRange match = [self rangeOfString:@"@"];
    if (match.location != NSNotFound && match.location < self.length-1) {
        return [self substringFromIndex:match.location+1];
    }
    else {
        return nil;
    }
}

- (NSString*)tldForEmailString
{
    NSRange range = [self rangeOfString:@"." options:NSBackwardsSearch];
    
    if (range.location != NSNotFound && NSMaxRange(range) < self.length) {
        return [self substringFromIndex:range.location+1];
    }
    else {
        return nil;
    }
}

- (NSString*)domainForUrlString
{
    NSTextCheckingResult *match = [[NSRegularExpression webUrlRE] firstMatchInString:self options:0 range:self.completeRange];
    
    if ([match rangeAtIndex:1].location != NSNotFound) {
        return [self substringWithRange:[match rangeAtIndex:1]];
    }
    else {
        return nil;
    }
}

- (NSString*)tldForUrlString
{
    NSTextCheckingResult *match = [[NSRegularExpression webUrlRE] firstMatchInString:self options:0 range:self.completeRange];
    
    if ([match rangeAtIndex:2].location != NSNotFound) {
        return [self substringWithRange:[match rangeAtIndex:2]];
    }
    else {
        return nil;
    }
}

//- (NSString*)stringByUnescapingEntities
//{
//    NSAssert(YES, @"always fail");
//    return nil;
////    return CFBridgingRelease(CFXMLCreateStringByUnescapingEntities(NULL, (CFStringRef)CFBridgingRetain(self), NULL));
//}

@end
