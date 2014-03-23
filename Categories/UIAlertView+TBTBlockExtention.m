//
//  UIAlertView+TBTBlockExtention.m
//
//  Created by ISHII Tsuubito on 12/10/05.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIAlertView+TBTBlockExtention.h"

@interface UIAlertViewCallback : NSObject <UIAlertViewDelegate> {
    UIAlertViewCallbackBlock callback;
    UIAlertViewCallbackBlock didDissmissCallback;
}

- (id)initWithCallback:(UIAlertViewCallbackBlock)callback;
- (id)initWithCallback:(UIAlertViewCallbackBlock)callback
   didDissmissCallback:(UIAlertViewCallbackBlock)didDissmissCallback;

@end

@implementation UIAlertViewCallback

- (id)initWithCallback:(UIAlertViewCallbackBlock)_callback {
    if(self = [super init]) {
        callback = [_callback copy];
        didDissmissCallback = nil;
    }
    return self;
}

- (id)initWithCallback:(UIAlertViewCallbackBlock)_callback
   didDissmissCallback:(UIAlertViewCallbackBlock)_didDissmissCallback
{
    if(self = [super init]) {
        callback = [_callback copy];
        didDissmissCallback = [_didDissmissCallback copy];
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(callback) callback(alertView, buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(didDissmissCallback) didDissmissCallback(alertView, buttonIndex);
    
    [self release];
}

- (void)dealloc {
    [callback release];
    callback = nil;
    [super dealloc];
}

@end

@implementation UIAlertView(BlocksExtension)

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           callback:(UIAlertViewCallbackBlock)callback
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    
    self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if(self) {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);
        
        self.delegate = [[UIAlertViewCallback alloc] initWithCallback:callback];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           callback:(UIAlertViewCallbackBlock)callback
didDissmissCallback:(UIAlertViewCallbackBlock)didDissmissCallback
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    
    self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if(self) {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);
        
        self.delegate = [[UIAlertViewCallback alloc] initWithCallback:callback didDissmissCallback:didDissmissCallback];
    }
    return self;
}


@end