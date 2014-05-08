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
//  UIImagePickerController+TBTFastImagePick.m
//
//  Created by ISHII 2bit
//  Copyright (c) 2014 buffer Renaiss. All rights reserved.
//

#import "UIImagePickerController+TBTFastImagePick.h"

@implementation UIImagePickerController (TBTFastImagePick)

+ (UIImagePickerController *)imagePickerForType:(UIImagePickerControllerSourceType)sourceType {
    return [self imagePickerForType:sourceType
                      allowsEditing:NO];
}

+ (UIImagePickerController *)imagePickerForType:(UIImagePickerControllerSourceType)sourceType
                                  allowsEditing:(BOOL)isAllowEditing
{
    UIImagePickerController *imagePickerController = nil;
    if([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        imagePickerController = [[UIImagePickerController alloc] init];
        [imagePickerController setSourceType:sourceType];
        [imagePickerController setAllowsEditing:isAllowEditing];
    }
    return imagePickerController;
}

+ (UIImagePickerController *)stillPicker {
    return [self stillPickerAllowsEditing:NO];
}

+ (UIImagePickerController *)stillPickerAllowsEditing:(BOOL)isAllowEditing {
    return [self imagePickerForType:UIImagePickerControllerSourceTypeCamera
                      allowsEditing:isAllowEditing];
}

+ (UIImagePickerController *)photoLibraryPicker {
    return [self photoLibraryPickerAllowsEditing:NO];
}

+ (UIImagePickerController *)photoLibraryPickerAllowsEditing:(BOOL)isAllowEditing {
    return [self imagePickerForType:UIImagePickerControllerSourceTypePhotoLibrary
                      allowsEditing:isAllowEditing];
}

+ (UIImagePickerController *)photoAlbumPicker {
    return [self photoAlbumPickerAllowsEditing:NO];
}

+ (UIImagePickerController *)photoAlbumPickerAllowsEditing:(BOOL)isAllowEditing {
    return [self imagePickerForType:UIImagePickerControllerSourceTypeSavedPhotosAlbum
                      allowsEditing:isAllowEditing];
}

@end
