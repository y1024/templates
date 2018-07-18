//
//  TPViewController.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "TPViewController.h"
#import "TPTheme.h"

@interface TPViewController ()

@property (nonatomic,strong) UIView *statusBarView;
@property (nonatomic,strong) UIView *navigationBarView;


@property (nonatomic,strong) UILabel *navigationTitle;

@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UIButton *backButton;

@property (nonatomic,strong) UIImageView *moreImageView;
@property (nonatomic,strong) UILabel *moreTitle;
@property (nonatomic,strong) UIButton *moreButton;

@end

@implementation TPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:NO]; // 使导航条有效
    [self.navigationController.navigationBar setHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self initTheme];
    
}

- (void)initTheme {
    UIView *statusBarView = self.statusBarView;
    UIView *navigationBarView = self.navigationBarView;
    UILabel *navigationTitle = self.navigationTitle;
    UIImageView *backImageView = self.backImageView;
    
    [self.view addSubview:statusBarView];
    [self.view addSubview:navigationBarView];
    
    CGFloat sw = [UIScreen tp_w];
    CGFloat navigationBarH = [TPTheme navigationBarH];
    CGFloat statusBarViewH = [TPTheme statusBarViewH];
    statusBarView.frame = CGRectMake(0, 0,sw,statusBarViewH);
    navigationBarView.frame = CGRectMake(0,
                                              statusBarView.frame.origin.y + statusBarViewH,
                                              sw,
                                              navigationBarH);
    [navigationBarView addSubview:navigationTitle];
    CGFloat mr_title_x = 60.0f;
    navigationTitle.frame = CGRectMake(mr_title_x,
                                            0,
                                            sw - mr_title_x*2
                                            ,CGRectGetHeight(navigationBarView.frame)
                                            );
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 1) {
        [navigationBarView addSubview:backImageView];
        CGFloat backImageViewW = 9;
        CGFloat backImageViewH = 17;
        backImageView.frame = CGRectMake(16, ((CGRectGetHeight(navigationBarView.frame) - backImageViewH))/2,backImageViewW, backImageViewH);
        [navigationBarView addSubview:self.backButton];
        self.backButton.frame = CGRectMake(0, 0, 44, (CGRectGetHeight(self.navigationBarView.frame)));
        [self.backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    [navigationBarView addSubview:self.moreButton];
    self.moreButton.frame = CGRectMake(sw - 44, 0, 44, CGRectGetHeight(self.navigationBarView.frame));
    self.moreButton.hidden = true;
    CGFloat moreImageViewW = 16;
    CGFloat moreImageViewH = 3;
    [self.navigationBarView addSubview:self.moreImageView];
    self.moreImageView.frame = CGRectMake(sw - 15 - moreImageViewW , (CGRectGetHeight(self.navigationBarView.frame) - moreImageViewH)/2.0f, moreImageViewW, moreImageViewH);
    self.moreImageView.hidden = true;
    
    [navigationBarView addSubview:self.moreTitle];
    self.moreTitle.hidden = true;
    self.moreTitle.frame = CGRectMake(
                                      sw - 100 - 15,
                                      0,
                                      100,
                                      CGRectGetHeight(navigationBarView.frame)
                                      );
    
}

- (void)backButtonClick {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)moreButtonClick {
    
}

#pragma mark lazy laod

- (UIView*)statusBarView {
    if (!_statusBarView) {
        _statusBarView = [UIView new];
        _statusBarView.backgroundColor = [TPTheme statusBarColor];
    }
    return _statusBarView;
}

- (UIView*)navigationBarView {
    if (!_navigationBarView) {
        _navigationBarView = [UIView new];
        _navigationBarView.backgroundColor = [TPTheme navigationBarColor];
    }
    return _navigationBarView;
}

- (UILabel*)navigationTitle {
    if (!_navigationTitle) {
        _navigationTitle = [[UILabel alloc]init];
        _navigationTitle.font = [TPTheme navigationTitleFont];
        _navigationTitle.textColor = [TPTheme navigationTitleColor];
        _navigationTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _navigationTitle;
}

- (UIImageView*)backImageView {
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]initWithImage:[TPTheme backImage]];
    }
    return _backImageView;
}

- (UIButton*)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _backButton;
}

- (UIButton*)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton addTarget:self action:@selector(moreButtonClick)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (UILabel*)moreTitle {
    if (!_moreTitle) {
        _moreTitle = [[UILabel alloc]initWithFrame:CGRectZero];
        _moreTitle.font = [UIFont systemFontOfSize:15];
        _moreTitle.textAlignment = NSTextAlignmentRight;
    }
    return _moreTitle;
}

- (UIImageView*)moreImageView {
    if (!_moreImageView) {
        _moreImageView = [[UIImageView alloc]init];
    }
    return _moreImageView;
}


@end
