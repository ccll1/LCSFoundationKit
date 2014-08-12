//
//  NSData+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LCSFoundationKit)

/**
 *  Calculates and returns the MD5 checksum of the receiver.
 *
 *  @return The MD5 checksum.
 */
- (NSString*)md5Checksum;

/**
 *  Calculates and returns the CRC32 checksum of the receiver.
 *
 *  @return The CRC32 checksum.
 */
- (int)crc32;

@end
