//
//  TBSingletonBase.m
//  Gatsby
//
//  Created by ISHII 2bit on 2013/08/19.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import "TBSingletonBase.h"

@implementation TBSingletonBase

static NSMutableDictionary *_instances;

+ (instancetype)sharedInstance {
    __block TBSingletonBase *singleton;
    @synchronized(self) {
        if ([_instances objectForKey:NSStringFromClass(self)] == nil) {
            singleton = [[self alloc] initSharedInstance];
        }
    }
    singleton = [_instances objectForKey:NSStringFromClass(self)];
    return singleton;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if ([_instances objectForKey:NSStringFromClass(self)] == nil) {
            id instance = [super allocWithZone:zone];
            if (_instances == nil) {
                _instances = [[NSMutableDictionary alloc] initWithCapacity:0];
            }
            [_instances setObject:instance forKey:NSStringFromClass(self)];
            return instance;
        }
    }
    return nil;
}

- (instancetype)initSharedInstance {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return UINT_MAX;
}

- (oneway void)release {
    // シングルトン状態を保持するため何もしない
}

- (id)autorelease {
    return self;
}

@end
