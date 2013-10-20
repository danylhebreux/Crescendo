//
//  CORootWindowController.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "CORootWindowController.h"
#import "COPanel.h"
#import "COPanelBackgroundView.h"

static const CGSize PanelSize = { 320.0f, 240.0f };
static const CGFloat PanelMinRightMargin = 20.0f;
static const CGFloat PanelAnimationDuration = 0.15f;

@interface CORootWindowController () <NSWindowDelegate>
@property (nonatomic) COPanel *panel;
@property (nonatomic) COPanelBackgroundView *panelBackgroundView;
@property (nonatomic) BOOL isHideAnimationActive;
@end

@implementation CORootWindowController

- (instancetype)init {
    self = [super init];
    if (self) {
        _panel = [[COPanel alloc] init];
        [_panel setDelegate:self];
        [self setWindow:_panel];
    }
    return self;
}

- (void)setPanelVisible:(BOOL)isVisible
     fromStatusItemRect:(NSRect)rect {
    if (_isHideAnimationActive) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(rootWindowControllerDidResignPanel:)])
            [self.delegate rootWindowControllerDidResignPanel:self];
        return;
    }
    
    _isPanelVisible = isVisible;
    NSRect panelRect = [self panelRectFromStatusItemRect:rect];
    CGFloat alpha = 0.0f;
    if (_isPanelVisible) {
        [NSApp activateIgnoringOtherApps:NO];
        alpha = 1.0f;
        [_panel setFrame:panelRect display:NO];
        [_panel setArrowXPosition:NSMidX([self.window convertRectFromScreen:rect])];
        [_panel setAlphaValue:0.0f];
        [_panel makeKeyAndOrderFront:nil];
    }
    else {
        _isHideAnimationActive = YES;
        dispatch_after(dispatch_walltime(NULL, NSEC_PER_SEC * PanelAnimationDuration * 2), dispatch_get_main_queue(), ^{
            _isHideAnimationActive = NO;
            [_panel orderOut:nil];
        });
        if (self.delegate && [self.delegate respondsToSelector:@selector(rootWindowControllerDidResignPanel:)])
            [self.delegate rootWindowControllerDidResignPanel:self];
    }
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:PanelAnimationDuration];
    [[_panel animator] setAlphaValue:alpha];
    [NSAnimationContext endGrouping];
}

- (NSRect)panelRectFromStatusItemRect:(NSRect)rect {
    NSRect screenRect = [[NSScreen mainScreen] frame];
    CGFloat xPosition = NSMidX(rect) - PanelSize.width/2.0f;
    BOOL isOutOfBounds = (xPosition + PanelSize.width + PanelMinRightMargin) > screenRect.size.width;
    if (isOutOfBounds)
        xPosition = screenRect.size.width - PanelSize.width - PanelMinRightMargin;
    
    return NSMakeRect(xPosition, rect.origin.y - PanelSize.height, PanelSize.width, PanelSize.height);
}

#pragma mark - NSWindowDelegate

- (void)windowDidResignKey:(NSNotification *)notification;
{
    if ([_panel isVisible])
        [self setPanelVisible:NO fromStatusItemRect:NSZeroRect];
}

@end
