//
//  UIScreen+TPInch.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "UIScreen+TPInch.h"
#import "UIScreen+TPFrame.h"

@implementation UIScreen (TPInch)

+ (BOOL)tp_IPhone4SInch {
    return ([self tp_h] == 480.0f) && ([self tp_w] == 320.0f);
}

+ (BOOL)tp_IPhone5SInch {
    return ([self tp_h] == 568.0f) && ([self tp_w] == 320.0f);
}

+ (BOOL)tp_IPhone6Inch {
    return ([self tp_h] == 667.0f) && ([self tp_w] == 375.0f);
}

+ (BOOL)tp_IPhone6PInch {
    return ([self tp_h] == 736.0f) && ([self tp_w] == 414.0f);
}

+ (BOOL)tp_IPhoneXInch {
    return ([self tp_h] == 812.0f) && ([self tp_w] == 375.0f);
}

+ (BOOL)tp_32OWidth {
    if ([self tp_w] == 320.0f) {
        return YES;
    }else{
        return NO;
    }
}

@end
