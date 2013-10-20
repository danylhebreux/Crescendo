//
//  COVerticallyAlignedTextFieldCell.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-20.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COVerticallyAlignedTextFieldCell.h"

@implementation COVerticallyAlignedTextFieldCell

- (NSRect)adjustedFrameToVerticallyCenterText:(NSRect)frame {
    NSInteger offset = floor((NSHeight(frame) - ([[self font] ascender] - [[self font] descender])) / 2) - 4;
    NSRect newFrame = NSInsetRect(frame, 0.0, offset);
    newFrame.size.height = frame.size.height - 2;
    return newFrame;
}

- (void)editWithFrame:(NSRect)aRect
               inView:(NSView *)controlView
               editor:(NSText *)editor
             delegate:(id)delegate
                event:(NSEvent *)event {
    [super editWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
                  inView:controlView
                  editor:editor
                delegate:delegate
                   event:event];
}

- (void)selectWithFrame:(NSRect)aRect
                 inView:(NSView *)controlView
                 editor:(NSText *)editor
               delegate:(id)delegate
                  start:(NSInteger)start
                 length:(NSInteger)length {
    [super selectWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
                    inView:controlView
                    editor:editor
                  delegate:delegate
                     start:start
                    length:length];
}

- (void)drawInteriorWithFrame:(NSRect)frame
                       inView:(NSView *)view {
    [super drawInteriorWithFrame:[self adjustedFrameToVerticallyCenterText:frame]
                          inView:view];
}

@end
