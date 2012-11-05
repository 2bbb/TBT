//
//  NSURLConnection+DelegateProxyExtention.h
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSURLRequest+TBFaster.h"

typedef void (^NSURLConnectionDownloadCompletionBlock)();

@interface NSURLConnectionProxy  : NSObject
<
    NSURLConnectionDelegate
> {
    NSURLConnectionDownloadCompletionBlock block;
}

- (id)initWithCompletionBlock:(NSURLConnectionDownloadCompletionBlock)block;

@end

@implementation NSURLConnectionProxy

- (id)initWithCompletionBlock:(NSURLConnectionDownloadCompletionBlock)_block {
    if(self = [super init]) {
        block = [_block retain];
    }
    
    return self;
}

@end

@interface NSURLConnection (DelegateProxyExtention)

+ (id)connectionWithURLString:(NSString *)urlString
                    forMethod:(BOOL)isGET
                withParameter:(NSDictionary *)params
                   completion:(NSURLConnectionDownloadCompletionBlock)completion;

@end
