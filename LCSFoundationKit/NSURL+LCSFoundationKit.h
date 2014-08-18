//
//  NSURL+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (LCSFoundationKit)

/**
 *  Takes a dictionary of strings and forms a query string. For example, a dictionary of <code>@{@"key1": @"value1", @"key2", @"value2"}</code> returns <code>@"key1=value1&key2=value2"</code>. Returns an zero-length string if the passed dictionary is <code>nil</code> or if it contains no elements.
 *
 *  @param queryComponents The input dictionary
 *
 *  @return The query string.
 */
+ (NSString*)queryStringOfComponents:(NSDictionary*)queryComponents;

/**
 *  Returns a dictionary with the query string split into key-value pairs. For example, if the receiver has a query string of <code>@"key1=value1&key2=value2"</code>, this method returns <code>@{@"key1": @"value1", @"key2", @"value2"}</code>
 */
@property (readonly,nonatomic) NSDictionary *queryComponents;

@end
