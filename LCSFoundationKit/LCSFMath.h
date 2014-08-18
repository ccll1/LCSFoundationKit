//
//  LCSFMath.h
//  LCSFoundationKit
//
//  Created by Christoph Lauterbach on 13.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#ifndef LCSFoundationKit_LCSFMath_h
#define LCSFoundationKit_LCSFMath_h

#define CLAMP(x, low, high) ({\
__typeof__(x) __x = (x); \
__typeof__(low) __low = (low);\
__typeof__(high) __high = (high);\
__x > __high ? __high : (__x < __low ? __low : __x);\
})

#endif
