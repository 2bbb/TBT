//
//  UIAlertView+BlockExtention.m
//
//  Created by ISHII Tsuubito on 12/10/05.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIAlertView+BlockExtention.h"

#if !__has_feature(objc_arc)
#error This code needs compiler option -fno-objc-arc
#endif

@interface UIAlertViewCallback : NSObject <UIAlertViewDelegate> {
    UIAlertViewCallbackBlock callback;
}

@property (nonatomic, copy) UIAlertViewCallbackBlock callback;

- (id)initWithCallback:(UIAlertViewCallbackBlock)callback;

@end

@implementation UIAlertViewCallback

@synthesize callback;

- (id)initWithCallback:(UIAlertViewCallbackBlock)_callback {
    if(self = [super init]) {
        self.callback = [_callback retain];
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(callback) callback(buttonIndex);
    
    [self release];
}

- (void)dealloc {
    [callback release];
    self.callback = nil;
    [super dealloc];
}

@end

@implementation UIAlertView(BlocksExtension)

- (id)initWithTitle:(NSString *)title message:(NSString *)message callback:(UIAlertViewCallbackBlock)callback  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if(self) {
        // otherButtonTitles, ... を手動でセット
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);
        
        // delegateにUIAlertViewCallbackをセット
        self.delegate = [[[UIAlertViewCallback alloc] initWithCallback:callback] autorelease];
    }
    return self;
}

@end