//
//  NSArray+TBShuffle.m
//
//  Created by ISHII Tsuubito on 12/10/18.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "NSArray+TBShuffle.h"

@implementation NSArray (TBShuffle)

- (NSArray *)shuffledArray {
//    srand(time(NULL));
    NSMutableArray *results = [NSMutableArray arrayWithArray:self];
    
    int i = [results count];
    while(--i) {
        int j = rand() % (i + 1);
        [results exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    return [NSArray arrayWithArray:results];
}

- (id)objectAtRandom {
    if([self count] == 0) return nil;
    return [self objectAtIndex:rand() % [self count]];
}

@end
