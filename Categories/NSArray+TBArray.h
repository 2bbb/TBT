/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  NSArray+TBArray.h                                          *
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

@interface NSArray (TBArray)

- (id)firstObject;
- (NSArray *)reversedArray;

- (id)objectAtCroppedIndex:(NSInteger)n;
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

