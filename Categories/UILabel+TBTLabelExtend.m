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

-(void)resizeToStretch {
    float width = [self expectedWidth];
    CGRect newFrame = [self frame];
    newFrame.size.width = width;
    [self setFrame:newFrame];
}

-(float)expectedWidth {
    [self setNumberOfLines:1];
    
    CGSize maximumLabelSize = CGSizeMake(9999, self.frame.size.width);
    
    CGSize expectedLabelSize = [[self text] sizeWithFont:[self font]
                                       constrainedToSize:maximumLabelSize
                                           lineBreakMode:[self lineBreakMode]];
    return expectedLabelSize.width;
}

@end