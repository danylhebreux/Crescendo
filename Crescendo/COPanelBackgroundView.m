//
//  COPanelBackgroundView.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COPanelBackgroundView.h"

static const NSSize ArrowSize = { 15.0f, 12.0f };
static const CGFloat FillOpacity = 0.95f;
static const CGFloat StrokeOpacity = 1.0f;
static const CGFloat LineThickness = 1.0f;
static const CGFloat CornerRadius = 15.0f;
static const NSEdgeInsets Padding = { 20.0f, 20.0f, 20.0f, 20.0f };

@implementation COPanelBackgroundView

- (void)setArrowXPosition:(NSInteger)arrowXPosition {
    _arrowXPosition = arrowXPosition;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    NSRect contentRect = NSInsetRect([self bounds], LineThickness, LineThickness);
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [path moveToPoint:NSMakePoint(_arrowXPosition, NSMaxY(contentRect))];
    [path lineToPoint:NSMakePoint(_arrowXPosition + ArrowSize.width / 2.0f, NSMaxY(contentRect) - ArrowSize.height)];
    [path lineToPoint:NSMakePoint(NSMaxX(contentRect) - CornerRadius, NSMaxY(contentRect) - ArrowSize.height)];
    
    NSPoint topRightCorner = NSMakePoint(NSMaxX(contentRect), NSMaxY(contentRect) - ArrowSize.height);
    [path curveToPoint:NSMakePoint(NSMaxX(contentRect), NSMaxY(contentRect) - ArrowSize.height - CornerRadius)
         controlPoint1:topRightCorner controlPoint2:topRightCorner];
    
    [path lineToPoint:NSMakePoint(NSMaxX(contentRect), NSMinY(contentRect) + CornerRadius)];
    
    NSPoint bottomRightCorner = NSMakePoint(NSMaxX(contentRect), NSMinY(contentRect));
    [path curveToPoint:NSMakePoint(NSMaxX(contentRect) - CornerRadius, NSMinY(contentRect))
         controlPoint1:bottomRightCorner controlPoint2:bottomRightCorner];
    
    [path lineToPoint:NSMakePoint(NSMinX(contentRect) + CornerRadius, NSMinY(contentRect))];
    
    [path curveToPoint:NSMakePoint(NSMinX(contentRect), NSMinY(contentRect) + CornerRadius)
         controlPoint1:contentRect.origin controlPoint2:contentRect.origin];
    
    [path lineToPoint:NSMakePoint(NSMinX(contentRect), NSMaxY(contentRect) - ArrowSize.height - CornerRadius)];
    
    NSPoint topLeftCorner = NSMakePoint(NSMinX(contentRect), NSMaxY(contentRect) - ArrowSize.height);
    [path curveToPoint:NSMakePoint(NSMinX(contentRect) + CornerRadius, NSMaxY(contentRect) - ArrowSize.height)
         controlPoint1:topLeftCorner controlPoint2:topLeftCorner];
    
    [path lineToPoint:NSMakePoint(_arrowXPosition - ArrowSize.width / 2, NSMaxY(contentRect) - ArrowSize.height)];
    [path closePath];
    
    [[NSColor colorWithDeviceWhite:1.0f alpha:FillOpacity] setFill];
    [path fill];

    [NSGraphicsContext saveGraphicsState];
    
    NSBezierPath *clip = [NSBezierPath bezierPathWithRect:[self bounds]];
    [clip appendBezierPath:path];
    [clip addClip];
    
    [path setLineWidth:LineThickness * 2];
    [[NSColor whiteColor] setStroke];
    [path stroke];
    
    [NSGraphicsContext restoreGraphicsState];
}

- (CGSize)arrowSize {
    return ArrowSize;
}

- (NSEdgeInsets)padding {
    NSEdgeInsets padding = Padding;
    padding.top += [self arrowSize].height;
    return padding;
}

@end
