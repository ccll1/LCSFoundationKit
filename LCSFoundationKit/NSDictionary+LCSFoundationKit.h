//
//  NSDictionary+LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LCSFoundationKit)

/**
 *  This is a convenience method for - (NSSet *)keysOfEntriesPassingTest:(BOOL (^)(id key, id obj, BOOL *stop))predicate. It returns the first key whose value is equal to the passed object. Note that because of the nature of NSDictionary, 'first key' is only guaranteed to be always the same if the passed object occurs only once in the receiver.
 *
 *  @param object The object to test for equality.
 *
 *  @return The key whose value is equal to the passed object.
 */
- (id)firstKeyForObject:(id)object;

@end
