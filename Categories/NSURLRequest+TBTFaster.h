//
//  NSURLRequest+TBFaster.h
//
//  Created by ISHII Tsuubito on 12/10/13.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Immutable

@interface NSURLRequest (TBFaster)

+ (id)requestWithURLString:(NSString *)urlString;

@end

#pragma mark Mutable

@interface NSMutableURLRequest (TBFaster)

+ (id)requestWithURLString:(NSString *)urlString;
- (void)setHTTPBodyDictionary:(NSDictionary *)parameter;

@end