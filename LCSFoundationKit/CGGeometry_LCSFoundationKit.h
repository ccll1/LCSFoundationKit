//
//  CGGeometry_LCSFoundationKit.h
//  Christoph Lauterbach's Standard Foundation Kit
//
//  Created by Christoph Lauterbach on 11.08.14.
//  Copyright (c) 2014 Christoph Lauterbach. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

/**
 *  Returns the point of the rect with the maximum X and maximum Y coordinate.
 *
 *  @param rect A rectangle.
 *
 *  @return The point of the rect with the maximum X and maximum Y coordinate.
 */
CGPoint CGRectGetMaxXmaxY(CGRect rect);

/**
 *  Returns the point of the rect with the minimum X and maximum Y coordinate.
 *
 *  @param rect A rectangle.
 *
 *  @return The point of the rect with the minimum X and maximum Y coordinate.
 */
CGPoint CGRectGetMinXmaxY(CGRect rect);

/**
 *  Returns the point of the rect with the minimum X and minimum Y coordinate.
 *
 *  @param rect A rectangle.
 *
 *  @return The point of the rect with the minimum X and minimum Y coordinate.
 */
CGPoint CGRectGetMinXminY(CGRect rect);

/**
 *  Returns the point of the rect with the maximum X and minimum Y coordinate.
 *
 *  @param rect A rectangle.
 *
 *  @return The point of the rect with the maximum X and minimum Y coordinate.
 */
CGPoint CGRectGetMaxXminY(CGRect rect);

/**
 *  Returns the center point of the rect.
 *
 *  @param rect A rectangle.
 *
 *  @return The center point of <code>rect</code>.
 */

CGPoint CGRectGetCenter(CGRect rect);

/**
 *  Returns a rect spanned between the two passed points. The points do not need to be in any particular order. The returned rect is always guaranteed to have positive width and height values.
 *
 *  @param pointA A corner point of the returned rectangle.
 *  @param pointB The opposite corner point of the returned rectangle.
 *
 *  @return A rect spanned between the two passed points.
 */
CGRect CGRectMakeBetweenPoints(CGPoint pointA, CGPoint pointB);


