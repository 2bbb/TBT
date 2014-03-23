//
//  UIScrollView+ZoomingExtention.h
//
//  Created by ISHII Tsuubito on 2013/08/06.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ZoomingExtention)

- (void)zoomToCenter:(float)scale withCenter:(CGPoint)center;
- (void)zoomToCenter:(float)scale withCenter:(CGPoint)center animated:(BOOL)animated;
- (void)zoomToPoint:(float)scale withPoint:(CGPoint)point;
- (void)zoomToPoint:(float)scale withPoint:(CGPoint)point animated:(BOOL)animated;

@end
