/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  NSDate+TBDate.m                                            *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#import "NSDate+TBDate.h"

@implementation NSDate (TBDate)

+ (NSInteger)getDay:(NSDate *)date {
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	NSInteger day = [components day];
	
	return day;
}

+ (NSInteger)getMonth:(NSDate *)date {
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	NSInteger month = [components month];
	
	return month;
}

+ (NSInteger)getYear:(NSDate *)date {
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	NSInteger year = [components year];
	
	return year;
}

+ (NSDateComponents *)timeComponents {
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	unsigned int unitFlags = NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	return [cal components:unitFlags fromDate:[NSDate date]];
}

+ (NSDictionary *)getCalenderDatas:(NSDate *)date {
	NSMutableDictionary *dict = [[[NSMutableDictionary alloc] initWithCapacity:6] autorelease];
	
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
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
	
	return [NSDictionary dictionaryWithDictionary:dict];
}

@end
