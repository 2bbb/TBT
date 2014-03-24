/* **** **** **** **** **** **** **** **** **** **** **** **** *
 *.............................................................*
 *...........▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄..............*
 *..........▐░░░░░░░░░░░▌▐░░░░░░░░░░▌▐░░░░░░░░░░░▌.............*
 *...........▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▀▀▀▀█░█▀▀▀▀..............*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *...............▐░▌.....▐░█▀▀▀▀▀▀▀█░▌....▐░▌..................*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *................▀.......▀▀▀▀▀▀▀▀▀▀.......▀...................*
 *.............................................................*
 * **** **** **** **** **** **** **** **** **** **** **** **** */

//
//  UIScrollView+ZoomingExtention.m
//
//  Created by ISHII 2bit on 2013/08/06.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIScrollView+TBTZoomingExtention.h"

@implementation UIScrollView (TBTZoomingExtention)

- (void)zoomToCenter:(float)scale withCenter:(CGPoint)center {
    [self zoomToCenter:scale withCenter:center animated:YES];
}

- (void)zoomToCenter:(float)scale withCenter:(CGPoint)center animated:(BOOL)animated {
    CGRect zoomRect;
    zoomRect.size.width  = self.frame.size.width  / scale;
    zoomRect.size.height = self.frame.size.height / scale;
    
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    //return zoomRect;
    
    [self zoomToRect:zoomRect animated:animated];
    
}

- (void)zoomToPoint:(float)scale withPoint:(CGPoint)point {
    [self zoomToPoint:scale withPoint:point animated:YES];
}

- (void)zoomToPoint:(float)scale withPoint:(CGPoint)point animated:(BOOL)animated {
    CGRect zoomRect;
    zoomRect.size.width  = self.frame.size.width  / scale;
    zoomRect.size.height = self.frame.size.height / scale;
    
    CGFloat percentX = point.x / self.frame.size.width;
    CGFloat percentY = point.y / self.frame.size.height;
    
    zoomRect.origin.x = point.x - percentX * zoomRect.size.width;
    zoomRect.origin.y = point.y - percentY * zoomRect.size.height;
    
    //return zoomRect;
    
    [self zoomToRect:zoomRect animated:animated];
}

@end
