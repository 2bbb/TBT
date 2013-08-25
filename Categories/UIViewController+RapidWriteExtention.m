//
//  UIViewController+RapidWriteExtention.m
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIViewController+RapidWriteExtention.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (RapidWriteExtention)

+ (id)viewControllerWithNibName:(NSString *)nibName {
    return [[[self alloc] initWithNibName:nibName bundle:nil] autorelease];
}

+ (id)viewController {
    NSString *nibName = NSStringFromClass([self class]);
    if(500 < [[UIScreen mainScreen] applicationFrame].size.height) {
        NSString *nibName4inch = [NSString stringWithFormat:@"%@_4inch", nibName];
        if([[NSBundle mainBundle] pathForResource:nibName4inch ofType:@"nib"]) {
            NSLog(@"%@ exists", nibName4inch);
            nibName = nibName4inch;
        } else {
            NSLog(@"... %@ don't exists", nibName4inch);
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
    [self dismissModalViewControllerAnimated:YES];
}
@end
