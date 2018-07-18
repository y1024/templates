//
//  NSBundle+Util.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "NSBundle+Util.h"

@implementation NSBundle (Util)

+ (NSDictionary*)tp_bundleInfo {
    return [NSBundle mainBundle].infoDictionary;
}

+ (NSString*)tp_APPName {
    NSDictionary *appInfoDictionary = [self tp_bundleInfo];
    
    return appInfoDictionary[@"CFBundleDisplayName"];
}

+ (NSString*)tp_APPVersion {
    NSDictionary *appInfoDictionary = [self tp_bundleInfo];
    
    return appInfoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString*)tp_APPBuildVersion {
    NSDictionary *appInfoDictionary = [self tp_bundleInfo];
    return appInfoDictionary[@"CFBundleVersion"];
}


@end
