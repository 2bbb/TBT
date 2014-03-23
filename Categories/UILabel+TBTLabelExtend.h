//
//  UILabel+TBLabelExtend.h
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TBLabelExtend)

- (void)setFreeSize;
- (CGSize)currentSize;
- (CGFloat)currentHeight;

-(void)resizeToStretch;
-(float)expectedWidth;

@end

