//
//  NSURLConnection+ConnectionParameterExtention.h
//  Gatsby
//
//  Created by ISHII Tsuubito on 2013/08/27.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (ConnectionParameterExtention)

- (NSString *)originalRequestURLString;
- (BOOL)originalRequestURLStringIsEqualToString:(NSString *)urlString;

@end
