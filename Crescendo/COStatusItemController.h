//
//  COStatusItemController.h
//  Crescendo
//
//  Created by Dany L'Hebreux on 2013-10-19.
//  Copyright (c) 2013 DLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol COStatusItemControllerDelegate;

@interface COStatusItemController : NSObject
@property (nonatomic, setter = setHighlighted:) BOOL isHighlighted;
@property (nonatomic, weak) id <COStatusItemControllerDelegate> delegate;
@end

@protocol COStatusItemControllerDelegate <NSObject>
- (void)statusItemController:(COStatusItemController *)controller
   didSelectStatusItemAtRect:(NSRect)rect;
@end
