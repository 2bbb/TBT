//
//  NSMutableURLRequest+PostRequestExtention.m
//  TBUtilitiesExample
//
//  Created by ISHII 2bit on 2013/08/18.
//  Copyright (c) 2013年 buffer Renaiss. All rights reserved.
//

#import "NSMutableURLRequest+PostRequestExtention.h"

#import "NSURLRequest+TBFaster.h"
#import "NSURLConnection+DelegateProxyExtention.h"

@implementation NSMutableURLRequest (PostRequestExtention)

- (void)addPostData:(NSData *)data forKey:(NSString *)key {
    [self setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self setValue:[NSString stringWithFormat:@"%d", [data length]] forHTTPHeaderField:@"Content-Length"];
    [self setHTTPBody:data];
}

@end
