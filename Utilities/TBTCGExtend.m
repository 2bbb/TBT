//
//  CGExtend.m
//  Gatsby
//
//  Created by ISHII Tsuubito on 2013/08/19.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import "CGExtend.h"

CGRect CGRectMakeFromOriginAndSize(CGPoint origin, CGSize size) {
    return (CGRect){.origin = origin, .size = size};
}

CGRect CGRectTranslateVec(CGRect rect, CGPoint vec) {
    rect.origin.x += vec.x;
    rect.origin.y += vec.y;
    return rect;
}