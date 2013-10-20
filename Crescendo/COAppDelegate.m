//
//  COAppDelegate.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-18.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COAppDelegate.h"
#import "COStatusItemController.h"
#import "CORootWindowController.h"

@interface COAppDelegate () <COStatusItemControllerDelegate, CORootWindowControllerDelegate>
@property (nonatomic) COStatusItemController *statusItemController;
@property (nonatomic) CORootWindowController *rootWindowController;
@end

@implementation COAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.statusItemController = [[COStatusItemController alloc] init];
    [self.statusItemController setDelegate:self];
    self.rootWindowController = [[CORootWindowController alloc] init];
    [self.rootWindowController setDelegate:self];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    self.statusItemController = nil;
    return NSTerminateNow;
}

#pragma mark - COStatusItemControllerDelegate

- (void)statusItemController:(COStatusItemController *)controller
   didSelectStatusItemAtRect:(NSRect)rect {
    [self.rootWindowController setPanelVisible:controller.isHighlighted
                            fromStatusItemRect:rect];
}

#pragma mark - CORootWindowControllerDelegate

- (void)rootWindowControllerDidResignPanel:(CORootWindowController *)controller {
    [self.statusItemController setHighlighted:NO];
}

@end
