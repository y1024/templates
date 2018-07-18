/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)HUD
{
   MBProgressHUD *hud = objc_getAssociatedObject(self, HttpRequestHUDKey);
    
    return hud;
}

- (void)setHUD:(MBProgressHUD *)HUD
{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint
{
    if (self.HUD) {
        [[self HUD] hide:YES];
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    if ([hint isKindOfClass:[NSString class]]) {
        hud.labelText = hint;
    }
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [view bringSubviewToFront:hud];
    [hud show:YES];
    [self setHUD:hud];
}

- (void)showHint:(NSString *)hint duration:(CGFloat)duration
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    if ([hint isKindOfClass:[NSString class]]) {
        hud.detailsLabelText = hint;
    }
    hud.detailsLabelFont = [UIFont systemFontOfSize:15];
    hud.margin = 10.f;
    hud.minSize = CGSizeMake(130, 30);
    
    
    hud.layer.cornerRadius = 2;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:duration];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    if ([hint isKindOfClass:[NSString class]]) {
        hud.labelText = hint;
    }
    hud.margin = 10.f;
//    hud.yOffset = IS_IPHONE_5?200.f:150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:2];
}

- (void)hideHud
{
    [[self HUD] hide:YES];
}

- (void)showHudInView:(UIView *)view WithHint:(NSString *)hint
{
    if (self.HUD) {
        [[self HUD] hide:YES];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    if ([hint isKindOfClass:[NSString class]]) {
        hud.labelText = hint;
    }
    hud.margin = 10.f;
    hud.minSize = CGSizeMake(130, 30);
    hud.layer.cornerRadius = 2;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

@end

@implementation UIView (HUD)

- (void)showHint:(NSString *)hint duration:(CGFloat)duration
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    if ([hint isKindOfClass:[NSString class]]) {
        hud.labelText = hint;
    }
    
    hud.margin = 10.f;
    hud.minSize = CGSizeMake(130, 30);
    [hud setColor:[UIColor whiteColor]];
    hud.layer.cornerRadius = 2;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

@end


