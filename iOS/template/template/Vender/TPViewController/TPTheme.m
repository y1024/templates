//
//  TPTheme.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "TPTheme.h"
#import "UIColor+Util.h"
@implementation TPTheme

+ (CGFloat)tabbarH {
    return 49.0f;
}
+ (CGFloat)navigationBarH {
    return 44.0f;
}

+ (CGFloat)statusBarViewH {
    if ([UIScreen tp_IPhoneXInch]) {
        return 44.0f;
    }
    else {
        return 20.0f;
    }
}

+ (UIColor*)statusBarColor {
    return [UIColor tp_hexString:@"4595F1"];
}
+ (UIColor*)navigationBarColor {
    return [UIColor tp_hexString:@"4595F1"];
}

+ (UIColor*)navigationTitleColor {
    return [UIColor whiteColor];
}
+ (UIFont*)navigationTitleFont {
    return [UIFont systemFontOfSize:17];
}

+ (UIImage*)backImage {
    return [UIImage imageNamed:@"icon_all_back"];
}



@end
