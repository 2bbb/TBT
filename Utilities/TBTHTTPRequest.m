/* **** **** **** **** **** **** **** **** **** **** **** **** *
 *.............................................................*
 *...........▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄..............*
 *..........▐░░░░░░░░░░░▌▐░░░░░░░░░░▌▐░░░░░░░░░░░▌.............*
 *...........▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▀▀▀▀█░█▀▀▀▀..............*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *...............▐░▌.....▐░█▀▀▀▀▀▀▀█░▌....▐░▌..................*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *................▀.......▀▀▀▀▀▀▀▀▀▀.......▀...................*
 *.............................................................*
 * **** **** **** **** **** **** **** **** **** **** **** **** */

//
//  TBTHTTPRequest.m
//
//  Created by ISHII 2bit on 12/09/18.
//  Copyright (c) 2012 buffer Renaiss. All rights reserved.
//

#import "TBTHTTPRequest.h"

#ifndef __TBLogger_h__
#ifndef __TBLoggerDummy_h__

#define LogTrace   NSLog
#define LogInfo    NSLog
#define LogDebug   NSLog
#define LogWarning NSLog
#define LogError   NSLog

#define IfTrace(condition, format, ...) if(condition) NSLog(format, ## __VA_ARGS__)
#define IfInfo    IfTrace
#define IfDebug   IfTrace
#define IfWarning IfTrace
#define IfError   IfTrace

#define __TBLoggerDummy_h__
#endif
#endif

@implementation TBTHTTPRequest

- (id)initWithDelegate:(id<TBTHTTPRequestDelegate>)_delegate
			identifier:(id)_identifier
{
	if(self = [super init]) {
		successSelector = NULL;
		failureSelector = NULL;
		authenticateFailureSelector = NULL;
		
		successTarget = nil;
		failureTarget = nil;
		authenticateFailureTarget = nil;
		
		delegate = _delegate;
		[self setIdentifier:_identifier];
		
		paramString = [[NSMutableString alloc] init];
	}
	return self;
}

- (void)setDelegate:(id<TBTHTTPRequestDelegate>)_delegate {
	delegate = _delegate;
}

- (id)initWithSuccessSelector:(SEL)_successSelector
					forTarget:(id)_successTarget
				   identifier:(id)_identifier
{
	if(self = [super init]) {
		successSelector	= _successSelector;
		failureSelector = NULL;
		authenticateFailureSelector = NULL;
		
		successTarget	= _successTarget;
		failureTarget = nil;
		authenticateFailureTarget = nil;
		
		delegate = nil;
		[self setIdentifier:_identifier];
		
		paramString = [[NSMutableString alloc] init];
	}
	return self;
}

- (void)setFailureSelector:(SEL)_failureSelector
			   forTarget:(id)_failureTaget
{
	failureSelector	= _failureSelector;
	failureTarget	= _failureTaget;
}

- (void)setAuthenticateFailureSelector:(SEL)_authenticateFailureSelector
						   forTarget:(id)_authenticateFailureTaget
{
	authenticateFailureSelector	= _authenticateFailureSelector;
	authenticateFailureTarget	= _authenticateFailureTaget;
}

+ (id)getRequestForURL:(NSString *)urlString
		  withDelegate:(id<TBTHTTPRequestDelegate>)_delegate
		  andParameter:(NSDictionary *)parameters
			identifier:(id)_identifier;
{
	TBTHTTPRequest *request = [[TBTHTTPRequest alloc] initWithDelegate:_delegate identifier:_identifier];
	[request setURL:urlString];
	[request addParameters:parameters];
	[request sendRequest];
	return request;
}

+ (id)postRequestForURL:(NSString *)urlString
		   withDelegate:(id<TBTHTTPRequestDelegate>)_delegate
		   andParameter:(NSDictionary *)parameters
			 identifier:(id)_identifier;
{
	TBTHTTPRequest *request = [[TBTHTTPRequest alloc] initWithDelegate:_delegate identifier:_identifier];
	[request setURL:urlString];
	[request setPost:YES];
	[request addParameters:parameters];
	[request sendRequest];
	return request;
}

- (void)setIdentifier:(id)_identifier {
	identifier = _identifier;
}

- (id)identifier {
	return identifier;
}

- (void)setVerbose:(BOOL)_isVerbose {
	isVerbose = _isVerbose;
}

#pragma mark Construct Request

- (void)setURL:(NSString *)_urlString {
	urlString = [_urlString copy];
}

- (void)setBasicUser:(NSString *)_basicUser
		 andPassword:(NSString *)_basicPass
{
	basicUser = [_basicUser copy];
	basicPass = [_basicPass copy];
}

- (void)setPost:(BOOL)_isPost {
	isPost = _isPost;
}

- (void)addParameters:(NSDictionary *)parameters {
	for(id key in [parameters allKeys]) {
		if([key isKindOfClass:[NSString class]]) {
			[self addParameterValue:[parameters objectForKey:key] forKey:key];
		}
	}
}

- (void)addParameterValue:(id)value
				   forKey:(NSString *)key
{
	NSString *valueString = nil;
	
	if([value isKindOfClass:[NSString class]]) {
		valueString = value;
	} else if([value isKindOfClass:[NSNumber class]]) {
		valueString = [(NSNumber *)value stringValue];
	} else if([value isKindOfClass:[NSDate class]]) {
		valueString = [NSString stringWithFormat:@"%ld", (long)[value timeIntervalSince1970]];
	}
	
	[paramString appendFormat:@"%@=%@&", key, valueString];
}

- (BOOL)sendRequest {
	NSMutableURLRequest *request;
	if(0 < [paramString length]) {
		[paramString deleteCharactersInRange:NSMakeRange([paramString length] - 1 , 1)];
	}
	if(isPost) {
		request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
		[request setHTTPMethod:@"POST"];
		[request setHTTPBody:[paramString dataUsingEncoding:NSUTF8StringEncoding]];
	} else {
		NSString *newURLString;
		if(0 < [paramString length]) {
			newURLString = [NSString stringWithFormat:@"%@?%@", urlString, paramString];
		} else {
			newURLString = urlString;
		}
		request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:newURLString]];
		[request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
	}
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	
	return (connection != nil);
}

#pragma mark Get Response

- (NSHTTPURLResponse *)httpURLResponse {
	return httpURLResponse;
}

- (NSInteger)statusCode {
	return [httpURLResponse statusCode];
}

- (long long)expectedContentLength {
	return [httpURLResponse expectedContentLength];
}

- (NSString *)textEncodingName {
	return [httpURLResponse textEncodingName];
}

- (NSString *)MIMEType {
	return [httpURLResponse MIMEType];
}


- (NSDictionary *)allHeaderFields {
	return [httpURLResponse allHeaderFields];
}

- (NSData *)responseRawData {
	return receivedData;
}

- (NSString *)responseString {
	NSString *responseString = [[NSString alloc] initWithData:receivedData
													 encoding:NSUTF8StringEncoding];
	return responseString;
}

- (NSString *)responseStringWithEncoding:(NSStringEncoding)encoding {
	NSString *responseString = [[NSString alloc] initWithData:receivedData
													 encoding:encoding];
	return responseString;
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    httpURLResponse = (NSHTTPURLResponse *)response;
	receivedData = [[NSMutableData alloc] initWithCapacity:0];
	
	if(isVerbose) {
		LogInfo(@"Expected ContentLength: %qi", [httpURLResponse expectedContentLength]);
		LogInfo(@"MIMEType: %@", [httpURLResponse MIMEType]);
		LogInfo(@"Suggested File Name: %@", [httpURLResponse suggestedFilename]);
		LogInfo(@"Text Encoding Name: %@", [httpURLResponse textEncodingName]);
		LogInfo(@"URL: %@", [httpURLResponse URL]);
		LogInfo(@"Received Response. Status Code: %d", [httpURLResponse statusCode]);
		NSDictionary *dict = [httpURLResponse allHeaderFields];
		NSArray *keys = [dict allKeys];
		for (int i = 0; i < [keys count]; i++) {
			LogInfo(@"    %@: %@",
                     [keys objectAtIndex:i],
                     [dict objectForKey:[keys objectAtIndex:i]]);
		}
	}
}

- (void)connection:(NSURLConnection *)connection
willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if(!(basicUser && basicPass)) return;
	if([challenge previousFailureCount] == 0) {
		NSURLCredential *credential = [NSURLCredential credentialWithUser:basicUser
																 password:basicPass
															  persistence:NSURLCredentialPersistenceForSession];
		[[challenge sender] useCredential:credential
			   forAuthenticationChallenge:challenge];
	} else {
		[[challenge sender] cancelAuthenticationChallenge:challenge];
		
		if(authenticateFailureTarget && [authenticateFailureTarget respondsToSelector:authenticateFailureSelector]) {
			[authenticateFailureTarget performSelector:authenticateFailureSelector withObject:self];
		} else if([delegate respondsToSelector:@selector(authenticationChallengeFailured:)]) {
			[delegate authenticationChallengeFailured:self];
		}
	}
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if(!(basicUser && basicPass)) return;
	if ([challenge previousFailureCount] == 0) {
        NSURLCredential *credential = [NSURLCredential credentialWithUser:basicUser
																 password:basicPass
															  persistence:NSURLCredentialPersistenceForSession];
        [[challenge sender] useCredential:credential
			   forAuthenticationChallenge:challenge];
    } else {
		[[challenge sender] cancelAuthenticationChallenge:challenge];
		
		if(authenticateFailureTarget && [authenticateFailureTarget respondsToSelector:authenticateFailureSelector]) {
			[authenticateFailureTarget performSelector:authenticateFailureSelector withObject:self];
		} else if([delegate respondsToSelector:@selector(authenticationChallengeFailured:)]) {
			[delegate authenticationChallengeFailured:self];
		}
    }
}

- (void)connection:(NSURLConnection *)connection
	didReceiveData:(NSData *)data
{
	[receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
	if(isVerbose) {
		LogError(@"Connection failed! Error - %@ %@",
			  [error localizedDescription],
			  [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
	}
	
	connection = nil;
	receivedData = nil;
	
	if(failureTarget && [failureTarget respondsToSelector:failureSelector]) {
		[failureTarget performSelector:failureSelector withObject:self withObject:error];
	} else if([delegate respondsToSelector:@selector(requestFailure:withError:)]) {
		[delegate requestFailure:self withError:error];
	}
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	if(isVerbose) {
		LogError(@"Succeeded! Received %d bytes of data", [receivedData length]);
	}
	
	connection = nil;
	if(successTarget && [successTarget respondsToSelector:successSelector]) {
		[successTarget performSelector:successSelector withObject:self];
	} else {
		[delegate requestSuccess:self];
	}
}

- (void)dealloc {
	urlString = nil;
	paramString = nil;
    receivedData = nil;
	httpURLResponse = nil;
	identifier = nil;
	basicUser = nil;
	basicPass = nil;
}

@end
