//
//  NSCharacterSet+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSCharacterSet+LCSFoundationKit.h"

@implementation NSCharacterSet (LCSFoundationKit)

+ (instancetype)nonDecimalDigitCharacterSet
{
    static NSCharacterSet *nonDecimalDigitCharacterSet;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nonDecimalDigitCharacterSet = [(NSCharacterSet*)[NSCharacterSet decimalDigitCharacterSet]invertedSet];
    });
    return nonDecimalDigitCharacterSet;
}


+ (instancetype)nonAlphanumericCharacterSet
{
    static NSCharacterSet *nonAlphanumericCharacterset;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nonAlphanumericCharacterset = [(NSCharacterSet*)[NSCharacterSet alphanumericCharacterSet] invertedSet];
    });
    
    return nonAlphanumericCharacterset;
}

@end