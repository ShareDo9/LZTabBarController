//
//  LZBaseTabBarController.h
//
//  Created by Ray on 2018/5/3.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTabBarItem.h"
#import "LZTabBar.h"

@interface LZTabBarController : UITabBarController

@property (nonatomic, assign) CGFloat tabBarHeight;

/// 是否显示tabbar背景
@property (nonatomic, assign) BOOL showTabBarBackground;

/// 是否自定义tabbar，（自定义情况下不显示tabbar背景，默认情况下显示tabbar背景）
@property (nonatomic, assign) BOOL isCustom;

/// 是否显示线
@property (nonatomic, assign) BOOL isShowLine;

/// tabbar背景图片颜色（当默认情况下，颜色就是背景颜色）
@property (nonatomic, strong) UIColor *backgroundImgColor;

/// tabbar背景图片
@property (nonatomic, strong) UIImage *tabBarBackgroundImg;

/// tabbar未选中文字颜色
@property (nonatomic, strong) UIColor *normalTitleColor;

/// tabbar选中文字颜色
@property (nonatomic, strong) UIColor *selectedTitleColor;

@end
