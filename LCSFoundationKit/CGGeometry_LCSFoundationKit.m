//
//  CGGeometry_LCSFoundationKit.m
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import "CGGeometry_LCSFoundationKit.h"

CGPoint CGRectGetMaxXmaxY(CGRect rect) {
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetMinXmaxY(CGRect rect) {
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
}

CGPoint CGRectGetMinXminY(CGRect rect) {
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetMaxXminY(CGRect rect) {
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
}

CGPoint CGRectGetCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect CGRectMakeBetweenPoints(CGPoint pointA, CGPoint pointB) {
    CGRect rect;
    
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

CGFloat CGPointsDistance(CGPoint pointA, CGPoint pointB)
{
    return sqrt(pow(pointA.x - pointB.x, 2.0) + pow(pointA.y - pointB.y, 2.0));
}
