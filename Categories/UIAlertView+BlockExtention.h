//
//  UIAlertView+BlockExtention.h
//
//  Created by ISHII Tsuubito on 12/10/05.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView(BlocksExtension)

typedef void (^UIAlertViewCallbackBlock)(NSInteger buttonIndex);

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           callback:(UIAlertViewCallbackBlock)callback
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end