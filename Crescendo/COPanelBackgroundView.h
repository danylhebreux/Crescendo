//
//  COPanelBackgroundView.h
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface COPanelBackgroundView : NSView

@property (nonatomic) NSInteger arrowXPosition;

- (CGSize)arrowSize;
- (NSEdgeInsets)padding;

@end
