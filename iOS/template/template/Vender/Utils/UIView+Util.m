//
//  UIView+Util.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

- (void)cornerRadius:(CGFloat)corner {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = corner;
}

@end
