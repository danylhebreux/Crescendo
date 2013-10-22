//
//  COLoginView.h
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-21.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface COLoginView : NSView

@property (nonatomic, readonly) NSImageView *logoImageView;
@property (nonatomic, readonly) NSTextField *usernameTextField;
@property (nonatomic, readonly) NSTextField *passwordTextField;
@property (nonatomic, readonly) NSButton *button;

@end
