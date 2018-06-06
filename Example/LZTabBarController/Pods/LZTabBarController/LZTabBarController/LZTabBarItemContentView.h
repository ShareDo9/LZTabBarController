//
//  LZTabBarItemContentView.h
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTabBarItemContentView : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor *normalTitleColor;
@property (nonatomic, strong) UIColor *selectTitleColor;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, strong) UIColor *bageColor;
@property (nonatomic, assign) BOOL bageHidden;
@property (nonatomic, assign) BOOL isCustom;

- (void)selectItem;

- (void)deselectItem;

- (void)updateLayout;

@end


