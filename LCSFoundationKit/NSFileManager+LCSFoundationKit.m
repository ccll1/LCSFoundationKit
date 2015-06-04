//
//  NSFileManager+LCSFoundationKit.m
//  LCSFoundationKit
//
//  Created by Christoph Lauterbach on 20.09.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSFileManager+LCSFoundationKit.h"

@implementation NSFileManager (LCSFoundationKit)

- (NSURL*)libraryURL
{
    return [self URLsForDirectory:NSUserDirectory
                        inDomains:NSUserDomainMask].firstObject;
}

- (NSURL*)documentsURL
{
    return [self URLsForDirectory:NSDocumentDirectory
                        inDomains:NSUserDomainMask].firstObject;
}


@end
