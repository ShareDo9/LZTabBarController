//
//  LZBaseTabBarController.m
//
//  Created by Ray on 2018/5/3.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBarController.h"
#import "LZTabBarItem.h"
#import "LZTabBar.h"

@interface LZTabBarController ()

@property (nonatomic, assign) BOOL ignoreNextSelection;

@end

@implementation LZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _showTabBarBackground = YES;
    
    [self setTabBarInitHeight];
    
    [self customTabBar];    
}

- (void)viewWillLayoutSubviews {
    if (self.tabBarHeight <= 0.0) return;
    
    self.tabBar.frame = ({
        CGRect frame = self.tabBar.frame;
        frame.size.height = self.tabBarHeight;
        frame.origin.y = self.view.bounds.size.height - frame.size.height;
        frame;
    });
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController {

    if (self.ignoreNextSelection) {
        self.ignoreNextSelection = NO;
    }else {
        
        NSInteger index = [self.viewControllers indexOfObject:selectedViewController];
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        if ([tabbar isKindOfClass:[LZTabBar class]]) {
            [tabbar selectIndex:index];
        }
    }
    
    [super setSelectedViewController:selectedViewController];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (self.ignoreNextSelection) {
        self.ignoreNextSelection = NO;
    }else {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar selectIndex:selectedIndex];
    }
    [super setSelectedIndex:selectedIndex];
}

- (void)setTabBarHeight:(CGFloat)tabBarHeight {
    if (_tabBarHeight != tabBarHeight) {
        _tabBarHeight = tabBarHeight;
        [self.tabBar setNeedsLayout];
        
        self.tabBar.frame = ({
            CGRect frame = self.tabBar.frame;
            frame.size.height = self.tabBarHeight;
            frame.origin.y = self.view.bounds.size.height - frame.size.height;
            frame;
        });
        
        if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
            LZTabBar *tabbar = (LZTabBar *)self.tabBar;
            [tabbar setValue:@(!_showTabBarBackground) forKey:@"hiddenImageView"];
        }
        
    }
    
}

- (void)setShowTabBarBackground:(BOOL)showTabBarBackground {
    _showTabBarBackground = showTabBarBackground;
    
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:@(!showTabBarBackground) forKey:@"hiddenImageView"];
    }
    
}

- (void)setIsCustom:(BOOL)isCustom {
    _isCustom = isCustom;
    
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:@(isCustom) forKey:@"isCustom"];
    }
    
}

- (void)setIsShowLine:(BOOL)isShowLine {
    _isShowLine = isShowLine;
    
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:@(isShowLine) forKey:@"isShowLine"];
    }
}

- (void)setBackgroundImgColor:(UIColor *)backgroundImgColor {
    _backgroundImgColor = backgroundImgColor;
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:backgroundImgColor forKey:@"backgroundImgColor"];
    }
}

- (void)setTabBarBackgroundImg:(UIImage *)tabBarBackgroundImg {
    _tabBarBackgroundImg = tabBarBackgroundImg;
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:tabBarBackgroundImg forKey:@"backgroundImg"];
    }
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    _normalTitleColor = normalTitleColor;
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:normalTitleColor forKey:@"normalTitleColor"];
    }
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    _selectedTitleColor = selectedTitleColor;
    if ([self.tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)self.tabBar;
        [tabbar setValue:selectedTitleColor forKey:@"selectedTitleColor"];
    }
}

- (void)setTabBarInitHeight {
    self.tabBarHeight = 49.0;
}

- (void)customTabBar {
    LZTabBar *tabbar = [[LZTabBar alloc] init];
    tabbar.delegate = self;
    tabbar.tabbarCtrl = self;
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    self.ignoreNextSelection = YES;
    NSInteger index = [tabBar.items indexOfObject:item];
    self.selectedIndex = index;
    [self.delegate tabBarController:self didSelectViewController:self.viewControllers[index]];
}

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    if ([tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)tabBar;
        [tabbar updateLayout];
    }
}

- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed {
    if ([tabBar isKindOfClass:[LZTabBar class]]) {
        LZTabBar *tabbar = (LZTabBar *)tabBar;
        [tabbar updateLayout];
    }
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

@end
