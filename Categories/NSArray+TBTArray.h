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
 *  NSArray+TBTArray.h                                         *
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

@interface NSArray (TBTArray)

/**
 * syntax sugar:
 *
 * @return self[0]
 */
- (id)firstObject;

/**
 * non-destructive
 *
 * @return reversed array
 */
- (NSArray *)reversedArray;

/**
 *
 *
 * @return if n < 0 then self[0] else if self.count <= n then self[self.count-1] else self[n]
 */
- (id)objectAtCroppedIndex:(NSInteger)n;

/**
 *
 *
 * @return if n < 0 or self.count <= n then value else self[n]
 */
- (id)objectAtIndex:(NSInteger)n withDefaultValue:(id)value;

- (NSArray *)map:(id (^)(id x))f;
- (id)foldl:(id)u withOp:(id (^)(id x, id y))op;
- (NSMutableArray *)filteredArrayUsingBlocks:(BOOL (^)(id))filter;

- (BOOL)has:(id)x;
- (NSArray *)distributionTo:(NSUInteger)n;
- (NSArray *)excludeArrayBy:(NSArray *)array;

@end

@interface NSMutableArray (TBMutableArray)
- (void)insertObjectsAtHead:(NSArray *)arr;
- (void)insertObjects:(NSArray *)arr atIndex:(NSInteger)n;
@end

