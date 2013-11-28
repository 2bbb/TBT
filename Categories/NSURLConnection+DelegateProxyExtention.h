//
//  NSURLConnection+DelegateProxyExtention.h
//
//  Created by ISHII Tsuubito on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSURLRequest+TBFaster.h"

typedef void (^NSURLConnectionDownloadCompletionBlock)();

extern NSString *NSURLRequestMethodGET;
extern NSString *NSURLRequestMethodPOST;
extern NSString *NSURLRequestMethodPUT;
extern NSString *NSURLRequestMethodDELETE;

@interface NSURLConnectionProxy  : NSObject
<
    NSURLConnectionDelegate
> {
    NSURLConnectionDownloadCompletionBlock block;
}

- (id)initWithCompletionBlock:(NSURLConnectionDownloadCompletionBlock)block;

@end

@interface NSURLConnection (DelegateProxyExtention)

+ (id)connectionWithURLString:(NSString *)urlString
                    forMethod:(BOOL)isGET
                withParameter:(NSDictionary *)params
                   completion:(NSURLConnectionDownloadCompletionBlock)completion;

@end
