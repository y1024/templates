//
//  UIDevice+Util.h
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Util)

+ (BOOL)tp_IPhone;

+ (float)tp_systemVersion;

+ (BOOL)tp_IOS10;

+ (BOOL)tp_IOS9;

+ (BOOL)tp_IOS8;

+ (BOOL)tp_IOS7;

+ (BOOL)tp_IOS6;

+ (NSString *)tp_UUID;


@end
