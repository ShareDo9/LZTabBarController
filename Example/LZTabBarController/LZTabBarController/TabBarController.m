//
//  LZTabBarController.m
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "TabBarController.h"
#import "LZTabBar.h"
#import "LZTabBarItem.h"
#import "LZTabBarHeader.h"
#import "ViewController.h"

@implementation TabBarController

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    
    LZTabBarItem *item = (LZTabBarItem *)self.tabBar.items[selectedIndex];
    item.showBage = NO;
}

- (void)loadSubViewController:(NSUInteger)index {
    
    switch (index) {
        case 0: {
            [self loadNormalSubViewController];
        }
            break;
        case 1: {
            [self loadNormalPageSubViewController];
        }
            break;
        case 2: {
            [self loadThemeSubViewController];
        }
            break;
            
        default:
            break;
    }
}

- (void)loadNormalSubViewController {
    
    ViewController *fVC = [[ViewController alloc] init];
    ViewController *sVC = [[ViewController alloc] init];
    ViewController *tVC = [[ViewController alloc] init];
    ViewController *uVC = [[ViewController alloc] init];
    ViewController *vVC = [[ViewController alloc] init];

    UINavigationController *fNavigation = [[UINavigationController alloc] initWithRootViewController:fVC];
    UINavigationController *sNavigation = [[UINavigationController alloc] initWithRootViewController:sVC];
    UINavigationController *tNavigation = [[UINavigationController alloc] initWithRootViewController:tVC];
    UINavigationController *uNavigation = [[UINavigationController alloc] initWithRootViewController:uVC];
    UINavigationController *vNavigation = [[UINavigationController alloc] initWithRootViewController:vVC];
    
    fNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"首页"
                                                           image:[UIImage imageNamed:@"home_normal"]
                                                     selectImage:[UIImage imageNamed:@"home_selected"]
                                                             tag:0];
    
    sNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"发现"
                                                           image:[UIImage imageNamed:@"radar_normal"]
                                                     selectImage:[UIImage imageNamed:@"radar_selected"]
                                                             tag:0];
    
    tNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"定制"
                                                           image:[UIImage imageNamed:@"bowling_ball_normal"]
                                                     selectImage:[UIImage imageNamed:@"bowling_ball_selected"]
                                                             tag:0];

    uNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"私有"
                                                           image:[UIImage imageNamed:@"clover_normal"]
                                                     selectImage:[UIImage imageNamed:@"clover_selected"]
                                                             tag:0];
    
    vNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"我的足球"
                                                           image:[UIImage imageNamed:@"billiards_ball_normal"]
                                                     selectImage:[UIImage imageNamed:@"billiards_ball_selected"]
                                                             tag:0];
    
    self.viewControllers = @[fNavigation, sNavigation, tNavigation, uNavigation, vNavigation];
    
}

- (void)loadNormalPageSubViewController {
    
    ViewController *fVC = [[ViewController alloc] init];
    ViewController *sVC = [[ViewController alloc] init];
    ViewController *tVC = [[ViewController alloc] init];
    ViewController *uVC = [[ViewController alloc] init];
    ViewController *vVC = [[ViewController alloc] init];
    
    UINavigationController *fNavigation = [[UINavigationController alloc] initWithRootViewController:fVC];
    UINavigationController *sNavigation = [[UINavigationController alloc] initWithRootViewController:sVC];
    UINavigationController *tNavigation = [[UINavigationController alloc] initWithRootViewController:tVC];
    UINavigationController *uNavigation = [[UINavigationController alloc] initWithRootViewController:uVC];
    UINavigationController *vNavigation = [[UINavigationController alloc] initWithRootViewController:vVC];
    
    fNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"首页"
                                                           image:[UIImage imageNamed:@"home_normal"]
                                                     selectImage:[UIImage imageNamed:@"home_selected"]
                                                             tag:0];
    
    sNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"发现"
                                                           image:[UIImage imageNamed:@"radar_normal"]
                                                     selectImage:[UIImage imageNamed:@"radar_selected"]
                                                             tag:0];
    
    tNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"定制"
                                                           image:[UIImage imageNamed:@"bowling_ball_normal"]
                                                     selectImage:[UIImage imageNamed:@"bowling_ball_selected"]
                                                             tag:0];
    
    uNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"私有"
                                                           image:[UIImage imageNamed:@"clover_normal"]
                                                     selectImage:[UIImage imageNamed:@"clover_selected"]
                                                             tag:0];
    
    vNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"我的足球"
                                                           image:[UIImage imageNamed:@"billiards_ball_normal"]
                                                     selectImage:[UIImage imageNamed:@"billiards_ball_selected"]
                                                             tag:0];
    
    self.viewControllers = @[fNavigation, sNavigation, tNavigation, uNavigation, vNavigation];
    
}

- (void)loadThemeSubViewController {
    
    ViewController *fVC = [[ViewController alloc] init];
    ViewController *sVC = [[ViewController alloc] init];
    ViewController *tVC = [[ViewController alloc] init];
    ViewController *uVC = [[ViewController alloc] init];
    
    UINavigationController *fNavigation = [[UINavigationController alloc] initWithRootViewController:fVC];
    UINavigationController *sNavigation = [[UINavigationController alloc] initWithRootViewController:sVC];
    UINavigationController *tNavigation = [[UINavigationController alloc] initWithRootViewController:tVC];
    UINavigationController *uNavigation = [[UINavigationController alloc] initWithRootViewController:uVC];
    
    fNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"朋友"
                                                           image:[UIImage imageNamed:@"icn_friend"]
                                                     selectImage:[UIImage imageNamed:@"icn_friend_prs"]
                                                             tag:0];
    
    sNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"发现"
                                                           image:[UIImage imageNamed:@"icn_discovery"]
                                                     selectImage:[UIImage imageNamed:@"icn_discovery_prs"]
                                                             tag:0];
    
    tNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"音乐"
                                                           image:[UIImage imageNamed:@"icn_music"]
                                                     selectImage:[UIImage imageNamed:@"icn_music_prs"]
                                                             tag:0];
    
    uNavigation.tabBarItem = [[LZTabBarItem alloc] initWithTitle:@"账户"
                                                           image:[UIImage imageNamed:@"icn_account"]
                                                     selectImage:[UIImage imageNamed:@"icn_account_prs"]
                                                             tag:0];
    
    self.viewControllers = @[fNavigation, sNavigation, tNavigation, uNavigation];
    
}

- (void)showTabBarBackgroudView:(BOOL)isShow {
    LZTabBar * tabbar = (LZTabBar *)self.tabBar;
    
    if (tabbar &&
        [tabbar isKindOfClass:[LZTabBar class]] &&
        IS_IPHONE_X) {
        
        if (!isShow) {
            tabbar.bgBtmImage = nil;
        }else {
            tabbar.bgBtmImage = [UIImage imageNamed:@"tabbar_bg_bottom_image"];
        }
    }
    
}

- (void)showPageView {
    for (LZTabBarItem *item in self.tabBar.items) {
        NSLog(@"item:%@", item);
        
        if (![item isKindOfClass:[LZTabBarItem class]]) {
            return;
        }
        
        item.showBage = YES;
    }
}

@end
