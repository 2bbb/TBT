//
//  TBSingletonMacro.h
//
//  Created by ISHII 2bit on 2013/11/29.
//  Copyright (c) 2013年 buffer Renaiss co., ltd. All rights reserved.
//

#ifndef __TBSingletonMacro__
#define __TBSingletonMacro__

#ifdef __OBJC__

#define DeclareSingleton(Klass) \
+ (Klass *)sharedManager;

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

#define DefineSingletonARC(Klass)   CreateSingletonInitialize(Klass)

#define DefineSingletonNoARC(Klass) \
CreateSingletonInitialize(Klass)\
- (id)retain { return self; }\
- (NSUInteger)retainCount { return UINT_MAX; }\
- (oneway void)release {}\
- (id)autorelease { return self; }

#if !__has_feature(objc_arc)
#	define DefineSingleton(Klass) DefineSingletonNoARC(Klass)
#else
#   define DefineSingleton(Klass) DefineSingletonARC(Klass)
#endif

#endif /* __OBJC__ */

#endif
