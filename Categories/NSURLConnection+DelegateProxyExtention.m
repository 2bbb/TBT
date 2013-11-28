//
//  NSURLConnection+DelegateProxyExtention.m
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "NSURLConnection+DelegateProxyExtention.h"

static NSString *NSURLRequestMethodGET    = @"GET";
static NSString *NSURLRequestMethodPOST   = @"POST";

#pragma GCC diagnostic ignored "-Wunused-variable"
static NSString *NSURLRequestMethodPUT    = @"PUT";
static NSString *NSURLRequestMethodDELETE = @"DELETE";
#pragma GCC diagnostic warning "-Wunused-variable"

@implementation NSURLConnectionProxy

- (id)initWithCompletionBlock:(NSURLConnectionDownloadCompletionBlock)_block {
    if(self = [super init]) {
        block = [_block retain];
    }
    
    return self;
}

@end

@implementation NSURLConnection (DelegateProxyExtention)

+ (id)connectionWithURLString:(NSString *)urlString
                    forMethod:(BOOL)isGET
                withParameter:(NSDictionary *)params
                   completion:(NSURLConnectionDownloadCompletionBlock)completion
{
    NSURLConnectionProxy *proxy = [[NSURLConnectionProxy alloc] initWithCompletionBlock:completion];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURLString:urlString];
    [request setHTTPMethod:(isGET ? NSURLRequestMethodGET : NSURLRequestMethodPOST)];
    [request setHTTPBodyDictionary:params];
    
    return [NSURLConnection connectionWithRequest:request delegate:proxy];
}

@end
