//
//  COStatusItem.h
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface COStatusItem : NSView

- (instancetype)initWithStatusItem:(NSStatusItem *)statusItem;

@property (nonatomic, readonly) NSStatusItem *statusItem;
@property (nonatomic) NSImage *image;
@property (nonatomic) NSImage *alternateImage;
@property (nonatomic, setter = setHighlighted:) BOOL isHighlighted;
@property (nonatomic, readonly) NSRect globalRect;
@property (nonatomic) SEL action;
@property (nonatomic, unsafe_unretained) id target;

@end
