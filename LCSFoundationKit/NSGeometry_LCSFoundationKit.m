//
//  NSGeometry_LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "NSGeometry_LCSFoundationKit.h"

NSPoint NSRectGetMaxXmaxY(NSRect rect) {
    return NSMakePoint(NSMaxX(rect), NSMaxY(rect));
}

NSPoint NSRectGetMinXmaxY(NSRect rect) {
    return NSMakePoint(NSMinX(rect), NSMaxY(rect));
}

NSPoint NSRectGetMinXminY(NSRect rect) {
    return NSMakePoint(NSMinX(rect), NSMinY(rect));
}

NSPoint NSRectGetMaxXminY(NSRect rect) {
    return NSMakePoint(NSMaxX(rect), NSMinY(rect));
}

NSPoint NSRectGetCenter(NSRect rect) {
    return NSMakePoint(NSMidX(rect), NSMidY(rect));
}

NSRect NSRectMakeBetweenPoints(NSPoint pointA, NSPoint pointB) {
    NSRect rect;
    
    if (pointA.x < pointB.x) {
        rect.origin.x = pointA.x;
        rect.size.width = pointB.x - pointA.x;
    }
    else {
        rect.origin.x = pointB.x;
        rect.size.width = pointA.x - pointB.x;
    }
    
    if (pointA.y < pointB.y) {
        rect.origin.y = pointA.y;
        rect.size.height = pointB.y - pointA.y;
    }
    else {
        rect.origin.y = pointB.y;
        rect.size.height = pointA.y - pointB.y;
    }
    
    return rect;
}