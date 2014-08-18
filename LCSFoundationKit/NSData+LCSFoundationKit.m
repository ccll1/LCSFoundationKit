//
//  NSData+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <CommonCrypto/CommonCrypto.h>
#import <zlib.h>

#import "NSData+LCSFoundationKit.h"

@implementation NSData (LCSFoundationKit)

- (NSString*)md5Checksum
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (int)self.length, result);
    NSString *format = @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x";
    return [NSString stringWithFormat:format,
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

- (int)crc32Checksum
{
    uLong crc = crc32(0, Z_NULL, 0);
    return (int)crc32(crc, self.bytes, (unsigned int)self.length);
}


@end