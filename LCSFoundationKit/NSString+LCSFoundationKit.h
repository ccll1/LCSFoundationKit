//
//  NSString+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LCSFoundationKit)

/**
 *  Creates and returns a new UUID string, using CFUUIDCreate().
 *
 *  @return A new UUID string.
 */
+ (instancetype)UUIDString;

/**
 *  Returns the MD5 checksum of the receiver, using UTF8 encoding.
 */
@property (copy,readonly,nonatomic) NSString *md5;

/**
 *  Returns the CRC32 checksum of the receiver, using UTF8 encoding.
 */
@property (readonly,nonatomic) int crc32;

/**
 *  Returns a NSRange covering the whole receiver. Shortcut for NSMakeRange(0, self.length).
 */
@property (readonly,nonatomic) NSRange completeRange;

/**
 *  Creates and returns a new string with all of the characters from the given set removed.
 *
 *  @param characterSet A character set with characters to remove from the string. Must not be nil.
 *
 *  @return A new string with all of the characters from the given set removed.
 */
- (instancetype)stringByStrippingByCharactersFromSet:(NSCharacterSet*)characterSet;

/**
 *  Tests weather the receiver has a prefix from the given set.
 *
 *  @param prefixSet A set with NSString's. Must not be nil.
 *
 *  @return YES if the receiver begins with on of the strings of the passed set, NO otherwise.
 */
- (BOOL)hasPrefixFromSet:(NSSet*)prefixSet;

/**
 *  Appends the passed salt string to the receiver and then returns the MD5 checksum for the combined string.
 *
 *  @param salt A string to salt the receiver with.
 *
 *  @return A MD5 checksum for the salted string.
 */
- (NSString*)md5WithAppendedSalt:(NSString*)salt;

/**
 *  Removes the number of given whitesspaces from each line of the receiver and returns the new string. If a line doesn't have the specified number of whitespaces at the start, the method removes as much whitespaces as possible.
 *
 *  @param numberOfWhitespaces The number of whitespaces to remove from the start of each line.
 *
 *  @return The shifted string.
 */
- (NSString*)stringByShiftingLeftByNumberOfWhitespaces:(NSUInteger)numberOfWhitespaces;

/**
 *  Prepends the number of given whitespaces to each line of the receiver and returns the new string.
 *
 *  @param numberOfWhitespaces The number of whitespaces to prepend to each line.
 *
 *  @return The shifted string.
 */
- (NSString*)stringByShiftingRightByNumberOfWhitespaces:(NSUInteger)numberOfWhitespaces;

/**
 *  Returns the user part of an email address. Returns nil if the string is not a valid email address.
 */
@property (readonly,nonatomic) NSString *userForEmailString;

/**
 *  Returns the domain part of an email address. Returns nil if the string is not a valid email address.
 */
@property (readonly,nonatomic) NSString *domainForEmailString;

/**
 *  Returns the domain part of an web url string. Returns nil if the string is not a valid web url address.
 */
@property (readonly,nonatomic) NSString *domainForUrlString;

/**
 *  Returns the top level domain part of an email address. Returns nil if the string is not a valid email address.
 */
@property (readonly,nonatomic) NSString *tldForEmailString;

/**
 *  Returns the top level domain part of an web url address. Returns nil if the string is not a valid web url address.
 */
@property (readonly,nonatomic) NSString *tldForUrlString;

@end
