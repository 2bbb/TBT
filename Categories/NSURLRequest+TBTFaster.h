//
//  NSURLRequest+TBTFaster.h
//
//  Created by ISHII 2bit on 12/10/13.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Immutable

@interface NSURLRequest (TBTFaster)

+ (id)requestWithURLString:(NSString *)urlString;

@end

#pragma mark Mutable

@interface NSMutableURLRequest (TBTFaster)

+ (id)requestWithURLString:(NSString *)urlString;
- (void)setHTTPBodyDictionary:(NSDictionary *)parameter;

@end