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

/* **** **** **** **** **** **** **** **** **** **** **** **** *
 *                                                             *
 *  NSDate+TBDate.m                                            *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#import "NSDate+TBTDate.h"

@implementation NSDate (TBDate)

+ (NSInteger)getDay:(NSDate *)date {
	NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	NSInteger day = [components day];
    
	cal = nil;
    
	return day;
}

+ (NSInteger)getMonth:(NSDate *)date {
	NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	NSInteger month = [components month];
	
    cal = nil;
    
	return month;
}

+ (NSInteger)getYear:(NSDate *)date {
	NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	NSInteger year = [components year];
	
    cal = nil;
    
	return year;
}

+ (NSDateComponents *)timeComponents {
	NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
    
    cal = nil;
    
	return [cal components:unitFlags fromDate:[NSDate date]];
}

+ (NSDictionary *)getCalenderDatas:(NSDate *)date {
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
	
	NSCalendar* cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	
	[dict setObject:@([components year]) forKey:@"year"];
	[dict setObject:@([components month]) forKey:@"month"];
	[dict setObject:@([components day]) forKey:@"day"];
	[dict setObject:@([components hour]) forKey:@"hour"];
	[dict setObject:@([components minute]) forKey:@"minute"];
	[dict setObject:@([components second]) forKey:@"second"];
	
    cal = nil;
    
	return [NSDictionary dictionaryWithDictionary:dict];
}

@end
