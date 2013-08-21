//
//  UIAlertViewBlock.h
//
//  Created by ISHII 2bit
//  Copyright (c) 2012- buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertViewWillPresentBlock)();
typedef void (^AlertViewDidPresentBlock)();
typedef void (^AlertViewTapButtonBlock)(NSString *, NSInteger);

@interface UIAlertViewBlock : UIAlertView <
    UIAlertViewDelegate
> {
    AlertViewWillPresentBlock willPresentBlock;
    AlertViewDidPresentBlock didPresentBlock;
    AlertViewTapButtonBlock tapButtonBlock;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
     tapButtonBlock:(AlertViewTapButtonBlock)tapButtonBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (void)setTapButtonBlock:(AlertViewTapButtonBlock)tapButtonBlock;
- (void)setWillPresentBlock:(AlertViewWillPresentBlock)willPresentBlock;
- (void)setDidPresentBlock:(AlertViewDidPresentBlock)didPresentBlock;

@end