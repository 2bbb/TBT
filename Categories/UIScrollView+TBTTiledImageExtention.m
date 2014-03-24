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
//  UIScrollView+TiledImageExtention.m
//
//  Created by ISHII 2bit on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIScrollView+TBTTiledImageExtention.h"

@implementation UIScrollView (TBTTiledImageExtention)

- (NSArray *)tileImageViews:(CGSize)size
                  withPages:(NSUInteger)num
      isDirectionHorizontal:(BOOL)isHorizontal
{
    CGFloat horizontalOffset = isHorizontal ? size.width : 0.0f;
    CGFloat verticalOffset = isHorizontal ? 0.0f : size.height;
    
    NSMutableArray *array = [[[NSMutableArray alloc] initWithCapacity:num] autorelease];
    
    for(int i = 0; i < num; i++) {
        CGRect frame;
        frame.size = size;
        frame.origin = CGPointMake(horizontalOffset * i, verticalOffset * i);
        UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        ai.center = CGPointMake(frame.origin.x + size.width / 2, frame.origin.y + size.height / 2);
        [self addSubview:ai];
        [ai startAnimating];
        [ai release];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:imageView];
        [array addObject:imageView];
        [imageView release];
    }
    
    [self setPagingEnabled:YES];
    
    [self setContentSize:CGSizeMake((isHorizontal ? num : 1) * size.width,
                                    (isHorizontal ? 1 : num) * size.height)];
    return [NSArray arrayWithArray:array];
}

- (NSArray *)tileImageViews:(CGSize)size
                 withColumn:(NSUInteger)column
                     andRow:(NSUInteger)row
{
    NSMutableArray *rowArray = [NSMutableArray arrayWithCapacity:row];
    
    CGFloat horizontalOffset = size.width;
    CGFloat verticalOffset = size.height;
    for(int j = 0; j < row; j++) {
        NSMutableArray *columnArray = [NSMutableArray arrayWithCapacity:column];
        for(int i = 0; i < column; i++) {
            CGRect frame;
            frame.size = size;
            frame.origin = CGPointMake(horizontalOffset * i, verticalOffset * j);
            UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            ai.center = CGPointMake(frame.origin.x + size.width / 2, frame.origin.y + size.height / 2);
            [self addSubview:ai];
            [ai startAnimating];
            [ai release];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
            [self addSubview:imageView];
            [columnArray addObject:imageView];
            [imageView release];
        }
        [rowArray addObject:[NSArray arrayWithArray:columnArray]];
    }
    
    [self setPagingEnabled:YES];
    
    [self setContentSize:CGSizeMake(column * size.width, row * size.height)];
    return [NSArray arrayWithArray:[NSArray arrayWithArray:rowArray]];
}

@end
