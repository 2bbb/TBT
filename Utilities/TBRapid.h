//
//  TBRapid.h
//
//  Created by ISHII 2bit on 2013/11/27.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#ifndef __TBRapid__
#define __TBRapid__

#ifdef __OBJC__

#define DeclareConstant(name) extern NSString * const name;
#define DefineConstant(name, value) NSString * const name = value;

#define DeclareNotification(name) DeclareConstant(name##Notification)
#define DefineNotification(name)  DefineConstant(name##Notification, @#name"Notification")

#define DeclareKey(name) DeclareConstant(name##Key)
#define DefineKey(name)  DefineConstant(name##Key, @#name"Key")

#define LS(key, comment) NSLocalizedString(key, comment)

#endif /* ifdef __OBJC__ */

#include "TBSingletonMacro.h"

#endif /* ifdef __TBRapid__ */