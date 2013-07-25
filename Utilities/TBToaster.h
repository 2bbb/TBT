//
//  TBToaster.h
//
//  Created by ISHII 2bit on 13/02/07.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TBToaster : NSObject

+ (void)toastFor:(UIView *)targetView
      withString:(NSString *)text
     forDuration:(NSTimeInterval)duration
  isDisableTouch:(BOOL)isDisableTouch;

@end
