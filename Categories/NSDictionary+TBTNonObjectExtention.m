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

//
//  NSDictionary+TBTNonObjectExtention.m
//
//  Created by ISHII Tsuubito on 12/10/18.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "NSDictionary+TBTNonObjectExtention.h"

@implementation NSDictionary (TBTNonObjectExtention)

- (BOOL)boolForKey:(id)key {
    return [[self objectForKey:key] boolValue];
}

- (char)charForKey:(id)key {
    return [[self objectForKey:key] charValue];
}

- (unsigned char)unsignedCharForKey:(id)key {
    return [[self objectForKey:key] unsignedCharValue];
}

- (short)shortForKey:(id)key {
    return [[self objectForKey:key] shortValue];
}

- (unsigned short)unsignedShortForKey:(id)key {
    return [[self objectForKey:key] unsignedShortValue];
}

- (int)intForKey:(id)key {
    return [[self objectForKey:key] intValue];
}

- (unsigned int)unsignedIntForKey:(id)key {
    return [[self objectForKey:key] unsignedIntValue];
}

- (long)longForKey:(id)key {
    return [[self objectForKey:key] longValue];
}

- (unsigned long)unsignedLongForKey:(id)key {
    return [[self objectForKey:key] unsignedLongValue];
}

- (long long)longLongForKey:(id)key {
    return [[self objectForKey:key] longLongValue];
}

- (unsigned long long)unsignedLongLongForKey:(id)key {
    return [[self objectForKey:key] unsignedLongLongValue];
}

- (float)floatForKey:(id)key {
    return [[self objectForKey:key] floatValue];
}

- (double)doubleForKey:(id)key {
    return [[self objectForKey:key] doubleValue];
}

- (NSInteger)integerForKey:(id)key {
    return [[self objectForKey:key] integerValue];
}

- (NSUInteger)unsignedIntegerForKey:(id)key {
    return [[self objectForKey:key] unsignedIntegerValue];
}


- (const void *)pointerForKey:(id)key {
    return [[self objectForKey:key] pointerValue];
}


- (CGPoint)cgPointForKey:(id)key {
    return [[self objectForKey:key] CGPointValue];
}

- (CGSize)cgSizeForKey:(id)key {
    return [[self objectForKey:key] CGSizeValue];
}

- (CGRect)cgRectForKey:(id)key {
    return [[self objectForKey:key] CGRectValue];
}

- (NSRange)nsRangeForKey:(id)key {
    return [[self objectForKey:key] rangeValue];
}


- (void *)valueWithBytesForKey:(id)key forTarget:(void *)target {
    NSValue *value = [self objectForKey:key];
    [value getValue:target];
    
    return target;
}

@end

@implementation NSMutableDictionary (TBTNonObjectExtention)

- (void)setBool:(BOOL)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithBool:value] forKey:key];
}

- (void)setChar:(char)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithChar:value] forKey:key];
}

- (void)setUnsignedChar:(unsigned char)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithUnsignedChar:value] forKey:key];
}

- (void)setShort:(short)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithShort:value] forKey:key];
}

- (void)setUnsignedShort:(unsigned short)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithUnsignedShort:value] forKey:key];
}

- (void)setInt:(int)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithInt:value] forKey:key];
}

- (void)setUnsignedInt:(unsigned int)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithUnsignedInt:value] forKey:key];
}

- (void)setLong:(long)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithLong:value] forKey:key];
}

- (void)setUnsignedLong:(unsigned long)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithUnsignedLong:value] forKey:key];
}

- (void)setLongLong:(long long)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithLongLong:value] forKey:key];
}

- (void)setUnsignedLongLong:(unsigned long long)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithUnsignedLongLong:value] forKey:key];
}

- (void)setFloat:(float)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithFloat:value] forKey:key];
}

- (void)setDouble:(double)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithDouble:value] forKey:key];
}

- (void)setInteger:(NSInteger)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithInteger:value] forKey:key];
}

- (void)setUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)key {
    [self setObject:[NSNumber numberWithUnsignedInteger:value] forKey:key];
}


- (void)setPointer:(const void *)pointer forKey:(id<NSCopying>)key {
    [self setObject:[NSValue valueWithPointer:pointer] forKey:key];
}


- (void)setCGPoint:(CGPoint)point forKey:(id<NSCopying>)key {
    [self setObject:[NSValue valueWithCGPoint:point] forKey:key];
}

- (void)setCGSize:(CGSize)size forKey:(id<NSCopying>)key {
    [self setObject:[NSValue valueWithCGSize:size] forKey:key];
}

- (void)setCGRect:(CGRect)rect forKey:(id<NSCopying>)key {
    [self setObject:[NSValue valueWithCGRect:rect] forKey:key];
}

- (void)setNSRange:(NSRange)range forKey:(id<NSCopying>)key {
    [self setObject:[NSValue valueWithRange:range] forKey:key];
}


- (void)setValueWithBytes:(const void *)value
             withObjCType:(const char *)type
                   forKey:(id<NSCopying>)key
{
    [self setObject:[NSValue valueWithBytes:value objCType:type] forKey:key];
}

@end
