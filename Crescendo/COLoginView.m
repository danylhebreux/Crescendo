//
//  COLoginView.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-21.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COLoginView.h"
#import "COVerticallyAlignedTextFieldCell.h"
#import "COVerticallyAlignedSecureTextFieldCell.h"

@interface COLoginView ()

@end

@implementation COLoginView

- (id)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        _logoImageView = [[NSImageView alloc] init];
        [_logoImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_logoImageView setImage:[NSImage imageNamed:@"LogoTitle"]];
        [self addSubview:_logoImageView];
        
        _usernameTextField = [[NSTextField alloc] init];
        [_usernameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_usernameTextField setCell:[self textFieldCellWithPlaceholder:NSLocalizedString(@"Username", nil)]];
        [_usernameTextField setBezeled:YES];
        [_usernameTextField setBezelStyle:NSTextFieldSquareBezel];
        [_usernameTextField setFocusRingType:NSFocusRingTypeNone];
        [self addSubview:_usernameTextField];
        
        _passwordTextField = [[NSTextField alloc] init];
        [_passwordTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_passwordTextField setCell:[self secureTextFieldCellWithPlaceholder:NSLocalizedString(@"Password", nil)]];
        [_passwordTextField setBezeled:YES];
        [_passwordTextField setBezelStyle:NSTextFieldSquareBezel];
        [_passwordTextField setFocusRingType:NSFocusRingTypeNone];
        [self addSubview:_passwordTextField];
        
        _button = [[NSButton alloc] init];
        [_button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_button setTitle:NSLocalizedString(@"Sign in", nil)];
        [_button setTarget:self];
        [self addSubview:_button];
        
        NSDictionary *subviews = NSDictionaryOfVariableBindings(_logoImageView, _usernameTextField, _passwordTextField, _button);
        NSDictionary *metrics = @{ @"logoBottomMargin": @(30.0f),
                                   @"textFieldHeight": @(27.0f),
                                   @"usernameTextFieldBottomMargin": @(10.0f),
                                   @"passwordTextFieldBottomMargin": @(20.0f),
                                   @"buttonHeight": @(44.0f) };
    
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_logoImageView]|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_usernameTextField]|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_passwordTextField]|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_button]|"
                                                                                     options:0
                                                                                     metrics:metrics
                                                                                       views:subviews]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_logoImageView]-logoBottomMargin-[_usernameTextField(textFieldHeight)]-usernameTextFieldBottomMargin-[_passwordTextField(textFieldHeight)]-passwordTextFieldBottomMargin-[_button(buttonHeight)]"
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

@end
