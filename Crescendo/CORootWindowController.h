//
//  CORootWindowController.h
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol CORootWindowControllerDelegate;

@interface CORootWindowController : NSWindowController
@property (nonatomic, readonly) BOOL isPanelVisible;
@property (nonatomic, weak) id <CORootWindowControllerDelegate> delegate;
- (void)setPanelVisible:(BOOL)isVisible
     fromStatusItemRect:(NSRect)rect;
@end

@protocol CORootWindowControllerDelegate <NSObject>
- (void)rootWindowControllerDidResignPanel:(CORootWindowController *)controller;
@end
