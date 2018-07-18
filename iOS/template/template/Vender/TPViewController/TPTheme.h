//
//  TPTheme.h
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIScreen+TPInch.h"

@interface TPTheme : NSObject

+ (CGFloat)tabbarH;
+ (CGFloat)navigationBarH;

+ (CGFloat)statusBarViewH;

+ (UIColor*)statusBarColor;
+ (UIColor*)navigationBarColor;

+ (UIColor*)navigationTitleColor;
+ (UIFont*)navigationTitleFont;

+ (UIImage*)backImage;

@end
