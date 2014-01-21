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

static NSString * const boundary = @"NSMURLR_PRE";
static NSString * const fileBoundary = @"NSMURLR_PRE_FILE";

NSString * const kPostFileData = @"PostFileData";
NSString * const kPostFileName = @"PostFileName";
NSString * const kPostFileMimeType = @"PostFileType";

@implementation NSMutableURLRequest (PostRequestExtention)

+ (NSMutableURLRequest *)postRequestForURL:(NSString *)urlString
                        withPostParameters:(NSDictionary *)postParameters
                              andPostFiles:(NSDictionary *)postFiles
{
    NSMutableData *postBodyData = [NSMutableData data];
    NSMutableString *postString = [NSMutableString string];
    
    NSString *str = [NSString stringWithFormat:@"Content-Type: multipart/form-data; boundary=%@\r\n\r\n", boundary];
    [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    [postString appendString:str];
    
    if(postParameters) {
        for(NSString *name in [postParameters allKeys]) {
            id value = [postParameters objectForKey:name];
            str = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n", boundary, name, value];
            [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
            [postString appendString:str];
        }
//        str = [NSString stringWithFormat:@"--%@--\r\n", boundary];
//        [postString appendString:str];
//        [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    if(postFiles && 0 < [postFiles count]) {
//        str = [NSString stringWithFormat:@"%@\r\nContent-Disposition: form-data; name=\"files\"\r\nContent-Type: multipart/mixed; boundary=%@\r\n\r\n", boundary, fileBoundary];
//        [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
//        [postString appendString:str];
        
        for(NSString *name in [postFiles allKeys]) {
            NSDictionary *dataDict = [postFiles objectForKey:name];
            NSData *data = [dataDict objectForKey:kPostFileData];
            NSString *mimeType = [dataDict objectForKey:kPostFileMimeType];
            NSString *fileName = [dataDict objectForKey:kPostFileName];
            
//            str = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: file; filename=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\nContent-Transfer-Encoding: binary\r\n\r\n", fileBoundary, name, fileName, mimeType];
            str = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n", boundary, name, fileName, mimeType];
            [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
            [postString appendString:str];
            
            [postBodyData appendData:data];
            [postString appendString:@"contents..."];

            [postBodyData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            [postString appendString:@"\r\n"];
        }
//        str = [NSString stringWithFormat:@"--%@--\r\n", fileBoundary];
        str = [NSString stringWithFormat:@"--%@--\r\n", boundary];
        [postString appendString:str];
        [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
//    str = [NSString stringWithFormat:@"--%@--", boundary];
//    [postBodyData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
//    [postString appendString:str];
//    LogDebug(@"postString : \n%@", postString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURLString:urlString];
    [request setValue:[NSString stringWithFormat:@"multipart/form-data, boundary=%@", boundary]
   forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postBodyData];
    
    return request;
}

@end