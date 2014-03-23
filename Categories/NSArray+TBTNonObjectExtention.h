//
//  NSArray+TBTNonObjectExtention.h
//
//  Created by ISHII 2bit on 12/10/18.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark get

@interface NSArray (TBTNonObjectExtention)

- (BOOL)boolAtIndex:(NSUInteger)index;
- (char)charAtIndex:(NSUInteger)index;
- (unsigned char)unsignedCharAtIndex:(NSUInteger)index;
- (short)shortAtIndex:(NSUInteger)index;
- (unsigned short)unsignedShortAtIndex:(NSUInteger)index;
- (int)intAtIndex:(NSUInteger)index;
- (unsigned int)unsignedIntAtIndex:(NSUInteger)index;
- (long)longAtIndex:(NSUInteger)index;
- (unsigned long)unsignedLongAtIndex:(NSUInteger)index;
- (long long)longLongAtIndex:(NSUInteger)index;
- (unsigned long long)unsignedLongLongAtIndex:(NSUInteger)index;
- (float)floatAtIndex:(NSUInteger)index;
- (double)doubleAtIndex:(NSUInteger)index;
- (NSInteger)integerAtIndex:(NSUInteger)index;
- (NSUInteger)unsignedIntegerAtIndex:(NSUInteger)index;

- (const void *)pointerAtIndex:(NSUInteger)index;

- (CGPoint)cgPointAtIndex:(NSUInteger)index;
- (CGSize)cgSizeAtIndex:(NSUInteger)index;
- (CGRect)cgRectAtIndex:(NSUInteger)index;
- (NSRange)nsRangeAtIndex:(NSUInteger)index;

- (void *)valueWithBytesAtIndex:(NSUInteger)index forTarget:(void *)target;

@end

#pragma mark -
#pragma mark add

@interface NSMutableArray (TBNonObjectExtention)

- (void)addBool:(BOOL)value;
- (void)addChar:(char)value;
- (void)addUnsignedChar:(unsigned char)value;
- (void)addShort:(short)value;
- (void)addUnsignedShort:(unsigned short)value;
- (void)addInt:(int)value;
- (void)addUnsignedInt:(unsigned int)value;
- (void)addLong:(long)value;
- (void)addUnsignedLong:(unsigned long)value;
- (void)addLongLong:(long long)value;
- (void)addUnsignedLongLong:(unsigned long long)value;
- (void)addFloat:(float)value;
- (void)addDouble:(double)value;
- (void)addInteger:(NSInteger)value;
- (void)addUnsignedInteger:(NSUInteger)value;

- (void)addPointer:(const void *)pointer;

- (void)addCGPoint:(CGPoint)point;
- (void)addCGSize:(CGSize)size;
- (void)addCGRect:(CGRect)rect;
- (void)addNSRange:(NSRange)range;

- (void)addValueWithBytes:(const void *)value withObjCType:(const char *)type;

@end