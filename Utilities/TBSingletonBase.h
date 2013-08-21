//
//  TBSingletonBase.h
//  Gatsby
//
//  Created by ISHII 2bit on 2013/08/19.
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBSingletonBase : NSObject

+ (instancetype)sharedInstance;

- (instancetype)initSharedInstance;

@end
