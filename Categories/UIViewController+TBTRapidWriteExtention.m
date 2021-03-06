/* **** **** **** **** **** **** **** **** **** **** **** **** *
 *.............................................................*
 *...........▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄..............*
 *..........▐░░░░░░░░░░░▌▐░░░░░░░░░░▌▐░░░░░░░░░░░▌.............*
 *...........▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▀▀▀▀█░█▀▀▀▀..............*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *...............▐░▌.....▐░█▀▀▀▀▀▀▀█░▌....▐░▌..................*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *................▀.......▀▀▀▀▀▀▀▀▀▀.......▀...................*
 *.............................................................*
 * **** **** **** **** **** **** **** **** **** **** **** **** */

//
//  UIViewController+RapidWriteExtention.m
//
//  Created by ISHII 2bit on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIViewController+TBTRapidWriteExtention.h"
#import "UIView+TBTProperyExtention.h"
#import <QuartzCore/QuartzCore.h>

#ifndef LogTrace
#define LogTrace NSLog
#endif

#ifndef LogWarning
#define LogWarning NSLog
#endif

@implementation UIViewController (TBTRapidWriteExtention)

+ (id)viewControllerWithNibName:(NSString *)nibName {
    return [[self alloc] initWithNibName:nibName bundle:nil];
}

+ (id)viewController {
    NSString *nibName = NSStringFromClass([self class]);
    if(500 < [[UIScreen mainScreen] applicationFrame].size.height) {
        NSString *nibName4inch = [NSString stringWithFormat:@"%@_4inch", nibName];
        if([[NSBundle mainBundle] pathForResource:nibName4inch ofType:@"nib"]) {
            LogTrace(@"%@ exists", nibName4inch);
            nibName = nibName4inch;
        } else {
            LogWarning(@"... %@ don't exists", nibName4inch);
        }
    }
    return [self viewControllerWithNibName:nibName];
}

- (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated {
    [[self navigationController] pushViewController:controller animated:animated];
}

- (void)pushViewControllerWithDissolev:(UIViewController *)controller {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.4;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromRight;
    
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    
    [self pushViewController:controller animated:YES];
}

- (void)pushController:(Class)controllerClass animated:(BOOL)animated {
    if([controllerClass isSubclassOfClass:[UIViewController class]]) {
        UIViewController *controller = [controllerClass viewController];
        [[self navigationController] pushViewController:controller animated:animated];
    }
}

- (UIResponder *)appDelegate {
    return [[UIApplication sharedApplication] delegate];
}

- (void)popViewControllerAnimated:(BOOL)animated {
    [[self navigationController] popViewControllerAnimated:animated];
}

- (IBAction)popViewController {
    [self popViewControllerAnimated:YES];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated {
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

- (IBAction)popToRootViewController {
    [self popToRootViewControllerAnimated:YES];
}

- (IBAction)dismissViewController {
#ifdef __IPHONE_6_0
    [self dismissViewControllerAnimated:YES completion:^{}];
#else
    [self dismissModalViewControllerAnimated:YES];
#endif
}

const static NSInteger _kIndicatorWrapperTag = 11195;
const static NSInteger _kIndicatorTag = 11196;

- (void)createActivityIndicatorView {
    UIView *view = [[UIView alloc] initWithFrame:[self view].bounds];
    [view setBackgroundColor:[UIColor colorWithRed:0.0f
                                             green:0.0f
                                              blue:0.0f
                                             alpha:0.6f]];
    UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [view addSubview:ai];
    ai.centerX = view.width * 0.5f;
    ai.centerY = view.height * 0.5f;
    [view setAlpha:0.0f];
    [[self view] addSubview:view];
    [view setTag:_kIndicatorWrapperTag];
    [ai setTag:_kIndicatorTag];
    [UIView animateWithDuration:0.1f
                     animations:^{
                         [view setAlpha:1.0f];
                     }
                     completion:^(BOOL _) {
                         [ai startAnimating];
                     }];
    ai = nil;
    view = nil;
}

- (void)destroyActivityIndicatorView {
    [UIView animateWithDuration:0.1f
                     animations:^{
                         UIView *view = [[self view] viewWithTag:_kIndicatorWrapperTag];
                         [view setAlpha:0.0f];
                     }
                     completion:^(BOOL _) {
                         UIView *view = [[self view] viewWithTag:_kIndicatorWrapperTag];
                         UIActivityIndicatorView *ai = (UIActivityIndicatorView *)[view viewWithTag:_kIndicatorTag];
                         [ai performSelectorInBackground:@selector(stopAnimating)
                                              withObject:nil];
                         [view removeFromSuperview];
                     }];
}

- (BOOL)isShowActivityIndicatorViewNow {
    return [[self view] viewWithTag:_kIndicatorTag] != nil;
}

@end
