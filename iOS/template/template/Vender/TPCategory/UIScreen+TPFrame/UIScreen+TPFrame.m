//
//  UIScreen+TPFrame.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "UIScreen+TPFrame.h"

@implementation UIScreen (TPFrame)

+ (CGRect)tp_bounds {
    return [UIScreen mainScreen].bounds;
}

+ (CGFloat)tp_w {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)tp_h {
    return [UIScreen mainScreen].bounds.size.height;
}

@end
