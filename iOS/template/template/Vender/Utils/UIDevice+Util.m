//
//  UIDevice+Util.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "UIDevice+Util.h"
#import <AdSupport/AdSupport.h>

@implementation UIDevice (Util)

+ (BOOL)tp_IPhone {
    return [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

+ (float)tp_systemVersion {
    return [[UIDevice currentDevice].systemVersion floatValue];
}

+ (BOOL)tp_IOS10 {
    return [self tp_systemVersion] >= 10.0 && [self tp_systemVersion] < 11.0;
}


+ (BOOL)tp_IOS9 {
    return [self tp_systemVersion] >= 9.0 && [self tp_systemVersion] < 10.0;
}


+ (BOOL)tp_IOS8 {
    return [self tp_systemVersion] >= 8.0 && [self tp_systemVersion] < 9.0;
}

+ (BOOL)tp_IOS7 {
    return [self tp_systemVersion] >= 7.0 && [self tp_systemVersion] < 8.0 ;
}

+ (BOOL)tp_IOS6 {
    return [self tp_systemVersion] >= 6.0 && [self tp_systemVersion] < 7.0;
}

+ (NSString *)tp_UUID {
    NSString *uuid = nil;
    NSString *advertisingId = [[[ASIdentifierManager sharedManager]
                                advertisingIdentifier]
                               UUIDString];
    if (advertisingId) {
        uuid = advertisingId;
    }
    else {
        uuid =  [self currentDevice].identifierForVendor.UUIDString;
    }
    return uuid;
}


@end
