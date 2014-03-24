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
//  CAKeyframeAnimation+TBTCustomEasingExtention.h
//
//  Created by ISHII 2bit on 2013/08/23.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef double (^TBTCAKeyframeCustomEasingBlock)(double);

@interface CAKeyframeAnimation (TBTCustomEasingExtention)

+ (CAKeyframeAnimation *)animationWithKeyPath:(NSString *)path
                                     function:(TBTCAKeyframeCustomEasingBlock)block
                                    fromValue:(double)fromValue
                                      toValue:(double)toValue;

+ (CAKeyframeAnimation *)bounceAnimationWithKeyPath:(NSString *)path
                                          fromValue:(double)fromValue
                                            toValue:(double)toValue;

extern TBTCAKeyframeCustomEasingBlock TBTCAKeyframeCustomEasingBounce;

@end
