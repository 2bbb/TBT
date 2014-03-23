//
//  NSArray+TBTNonObjectExtention.h
//
//  Created by ISHII 2bit on 12/10/18.
//  Copyright (c) 2012年 buffer Renaiss co., ltd. All rights reserved.
//

#import "NSArray+TBTNonObjectExtention.h"

#pragma mark getter

@implementation NSArray (TBTNonObjectExtention)

- (BOOL)boolAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] boolValue];
}

- (char)charAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] charValue];
}

- (unsigned char)unsignedCharAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] unsignedCharValue];
}

- (short)shortAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] shortValue];
}

- (unsigned short)unsignedShortAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] unsignedShortValue];
}

- (int)intAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] intValue];
}

- (unsigned int)unsignedIntAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] unsignedIntValue];
}

- (long)longAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] longValue];
}

- (unsigned long)unsignedLongAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] unsignedLongValue];
}

- (long long)longLongAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] longLongValue];
}

- (unsigned long long)unsignedLongLongAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] unsignedLongLongValue];
}

- (float)floatAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] floatValue];
}

- (double)doubleAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] doubleValue];
}

- (NSInteger)integerAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] integerValue];
}

- (NSUInteger)unsignedIntegerAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] unsignedIntegerValue];
}


- (const void *)pointerAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] pointerValue];
}


- (CGPoint)cgPointAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] CGPointValue];
}

- (CGSize)cgSizeAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] CGSizeValue];
}

- (CGRect)cgRectAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] CGRectValue];
}

- (NSRange)nsRangeAtIndex:(NSUInteger)index {
    return [[self objectAtIndex:index] rangeValue];
}


- (void *)valueWithBytesAtIndex:(NSUInteger)index forTarget:(void *)target {
    NSValue *value = [self objectAtIndex:index];
    [value getValue:target];
    
    return target;
}

@end

#pragma mark -
#pragma mark add

@implementation NSMutableArray (TBNonObjectExtention)

- (void)addBool:(BOOL)value {
    [self addObject:[NSNumber numberWithBool:value]];
}

- (void)addChar:(char)value {
    [self addObject:[NSNumber numberWithChar:value]];
}

- (void)addUnsignedChar:(unsigned char)value {
    [self addObject:[NSNumber numberWithUnsignedChar:value]];
}

- (void)addShort:(short)value {
    [self addObject:[NSNumber numberWithShort:value]];
}

- (void)addUnsignedShort:(unsigned short)value {
    [self addObject:[NSNumber numberWithUnsignedShort:value]];
}

- (void)addInt:(int)value {
    [self addObject:[NSNumber numberWithInt:value]];
}

- (void)addUnsignedInt:(unsigned int)value {
    [self addObject:[NSNumber numberWithUnsignedInt:value]];
}

- (void)addLong:(long)value {
    [self addObject:[NSNumber numberWithLong:value]];
}

- (void)addUnsignedLong:(unsigned long)value {
    [self addObject:[NSNumber numberWithUnsignedLong:value]];
}

- (void)addLongLong:(long long)value {
    [self addObject:[NSNumber numberWithLongLong:value]];
}

- (void)addUnsignedLongLong:(unsigned long long)value {
    [self addObject:[NSNumber numberWithUnsignedLongLong:value]];
}

- (void)addFloat:(float)value {
    [self addObject:[NSNumber numberWithFloat:value]];
}

- (void)addDouble:(double)value {
    [self addObject:[NSNumber numberWithDouble:value]];
}

- (void)addInteger:(NSInteger)value {
    [self addObject:[NSNumber numberWithInteger:value]];
}

- (void)addUnsignedInteger:(NSUInteger)value {
    [self addObject:[NSNumber numberWithUnsignedInteger:value]];
}


- (void)addPointer:(const void *)pointer {
    [self addObject:[NSValue valueWithPointer:pointer]];
}


- (void)addCGPoint:(CGPoint)point {
    [self addObject:[NSValue valueWithCGPoint:point]];
}

- (void)addCGSize:(CGSize)size {
    [self addObject:[NSValue valueWithCGSize:size]];
}

- (void)addCGRect:(CGRect)rect {
    [self addObject:[NSValue valueWithCGRect:rect]];
}

- (void)addNSRange:(NSRange)range {
    [self addObject:[NSValue valueWithRange:range]];
}


- (void)addValueWithBytes:(const void *)value withObjCType:(const char *)type {
    [self addObject:[NSValue valueWithBytes:value objCType:type]];
}

@end