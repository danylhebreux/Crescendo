//
//  COPanel.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COPanel.h"
#import "COPanelBackgroundView.h"
#import "COLoginView.h"

@interface COPanel ()
@property (nonatomic) COPanelBackgroundView *panelBackgroundView;
@property (nonatomic) COLoginView *loginView;
@end

@implementation COPanel

- (instancetype)init{
    self = [self initWithContentRect:NSZeroRect
                           styleMask:NSNonactivatingPanelMask
                             backing:NSBackingStoreBuffered
                               defer:YES];
    if (self) {
        [self setAcceptsMouseMovedEvents:YES];
        [self setLevel:NSPopUpMenuWindowLevel];
        [self setOpaque:NO];
        [self setBackgroundColor:[NSColor clearColor]];
        [self setHasShadow:YES];
                
        _panelBackgroundView = [[COPanelBackgroundView alloc] init];
        [_panelBackgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_panelBackgroundView];
        
        _loginView = [[COLoginView alloc] initWithFrame:NSZeroRect];
        [_loginView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_panelBackgroundView addSubview:_loginView];
        
        NSDictionary *metrics = @{ @"topPadding": @([_panelBackgroundView padding].top),
                                   @"leftPadding": @([_panelBackgroundView padding].left),
                                   @"bottomPadding": @([_panelBackgroundView padding].bottom),
                                   @"rightPadding": @([_panelBackgroundView padding].right) };
        NSDictionary *views = NSDictionaryOfVariableBindings(_panelBackgroundView, _loginView);
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_panelBackgroundView]|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_panelBackgroundView]|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views]];
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[_loginView]-rightPadding-|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:views]];
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topPadding-[_loginView]-bottomPadding-|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:views]];
    }
    return self;
}

- (void)login {
    NSLog(@"Login");
}

- (BOOL)canBecomeKeyWindow; {
    return YES;
}

- (void)setArrowXPosition:(NSInteger)xPosition {
    [_panelBackgroundView setArrowXPosition:xPosition];
}

@end
