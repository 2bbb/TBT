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
//  NSMutableURLRequest+TBTPostRequestExtention.h
//  TBUtilitiesExample
//
//  Created by ISHII 2bit on 2013/08/18.
//  Copyright (c) 2013年 buffer Renaiss. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kPostFileData;
extern NSString * const kPostFileName;
extern NSString * const kPostFileMimeType;

@interface NSMutableURLRequest (TBTPostRequestExtention)

+ (NSMutableURLRequest *)postRequestForURL:(NSString *)urlString
                        withPostParameters:(NSDictionary *)postParameters
                              andPostFiles:(NSDictionary *)postFiles;

@end
