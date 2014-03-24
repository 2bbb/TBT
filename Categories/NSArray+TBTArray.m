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
 *  NSArray+TBTArray.m                                         *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#import "NSArray+TBTArray.h"

@implementation NSArray (TBTArray)

- (id)firstObject {
    return [self count] ? [self objectAtIndex:0] : nil;
}

- (NSArray *)reversedArray {
    return [[self reverseObjectEnumerator] allObjects];
}

- (id)objectAtCroppedIndex:(NSInteger)n {
	n = (n < 0) ? 0 : (n < [self count] ? n : [self count] - 1);
	return [self objectAtIndex:n];
}

- (id)objectAtIndex:(NSInteger)n withDefaultValue:(id)value {
	if((n < 0) || ([self count] <= n)) return value;
	return [self objectAtIndex:n];
}

- (NSArray *)map:(id (^)(id x))f {
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
	for(id x in self) {
		[array addObject:f(x)];
	}
	return array;
}

- (id)foldl:(id)u withOp:(id (^)(id x, id y))op {
	for(id x in self) {
		u = op(u, x);
	}
	return u;
}

- (NSArray *)filteredArrayUsingBlocks:(BOOL (^)(id))_filter {
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
	for(id obj in self) {
		if(_filter(obj)) {
			[array addObject:obj];
		}
	}
	return array;
}

- (NSArray *)distributionTo:(NSUInteger)n {
	if(n == 0) {
		return nil;
	}
	
	NSMutableArray *arrayArray = [NSMutableArray arrayWithCapacity:n];
	for(int i = 0; i < n; i++) {
		[arrayArray addObject:[NSMutableArray arrayWithCapacity:0]];
	}
	int c = 0;
	for(id x in self) {
		[[arrayArray objectAtIndex:c] addObject:x];
		c = (c + 1) % n;
	}
	return arrayArray;
}

- (BOOL)has:(id)x {
	return [[[self map:^(id y) {
		return (id)[NSNumber numberWithBool:(x == y)];
	}] foldl:[NSNumber numberWithBool:NO] withOp:^(id x, id y) {
		return (id)[NSNumber numberWithBool:([x boolValue] || [y boolValue])];
	}] boolValue];
}

- (NSArray *)excludeArrayBy:(NSArray *)array {
	__block NSArray *_array = array;
	return [self filteredArrayUsingBlocks:^(id x){
		return [_array has:x];
	}];
}

@end

@implementation NSMutableArray (TBMutableArray)

- (void)insertObjectsAtHead:(NSArray *)arr {
	[self insertObjects:arr atIndex:0];
}

- (void)insertObjects:(NSArray *)arr atIndex:(NSInteger)n {
	[self insertObjects:arr atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(n, [arr count])]];
}

@end