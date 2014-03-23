//
//  NSDictionary+TBNonObjectExtention.h
//
//  Created by ISHII Tsuubito on 12/10/18.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TBNonObjectExtention)

- (BOOL)boolForKey:(id)key;
- (char)charForKey:(id)key;
- (unsigned char)unsignedCharForKey:(id)key;
- (short)shortForKey:(id)key;
- (unsigned short)unsignedShortForKey:(id)key;
- (int)intForKey:(id)key;
- (unsigned int)unsignedIntForKey:(id)key;
- (long)longForKey:(id)key;
- (unsigned long)unsignedLongForKey:(id)key;
- (long long)longLongForKey:(id)key;
- (unsigned long long)unsignedLongLongForKey:(id)key;
- (float)floatForKey:(id)key;
- (double)doubleForKey:(id)key;
- (NSInteger)integerForKey:(id)key;
- (NSUInteger)unsignedIntegerForKey:(id)key;

- (const void *)pointerForKey:(id)key;

- (CGPoint)cgPointForKey:(id)key;
- (CGSize)cgSizeForKey:(id)key;
- (CGRect)cgRectForKey:(id)key;
- (NSRange)nsRangeForKey:(id)key;

- (void *)valueWithBytesForKey:(id)key forTarget:(void *)target;

@end

@interface NSMutableDictionary (TBNonObjectExtention)

- (void)setBool:(BOOL)value forKey:(id<NSCopying>)key;
- (void)setChar:(char)value forKey:(id<NSCopying>)key;
- (void)setUnsignedChar:(unsigned char)value forKey:(id<NSCopying>)key;
- (void)setShort:(short)value forKey:(id<NSCopying>)key;
- (void)setUnsignedShort:(unsigned short)value forKey:(id<NSCopying>)key;
- (void)setInt:(int)value forKey:(id<NSCopying>)key;
- (void)setUnsignedInt:(unsigned int)value forKey:(id<NSCopying>)key;
- (void)setLong:(long)value forKey:(id<NSCopying>)key;
- (void)setUnsignedLong:(unsigned long)value forKey:(id<NSCopying>)key;
- (void)setLongLong:(long long)value forKey:(id<NSCopying>)key;
- (void)setUnsignedLongLong:(unsigned long long)value forKey:(id<NSCopying>)key;
- (void)setFloat:(float)value forKey:(id<NSCopying>)key;
- (void)setDouble:(double)value forKey:(id<NSCopying>)key;
- (void)setInteger:(NSInteger)value forKey:(id<NSCopying>)key;
- (void)setUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)key;

- (void)setPointer:(const void *)pointer forKey:(id<NSCopying>)key;

- (void)setCGPoint:(CGPoint)point forKey:(id<NSCopying>)key;
- (void)setCGSize:(CGSize)size forKey:(id<NSCopying>)key;
- (void)setCGRect:(CGRect)rect forKey:(id<NSCopying>)key;
- (void)setNSRange:(NSRange)range forKey:(id<NSCopying>)key;

- (void)setValueWithBytes:(const void *)value
             withObjCType:(const char *)type
                   forKey:(id<NSCopying>)key;

@end
