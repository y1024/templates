//
//  UIColor+Util.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)tp_hexString:(NSString *)hexString {
    unsigned int redColor = 0;
    unsigned int greenColor = 0;
    unsigned int blueColor = 0;
    UIColor *resultColor = nil;
    NSInteger index = 0;
    if ([hexString hasPrefix:@"#"]) {
        index = 1;
    } else {
        index = 0;
    }
    [[NSScanner
      scannerWithString:[hexString
                         substringWithRange:NSMakeRange(0 + index, 2)]]
     scanHexInt:&redColor];
    
    [[NSScanner
      scannerWithString:[hexString
                         substringWithRange:NSMakeRange(index + 2, 2)]]
     scanHexInt:&greenColor];
    
    [[NSScanner
      scannerWithString:[hexString
                         substringWithRange:NSMakeRange(index + 4, 2)]]
     scanHexInt:&blueColor];
    
    resultColor = [self tp_R:redColor G:greenColor B:blueColor];
    
    return resultColor;
    
    
}

+ (UIColor *)tp_R:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B {
    return [self tp_R:_R G:_G B:_B A:1];
}

+ (UIColor *)tp_R:(CGFloat)_R G:(CGFloat)_G B:(CGFloat)_B A:(CGFloat)_A {
    UIColor *RGBColor = nil;
    
    RGBColor = [UIColor colorWithRed:_R / 255.0f
                               green:_G / 255.0f
                                blue:_B / 255.0f
                               alpha:_A / 1.0f];
    
    return RGBColor;
}

+ (UIColor *)tp_hex:(NSInteger)hex {
    CGFloat R = (hex >> 16) & 0xFF;
    CGFloat G = (hex >> 8) & 0xFF;
    CGFloat B = (hex)&0xFF;
    return [self tp_R:R G:G B:B];
}

@end
