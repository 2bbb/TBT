//
//  UIView+AnimationExtention.h
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AnimationExtention)

- (void)fadeIn:(NSTimeInterval)duration;
- (void)fadeOut:(NSTimeInterval)duration;
- (void)fadeOut:(NSTimeInterval)duration hideWhenStopAnimation:(BOOL)hide;

- (void)setFrameWithAnimation:(CGRect)frame duration:(NSTimeInterval)duration;

@end
