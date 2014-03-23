//
//  UIView+CoreGraphicsExtention.m
//  Gatsby
//
//  Created by ISHII Tsuubito on 2013/08/20.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIView+CoreGraphicsExtention.h"

@implementation UIView (CoreGraphicsExtention)

- (UIImage *)capture {
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[self layer] renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)capturePresentationLayer {
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[self layer] renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
