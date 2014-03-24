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
//  UIResponder+TBTAppDelegateExtention.m
//
//  Created by ISHII 2bit on 12/10/17.
//  Copyright (c) 2012 buffer Renaiss co., ltd. All rights reserved.
//

#import "UIResponder+TBTAppDelegateExtention.h"

@implementation UIResponder (AppDelegateExtention)

- (id)retrieveFromUserDefaults:(NSString*)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
    id idVal;
    
    if(defaults) {
		idVal = [defaults objectForKey:key];
    } else {
		idVal = nil;
    }
	
    if(idVal == nil) {
        NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
        NSString *settingsPath = [bundlePath stringByAppendingPathComponent:@"Settings.bundle"];
        NSString *plistFile = [settingsPath stringByAppendingPathComponent:@"Root.plist"];
		
        NSDictionary *settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:plistFile];
        NSArray *preferencesArray = [settingsDictionary objectForKey:@"PreferenceSpecifiers"];
		
        for(NSDictionary *item in preferencesArray) {
            NSString *keyValue = [item objectForKey:@"Key"];
			
            id defaultValue = [item objectForKey:@"DefaultValue"];
			
            if (keyValue && defaultValue) {
                [defaults setObject:defaultValue forKey:keyValue];
                if ([keyValue compare:key] == NSOrderedSame) {
                    idVal = defaultValue;
                }
            }
        }
        [defaults synchronize];
    }
    
    return idVal;
}

@end
