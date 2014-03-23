//
//  UIView+DebugExtention.m
//  Townwork
//
//  Created by ISHII Tsuubito on 2013/09/03.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIView+DebugExtention.h"
#import "TBLogger.h"

@implementation UIView (DebugExtention)

- (void)printFrame {
    [self printFrame:@""];
}

- (void)printFrame:(NSString *)text {
    LogDebug(@"%@: x = %f, y = %f, w = %f, h = %f", text, self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

@end
