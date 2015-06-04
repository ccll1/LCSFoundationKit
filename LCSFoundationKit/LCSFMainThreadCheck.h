//
//  LCSFMath.h
//  LCSFoundationKit
//
//  Created by Christoph Lauterbach on 13.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#ifndef LCSFoundationKit_LCSFMainThreadCheck_h
#define LCSFoundationKit_LCSFMainThreadCheck_h

#ifdef DEBUG
#define LCSFAssertMainThread \
do { \
if(!([NSThread isMainThread])) { \
NSString *__LCSFAssertMainThread_temp_string = [NSString stringWithFormat: @"Assertion failure: Code not in main thread in %s on line %s:%d. %@", __func__, __FILE__, __LINE__]; \
NSLog(@"%@", __LCSFAssertMainThread_temp_string); \
__crashreporter_info__ = [__LCSFAssertMainThread_temp_string UTF8String]; \
abort(); \
} \
} while(0)
#else
#define LCSFAssertMainThread \
do {} while(0)
#endif

#endif
