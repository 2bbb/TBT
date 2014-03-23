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

- (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated;
- (void)pushViewControllerWithDissolev:(UIViewController *)controller;
- (void)pushController:(Class)controllerClass animated:(BOOL)animated;

- (UIResponder *)appDelegate;

- (void)popViewControllerAnimated:(BOOL)animated;
- (IBAction)popViewController;
- (void)popToRootViewControllerAnimated:(BOOL)animated;
- (IBAction)popToRootViewController;

- (IBAction)dismissViewController;

- (void)createActivityIndicatorView;
- (void)destroyActivityIndicatorView;
- (BOOL)isShowActivityIndicatorViewNow;

@end
