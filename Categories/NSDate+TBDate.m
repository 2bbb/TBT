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
	int month = [components day];
	
	return month;
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
	int month = [components month];
	
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
	int year = [components year];
	
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
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
	
	NSCalendar* cal = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	unsigned int unitFlags = NSYearCalendarUnit |
	NSMonthCalendarUnit |
	NSDayCalendarUnit |
	NSHourCalendarUnit |
	NSMinuteCalendarUnit |
	NSSecondCalendarUnit;
	NSDateComponents *components = [cal components:unitFlags fromDate:date];
	
	[dict setObject:[NSNumber numberWithInt:[components year]] forKey:@"year"];
	[dict setObject:[NSNumber numberWithInt:[components month]] forKey:@"month"];
	[dict setObject:[NSNumber numberWithInt:[components day]] forKey:@"day"];
	[dict setObject:[NSNumber numberWithInt:[components hour]] forKey:@"hour"];
	[dict setObject:[NSNumber numberWithInt:[components minute]] forKey:@"minute"];
	[dict setObject:[NSNumber numberWithInt:[components second]] forKey:@"second"];
	
	return [NSDictionary dictionaryWithDictionary:dict];
}

@end
