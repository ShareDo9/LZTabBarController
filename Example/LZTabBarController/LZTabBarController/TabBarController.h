//
//  LZTabBarController.h
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBarController.h"

@interface TabBarController : LZTabBarController

- (void)loadSubViewController:(NSUInteger)index;

- (void)showTabBarBackgroudView:(BOOL)isShow;

- (void)showPageView;

@end
