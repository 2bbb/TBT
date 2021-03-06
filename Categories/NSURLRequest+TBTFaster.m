//
//  NSURLRequest+TBTFaster.m
//
//  Created by ISHII 2bit on 12/10/13.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "NSURLRequest+TBTFaster.h"

#pragma mark Immutable

@implementation NSURLRequest (TBTFaster)

+ (id)requestWithURLString:(NSString *)urlString {
    return [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
}

@end

#pragma mark Mutable

@implementation NSMutableURLRequest (TBTFaster)

+ (id)requestWithURLString:(NSString *)urlString {
    return [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
}

- (void)setHTTPBodyDictionary:(NSDictionary *)parameter {
    NSMutableString *paramString = [NSMutableString string];
    NSArray *allKeys = [parameter allKeys];
    for(int i = 0; i < [allKeys count]; i++) {
        id key = [allKeys objectAtIndex:i];
        id value = [parameter objectForKey:key];
        if(i == [allKeys count] - 1) {
            [paramString appendFormat:@"%@=%@&", [key stringValue], [value stringValue]];
        } else {
            [paramString appendFormat:@"%@=%@", [key stringValue], [value stringValue]];
        }
    }
    [self setHTTPBody:[paramString dataUsingEncoding:NSUTF8StringEncoding]];
}

@end