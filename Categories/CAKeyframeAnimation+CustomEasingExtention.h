//
//  CAKeyframeAnimation+CustomEasingExtention.h
//
//  Created by ISHII 2bit on 2013/08/23.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef double (^CAKeyframeCustomEasingBlock)(double);

@interface CAKeyframeAnimation (CustomEasingExtention)

+ (CAKeyframeAnimation *)animationWithKeyPath:(NSString *)path
                                     function:(CAKeyframeCustomEasingBlock)block
                                    fromValue:(double)fromValue
                                      toValue:(double)toValue;

+ (CAKeyframeAnimation *)bounceAnimationWithKeyPath:(NSString *)path
                                          fromValue:(double)fromValue
                                            toValue:(double)toValue;

extern CAKeyframeCustomEasingBlock CAKeyframeCustomEasingBounce;

@end
