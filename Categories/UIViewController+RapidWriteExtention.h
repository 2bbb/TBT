//
//  UIViewController+RapidWriteExtention.h
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (RapidWriteExtention)

+ (id)viewControllerWithNibName:(NSString *)nibName;
+ (id)viewController;
- (UIResponder *)appDelegate;

@end
