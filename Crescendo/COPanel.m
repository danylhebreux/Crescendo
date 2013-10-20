//
//  COPanel.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COPanel.h"
#import "COPanelBackgroundView.h"
#import "COVerticallyAlignedTextFieldCell.h"
#import "COVerticallyAlignedSecureTextFieldCell.h"

@interface COPanel ()
@property (nonatomic) COPanelBackgroundView *panelBackgroundView;
@property (nonatomic) NSImageView *logoImageView;
@property (nonatomic) NSTextField *usernameTextField;
@property (nonatomic) NSTextField *passwordTextField;
@property (nonatomic) NSButton *button;
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
        
        _logoImageView = [[NSImageView alloc] init];
        [_logoImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_logoImageView setImage:[NSImage imageNamed:@"LogoTitle"]];
        [_panelBackgroundView addSubview:_logoImageView];
        
        _usernameTextField = [[NSTextField alloc] init];
        [_usernameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_usernameTextField setCell:[self textFieldCellWithPlaceholder:NSLocalizedString(@"Username", nil)]];
        [_usernameTextField setBezeled:YES];
        [_usernameTextField setBezelStyle:NSTextFieldSquareBezel];
        [_usernameTextField setFocusRingType:NSFocusRingTypeNone];
        [_panelBackgroundView addSubview:_usernameTextField];
        
        _passwordTextField = [[NSTextField alloc] init];
        [_passwordTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_passwordTextField setCell:[self secureTextFieldCellWithPlaceholder:NSLocalizedString(@"Password", nil)]];
        [_passwordTextField setBezeled:YES];
        [_passwordTextField setBezelStyle:NSTextFieldSquareBezel];
        [_passwordTextField setFocusRingType:NSFocusRingTypeNone];
        [_panelBackgroundView addSubview:_passwordTextField];
        
        _button = [[NSButton alloc] init];
        [_button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_button setTitle:NSLocalizedString(@"Sign in", nil)];
        [_panelBackgroundView addSubview:_button];

        NSDictionary *subviews = NSDictionaryOfVariableBindings(_panelBackgroundView, _logoImageView, _usernameTextField, _passwordTextField, _button);
        NSDictionary *metrics = @{ @"topPadding": @([_panelBackgroundView padding].top),
                                   @"leftPadding": @([_panelBackgroundView padding].left),
                                   @"rightPadding": @([_panelBackgroundView padding].right),
                                   @"logoBottomMargin": @(30.0f),
                                   @"textFieldHeight": @(27.0f),
                                   @"usernameTextFieldBottomMargin": @(10.0f),
                                   @"passwordTextFieldBottomMargin": @(20.0f),
                                   @"buttonHeight": @(44.0f) };
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_panelBackgroundView]|"
                                                                                     options:0
                                                                                     metrics:nil
                                                                                       views:subviews]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_panelBackgroundView]|"
                                                                                     options:0
                                                                                     metrics:nil
                                                                                       views:subviews]];
        
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_logoImageView]|"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:subviews]];
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[_usernameTextField]-rightPadding-|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[_passwordTextField]-rightPadding-|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[_button]-rightPadding-|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [_panelBackgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topPadding-[_logoImageView]-logoBottomMargin-[_usernameTextField(textFieldHeight)]-usernameTextFieldBottomMargin-[_passwordTextField(textFieldHeight)]-passwordTextFieldBottomMargin-[_button(buttonHeight)]"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                       views:subviews]];
    }
    return self;
}

- (NSTextFieldCell *)textFieldCellWithPlaceholder:(NSString *)placeholder {
    COVerticallyAlignedTextFieldCell *textFieldCell = [[COVerticallyAlignedTextFieldCell alloc] initTextCell:@""];
    [textFieldCell setEditable:YES];
    [textFieldCell setPlaceholderString:placeholder];
    [textFieldCell setAlignment:NSCenterTextAlignment];
    return textFieldCell;
}

- (COVerticallyAlignedSecureTextFieldCell *)secureTextFieldCellWithPlaceholder:(NSString *)placeholder {
    COVerticallyAlignedSecureTextFieldCell *textFieldCell = [[COVerticallyAlignedSecureTextFieldCell alloc] initTextCell:@""];
    [textFieldCell setEditable:YES];
    [textFieldCell setPlaceholderString:placeholder];
    [textFieldCell setAlignment:NSCenterTextAlignment];
    return textFieldCell;
}

- (BOOL)canBecomeKeyWindow; {
    return YES;
}

- (void)setArrowXPosition:(NSInteger)xPosition {
    [_panelBackgroundView setArrowXPosition:xPosition];
}

@end
