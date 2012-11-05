//
//  UILabel+TBLabelExtend.m
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UILabel+TBLabelExtend.h"

@implementation UILabel (TBLabelExtend)

- (void)setFreeSize {
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    [self setNumberOfLines:0];
    
    [self sizeToFit];
}

- (CGSize)currentSize {
    return [[self text] sizeWithFont:[self font] forWidth:[self frame].size.width lineBreakMode:[self lineBreakMode]];
}

- (CGFloat)currentHeight {
    return [self currentSize].height;
}

@end