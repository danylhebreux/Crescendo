//
//  COStatusItemController.m
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import "COStatusItemController.h"
#import "COStatusItem.h"

@interface COStatusItemController ()
@property (nonatomic) COStatusItem *statusItemView;
@end

@implementation COStatusItemController

- (id)init {
    self = [super init];
    if (self) {
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
        _statusItemView = [[COStatusItem alloc] initWithStatusItem:statusItem];
        _statusItemView.image = [NSImage imageNamed:@"MenuBar"];
        _statusItemView.alternateImage = [NSImage imageNamed:@"MenuBarHighlighted"];
        _statusItemView.action = @selector(togglePanel:);
        _statusItemView.target = self;
    }
    return self;
}

- (void)togglePanel:(id)sender {
    [self setHighlighted:!self.statusItemView.isHighlighted];
    if (self.delegate && [self.delegate respondsToSelector:@selector(statusItemController:didSelectStatusItemAtRect:)]) {
        NSRect rect = [[[NSApp currentEvent] window] frame];
        [self.delegate statusItemController:self didSelectStatusItemAtRect:rect];
    }
}

- (BOOL)isHighlighted {
    return self.statusItemView.isHighlighted;
}

- (void)setHighlighted:(BOOL)isHighlighted {
    self.statusItemView.isHighlighted = isHighlighted;
}

@end
