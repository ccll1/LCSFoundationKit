//
//  NSRegularExpression+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSRegularExpression (LCSFoundationKit)

/**
 *  An instance of NSRegularExpression which allows testing for an email address. The email address may contain a mailto: prefix.
 *
 *  @return An instance of <code>NSRegularExpression</code> which allows testing for an email address. There are three captured groups:<br>
 *  1) the user part of the email address.<br>
 *  2) the domain part of the email address (including the top level domain).<br>
 *  3) The top level domain.
 */
+ (instancetype)emailRE;

/**
 *  An instance of NSRegularExpression which allows testing for a web URL. Examples of matched URLs are 'http://github.com', 'https://github.com', 'http://github.com/ccll1', 'www.github.com' etc.
 *
 *  @return An instance of <code>NSRegularExpression</code> which allows testing for a web url.
 */
+ (instancetype)webUrlRE;

/**
 *  This is a convenience method for the lengthy <code>+ (NSRegularExpression *)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError **)error</code> with the passed pattern and only <code>NSRegularExpressionCaseInsensitive</code> as option. An exception is thrown if the pattern doesn't compile.
 *
 *  @param pattern The pattern to compile.
 *
 *  @return An instance of <code>NSRegularExpression</code>.
 */
+ (instancetype)re:(NSString*)pattern;

/**
 *  This is a convenience method for the lengthy <code>+ (NSRegularExpression *)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError **)error</code> with only the passed pattern and options. An exception is thrown if the pattern doesn't compile.
 *
 *  @param pattern The pattern to compile.
 *  @param options The options of the regular expression.
 *
 *  @return An instance of <code>NSRegularExpression</code>.
 */
+ (instancetype)re:(NSString*)pattern options:(NSRegularExpressionOptions)options;

/**
 *  Returns <code>YES</code> if the receiver matches the complete passed string.
 *
 *  @param string A string to test for. Must not be <code>nil</code>.
 *
 *  @return <code>YES</code> if the receiver matches the whole string, <code>NO</code> otherwise.
 */
- (BOOL)matchesCompleteString:(NSString *)string;

/**
 *  Returns <code>YES</code> if the receiver matches the passed string.
 *
 *  @param string A string to test for. Must not be <code>nil</code>.
 *
 *  @return <code>YES</code> if the receiver matches the string, <code>NO</code> otherwise.
 */
- (BOOL)matchesString:(NSString*)string;

/**
 *  Returns <code>YES</code> if the receiver matches the passed string with the given options.
 *
 *  @param string  A string to test for. Must not be <code>nil</code>.
 *  @param options The options for the test.
 *
 *  @return <code>YES</code> if the receiver matches the string, <code>NO</code> otherwise.
 */
- (BOOL)matchesString:(NSString*)string options:(NSMatchingOptions)options;

@end
