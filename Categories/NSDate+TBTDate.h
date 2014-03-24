/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  NSDate+TBDate.h                                            *
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

@interface NSDate (TBDate)

+ (NSInteger)getDay:(NSDate *)date;
+ (NSInteger)getMonth:(NSDate *)date;
+ (NSInteger)getYear:(NSDate *)date;

+ (NSDateComponents *)timeComponents;

+ (NSDictionary *)getCalenderDatas:(NSDate *)date;

@end