//
//  TBTToaster.m
//
//  Created by ISHII 2bit on 13/02/07.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import "TBTToaster.h"
#import "UIView+TBTProperyExtention.h"
#import "UILabel+TBTLabelExtend.h"

@implementation TBTToaster

+ (void)toastFor:(UIView *)targetView
      withString:(NSString *)text
     forDuration:(NSTimeInterval)duration
  isDisableTouch:(BOOL)isDisableTouch
{
    UIView *toastView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    [toastView setBackgroundColor:[UIColor colorWithRed:0.0f
                                                  green:0.0f
                                                   blue:0.0f
                                                  alpha:0.8f]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 110)];
    [label setText:text];
    [label setFont:[[label font] fontWithSize:[[label font] pointSize] - 2]];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFreeSize];
    label.centerX = toastView.width / 2;
    label.centerY = toastView.height / 2;
    [toastView addSubview:label];
    [[toastView layer] setCornerRadius:8.0f];
    [label release];
    __block UIView *tmpView;
    
    CGRect frame = [targetView bounds];
    if(isDisableTouch) {
        UIView *frameView = [[UIView alloc] initWithFrame:frame];
        [frameView setBackgroundColor:[UIColor colorWithRed:0.0f
                                                      green:0.0f
                                                       blue:0.0f
                                                      alpha:0.4f]];
        toastView.centerX = frameView.width / 2;
        toastView.centerY = frameView.height / 2;
        [frameView addSubview:toastView];
        tmpView = frameView;
        [toastView release];
    } else {
        tmpView = toastView;
    }
    tmpView.centerX = frame.size.width / 2;
    tmpView.centerY = frame.size.height / 2;
    [targetView addSubview:tmpView];
    [UIView animateWithDuration:duration
                          delay:2.0f
                        options:0
                     animations:^{
                         [tmpView setAlpha:0.0f];
                     }
                     completion:^(BOOL finished) {
                         [tmpView removeFromSuperview];
                         [tmpView release];
                     }];
}

@end
