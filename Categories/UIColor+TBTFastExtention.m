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
//  UIColor+TBTFastExtention.m
//
//  Created by ISHII 2bit on 12/10/22.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIColor+TBTFastExtention.h"

@implementation UIColor (TBFastExtention)

- (CGFloat)red {
    return CGColorGetComponents(self.CGColor)[0];
}

- (CGFloat)green {
    return CGColorGetComponents(self.CGColor)[CGColorGetNumberOfComponents(self.CGColor) == 4 ? 1 : 0];
}

- (CGFloat)blue {
    return CGColorGetComponents(self.CGColor)[CGColorGetNumberOfComponents(self.CGColor) == 4 ? 2 : 0];
}

- (CGFloat)alpha {
    return CGColorGetComponents(self.CGColor)[CGColorGetNumberOfComponents(self.CGColor) == 4 ? 3 : 1];
}

@end
