//
//  TBSingletonMacro.h
//
//  Created by ISHII 2bit on 2013/11/29.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#ifndef __TBSingletonMacro__
#define __TBSingletonMacro__

#ifdef __OBJC__

#define CreateSingletonInitialize(Klass) \
static Klass *manager = nil;\
\
+ (Klass *)sharedManager {\
    if(manager == nil) {\
        @synchronized(self) {\
            manager = [[Klass alloc] init];\
        }\
    }\
    return manager;\
}

#define SetSingletonARC(Klass)   CreateSingletonInitialize(Klass)

#define SetSingletonNoARC(Klass) \
CreateSingletonInitialize(Klass)\
- (id)retain { return self; }\
- (NSUInteger)retainCount { return UINT_MAX; }\
- (oneway void)release {}\
- (id)autorelease { return self; }

#if !__has_feature(objc_arc)
#	define SetSingleton(Klass) SetSingletonNoARC(Klass)
#else
#   define SetSingleton(Klass) SetSingletonARC(Klass)
#endif

#endif /* __OBJC__ */

#endif
