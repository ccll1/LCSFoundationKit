//
//  NSURL+LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSURL+LCSFoundationKit.h"

@implementation NSURL (LCSFoundationKit)

+ (NSString*)queryStringOfComponents:(NSDictionary*)queryComponents
{
    __block NSString *queryString = @"";
    [queryComponents enumerateKeysAndObjectsUsingBlock:^(NSString *key, id value, BOOL *stop) {
        queryString = [NSString stringWithFormat:@"%@&%@=%@", queryString, key, [value description]];
    }];
    queryString = [queryString substringFromIndex:1];
    
    return queryString;
}

- (NSDictionary*)queryComponents
{
    NSString *queryString = self.query;
    
    if (queryString.length == 0) {
        return nil;
    }
    
    NSArray *queryPairs = [queryString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"&"]];
    
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    
    for (NSString *queryPairString in queryPairs) {
        NSArray *queryPair = [queryPairString componentsSeparatedByString:@"="];
        
        if (queryPair.count != 2) {
            continue;
        }
        
        queryComponents[queryPair.firstObject] = queryPair.lastObject;
    }
    
    return [queryComponents copy];
}

@end
