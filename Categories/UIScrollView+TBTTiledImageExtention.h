//
//  UIScrollView+TiledImageExtention.h
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (TiledImageExtention)

- (NSArray *)tileImageViews:(CGSize)size
                  withPages:(NSUInteger)num
      isDirectionHorizontal:(BOOL)isHorizontal;

- (NSArray *)tileImageViews:(CGSize)size
                 withColumn:(NSUInteger)column
                     andRow:(NSUInteger)row;

@end
