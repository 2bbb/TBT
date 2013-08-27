//
//  NSURLConnection+ConnectionParameterExtention.m
//  Gatsby
//
//  Created by ISHII Tsuubito on 2013/08/27.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import "NSURLConnection+ConnectionParameterExtention.h"

@implementation NSURLConnection (ConnectionParameterExtention)

- (NSString *)originalRequestURLString {
    return [[[self originalRequest] URL] absoluteString];
}

@end
