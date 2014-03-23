//
//  TBAlertViewBlock.m
//
//  Created by ISHII Tsuubito
//  Copyright (c) 2012- buffer Renaiss co., ltd. All rights reserved.
//

#import "TBAlertViewBlock.h"

@implementation UIAlertViewBlock

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
     tapButtonBlock:(AlertViewTapButtonBlock)_tapButtonBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title
                        message:message
                       delegate:self
              cancelButtonTitle:cancelButtonTitle
              otherButtonTitles:nil];
    
    if(self) {
        if(_tapButtonBlock) {
            tapButtonBlock = [_tapButtonBlock retain];
        }
        
        [self addButtonWithTitle:otherButtonTitles];
        va_list args;
        va_start(args, otherButtonTitles);
        NSString *title;
        while((title = va_arg(args, NSString*))) {
            [self addButtonWithTitle:title];
        }
        va_end(args);
    }
    
    return self;
}

- (void)setTapButtonBlock:(AlertViewTapButtonBlock)_tapButtonBlock {
    if(tapButtonBlock == _tapButtonBlock) return;
    
    if(tapButtonBlock && (tapButtonBlock != _tapButtonBlock)) {
        [tapButtonBlock release];
    }
    
    tapButtonBlock = [_tapButtonBlock retain];
}

- (void)setWillPresentBlock:(AlertViewWillPresentBlock)_willPresentBlock {
    if(willPresentBlock == _willPresentBlock) return;
    
    if(willPresentBlock && (willPresentBlock != _willPresentBlock)) {
        [willPresentBlock release];
    }
    
    willPresentBlock = [_willPresentBlock retain];
}

- (void)setDidPresentBlock:(AlertViewDidPresentBlock)_didPresentBlock {
    if(didPresentBlock == _didPresentBlock) return;
    
    if(didPresentBlock && (didPresentBlock != _didPresentBlock)) {
        [didPresentBlock release];
    }
    
    didPresentBlock = [_didPresentBlock retain];
}

#pragma mark UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(tapButtonBlock) {
        NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
        tapButtonBlock(buttonTitle, buttonIndex);
    }
}

-(void)willPresentAlertView:(UIAlertView *)alertView {
    if(willPresentBlock) willPresentBlock();
}

-(void)didPresentAlertView:(UIAlertView *)alertView {
    if(didPresentBlock) didPresentBlock();
}

@end