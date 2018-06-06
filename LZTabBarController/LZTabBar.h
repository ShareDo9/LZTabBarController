//
//  LZTabBar.h
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZTabBarController;

@interface LZTabBar : UITabBar

/// iphone x底部条背景图
@property (nonatomic, strong) UIImage *bgBtmImage;

@property (nonatomic, weak) LZTabBarController *tabbarCtrl;

- (void)selectIndex:(NSInteger)index;

- (void)updateLayout;

@end
