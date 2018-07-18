//
//  UIColor+Util.h
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)tp_hexString:(NSString *)hexString;

+ (UIColor *)tp_R:(CGFloat)_R
                G:(CGFloat)_G
                B:(CGFloat)_B;

+ (UIColor *)tp_R:(CGFloat)_R
                G:(CGFloat)_G
                B:(CGFloat)_B
                A:(CGFloat)_A;

+ (UIColor *)tp_hex:(NSInteger)hex;

@end
