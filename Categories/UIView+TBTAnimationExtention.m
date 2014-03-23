//
//  UIView+AnimationExtention.m
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIView+AnimationExtention.h"

@implementation UIView (AnimationExtention)

- (void)fadeIn:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration
                     animations:^{
                            [self setAlpha:1.0];
                        }];
}

- (void)fadeOut:(NSTimeInterval)duration {
    [self fadeOut:duration hideWhenStopAnimation:NO];
}

- (void)fadeOut:(NSTimeInterval)duration hideWhenStopAnimation:(BOOL)hide {
    [UIView animateWithDuration:duration
                     animations:^{
                            [self setAlpha:0.0];
                        }
                        completion:^(BOOL finished) {
                            [self setHidden:hide];
                        }];
}

- (void)setFrameWithAnimation:(CGRect)frame
                     duration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:duration
                     animations:^{
                            [self setFrame:frame];
                        }];
}

@end
