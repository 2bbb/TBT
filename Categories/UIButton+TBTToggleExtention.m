//
//  UIButton+ToggleExtention.m
//  PerfumePlayer
//
//  Created by ISHII Tsuubito on 2013/11/07.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIButton+ToggleExtention.h"

@implementation UIButton (ToggleExtention)

- (void)swapNormalAndHighlightedImage {
    UIImage *oldNormal = [self imageForState:UIControlStateNormal];
    UIImage *oldHighlighted = [self imageForState:UIControlStateHighlighted];
    [self setImage:oldHighlighted forState:UIControlStateNormal];
    [self setImage:oldNormal forState:UIControlStateHighlighted];
}

@end
