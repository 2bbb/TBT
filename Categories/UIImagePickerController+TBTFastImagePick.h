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
//  UIImagePickerController+TBTFastImagePick.h
//
//  Created by ISHII 2bit
//  Copyright (c) 2014 buffer Renaiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImagePickerController (TBTFastImagePick)

+ (UIImagePickerController *)imagePickerForType:(UIImagePickerControllerSourceType)sourceType;
+ (UIImagePickerController *)imagePickerForType:(UIImagePickerControllerSourceType)sourceType allowsEditing:(BOOL)isAllowEditing;
+ (UIImagePickerController *)stillPicker;
+ (UIImagePickerController *)stillPickerAllowsEditing:(BOOL)isAllowEditing;
+ (UIImagePickerController *)photoLibraryPicker;
+ (UIImagePickerController *)photoLibraryPickerAllowsEditing:(BOOL)isAllowEditing;
+ (UIImagePickerController *)photoAlbumPicker;
+ (UIImagePickerController *)photoAlbumPickerAllowsEditing:(BOOL)isAllowEditing;


@end
