//
//  UIViewController+RapidWriteExtention.m
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIViewController+RapidWriteExtention.h"

@implementation UIViewController (RapidWriteExtention)

+ (id)viewControllerWithNibName:(NSString *)nibName {
    return [[[self alloc] initWithNibName:nibName bundle:nil] autorelease];
}

+ (id)viewController {
    return [self viewControllerWithNibName:NSStringFromClass([self class])];
}

- (UIResponder *)appDelegate {
    return [[UIApplication sharedApplication] delegate];
}

@end
