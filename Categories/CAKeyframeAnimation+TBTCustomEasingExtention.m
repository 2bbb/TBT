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
//  CAKeyframeAnimation+TBTCustomEasingExtention.m
//
//  Created by ISHII 2bit on 2013/08/23.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import "CAKeyframeAnimation+TBTCustomEasingExtention.h"

@implementation CAKeyframeAnimation (TBTCustomEasingExtention)

+ (CAKeyframeAnimation *)animationWithKeyPath:(NSString *)path
                                     function:(TBTCAKeyframeCustomEasingBlock)block
                                    fromValue:(double)fromValue
                                      toValue:(double)toValue
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:path];
    
    NSUInteger steps = 100;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:steps];
    
    double time = 0.0;
    double timeStep = 1.0 / (double)(steps - 1);
    for(NSUInteger i = 0; i < steps; i++) {
        double value = fromValue + (block(time) * (toValue - fromValue));
        [values addObject:[NSNumber numberWithDouble:value]];
        time += timeStep;
    }
    animation.calculationMode = kCAAnimationLinear;
    [animation setValues:values];
    return animation;
}

+ (CAKeyframeAnimation *)bounceAnimationWithKeyPath:(NSString *)path
                                          fromValue:(double)fromValue
                                            toValue:(double)toValue
{
    return [self animationWithKeyPath:path
                             function:TBTCAKeyframeCustomEasingBounce
                            fromValue:fromValue
                              toValue:toValue];
}

TBTCAKeyframeCustomEasingBlock TBTCAKeyframeCustomEasingBounce = ^double(double t) {
    return fabs(cosf(3 * t * t * M_PI)) * (1.0f - t) * (1.0f - t);
};

@end
