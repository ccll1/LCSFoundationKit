//
//  NSRegularExpression+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//


@interface NSRegularExpression (LCSFoundationKit)

/**
 *  An instance of NSRegularExpression which allows testing for an email address. The email address may contain a mailto: prefix.
 *
 *  @return An instance of NSRegularExpression which allows testing for an email address. There are three captured groups: A) the user part of the email address. B) the domain part of the email address (including the top level domain). C) The top level domain.
 */
+ (instancetype)emailRE;

/**
 *  An instance of NSRegularExpression which allows testing for a web URL. Examples of matched URLs are 'http://github.com', 'https://github.com', 'http://github.com/ccll1', 'www.github.com' etc.
 *
 *  @return An instance of NSRegularExpression which allows testing for a web url.
 */
+ (instancetype)webUrlRE;

/**
 *  This is a convenience method for the length + (NSRegularExpression *)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError **)error with the passed pattern and only NSRegularExpressionCaseInsensitive as option. An exception is thrown if the pattern doesn't compile.
 *
 *  @param pattern The pattern to compile.
 *
 *  @return An instance of NSRegularExpression.
 */
+ (instancetype)re:(NSString*)pattern;

/**
 *  This is a convenience method for the length + (NSRegularExpression *)regularExpressionWithPattern:(NSString *)pattern options:(NSRegularExpressionOptions)options error:(NSError **)error with only the passed pattern and options. An exception is thrown if the pattern doesn't compile.
 *
 *  @param pattern The pattern to compile.
 *  @param options The options of the regular expression.
 *
 *  @return An instance of NSRegularExpression.
 */
+ (instancetype)re:(NSString*)pattern options:(NSRegularExpressionOptions)options;

/**
 *  Returns YES if the receiver matches the complete passed string.
 *
 *  @param string A string to test for. Must not be nil.
 *
 *  @return YES if the receiver matches the whole string, NO otherwise.
 */
- (BOOL)matchesCompleteString:(NSString *)string;

/**
 *  Returns YES if the receiver matches the passed string.
 *
 *  @param string A string to test for. Must not be nil.
 *
 *  @return YES if the receiver matches the string, NO otherwise.
 */
- (BOOL)matchesString:(NSString*)string;

/**
 *  Returns YES if the receiver matches the passed string with the given options.
 *
 *  @param string  A string to test for. Must not be nil.
 *  @param options The options for the test.
 *
 *  @return YES if the receiver matches the string, NO otherwise.
 */
- (BOOL)matchesString:(NSString*)string options:(NSMatchingOptions)options;

@end
