//
//  TBHTTPRequest.h
//  TBUtilities
//
//  Created by ISHII 2bit on 12/09/18.
//  Copyright (c) 2012 buffer Renaiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TBHTTPRequest;

@protocol TBHTTPRequestDelegate <NSObject>

@required

- (void)requestSuccess:(TBHTTPRequest *)request;

@optional

- (void)requestFailure:(TBHTTPRequest *)request withError:(NSError *)error;
- (void)authenticationChallengeFailured:(TBHTTPRequest *)request;

@end

@interface TBHTTPRequest : NSObject {
	id<TBHTTPRequestDelegate> delegate;
	BOOL isVerbose;
	
	SEL successSelector;
	id successTarget;
	
	SEL failureSelector;
	id failureTarget;
	
	SEL authenticateFailureSelector;
	id authenticateFailureTarget;
	
	NSString *urlString;
	NSString *basicUser;
	NSString *basicPass;
	NSMutableString *paramString;
	BOOL isPost;
	
	id identifier;
	
	NSHTTPURLResponse *httpURLResponse;
	NSMutableData *receivedData;
}

#pragma mark -
#pragma mark Initialize for delegate pattern

- (id)initWithDelegate:(id<TBHTTPRequestDelegate>)_delegate
			identifier:(id)_identifier;
- (void)setDelegate:(id<TBHTTPRequestDelegate>)_delegate;

#pragma mark Initialize for target/selector pattern

- (id)initWithSuccessSelector:(SEL)_successSelector
					forTarget:(id)_successTarget
				   identifier:(id)_identifier;
- (void)setFailureSelector:(SEL)_failureSelector
				 forTarget:(id)_failureTaget;
- (void)setAuthenticateFailureSelector:(SEL)_authenticateFailureSelector
							 forTarget:(id)_authenticateFailureTaget;

#pragma mark Convinience for GET

+ (id)getRequestForURL:(NSString *)urlString
		  withDelegate:(id<TBHTTPRequestDelegate>)_delegate
		  andParameter:(NSDictionary *)parameter
			identifier:(id)_identifier;
+ (id)postRequestForURL:(NSString *)urlString
		   withDelegate:(id<TBHTTPRequestDelegate>)_delegate
		   andParameter:(NSDictionary *)parameter
			 identifier:(id)_identifier;

- (void)setIdentifier:(id)_identifier;
- (id)identifier;
- (void)setVerbose:(BOOL)_isVerbose;

#pragma mark -
#pragma mark Construct Request

- (void)setURL:(NSString *)_urlString;
- (void)setBasicUser:(NSString *)_basicUser
		 andPassword:(NSString *)_basicPass;
- (void)setPost:(BOOL)_isPost;
- (void)addParameters:(NSDictionary *)_param;
- (void)addParameterValue:(id)value forKey:(NSString *)key;

- (BOOL)sendRequest;

#pragma mark -
#pragma mark Get Response

- (NSHTTPURLResponse *)httpURLResponse;
- (NSInteger)statusCode;
- (long long)expectedContentLength;
- (NSString *)textEncodingName;
- (NSString *)MIMEType;
- (NSDictionary *)allHeaderFields;

- (NSData *)responseRawData;
- (NSString *)responseString;
- (NSString *)responseStringWithEncoding:(NSStringEncoding)encoding;

@end

