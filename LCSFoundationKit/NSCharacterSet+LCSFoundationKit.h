//
//  NSCharacterSet+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCharacterSet (LCSFoundationKit)

/**
 *  Returns a character set containing all characters except the ones in the category of Decimal Numbers.
 *
 *  @return A character set containing all characters except the ones in the category of Decimal Numbers.
 */
+ (instancetype)nonDecimalDigitCharacterSet;

/**
 *  Returns a character set containing all characters except the ones in the category of Alphanumeric Numbers.
 *
 *  @return A character set containing all characters except the ones in the category of Alphanumeric Numbers.
 */
+ (instancetype)nonAlphanumericCharacterSet;

@end
