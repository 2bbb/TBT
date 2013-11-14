/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  NSString+TBString.h                                        *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** *
 *                                                             *
 * 2012/08/06 Ver. 0.0                                         *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@interface NSString (TBString)

- (BOOL) isEmpty;
- (BOOL) isNotEmpty;
- (NSString *)urlEncode;
- (NSString *)urlDecode;
- (NSString *)escapeHtml;
- (NSString *)unescapeHtml;
- (NSString *)md5String;
+ (NSString *)formatedNumberString:(NSInteger)number;

@end

@interface NSMutableString (TBMutableString)

@end
