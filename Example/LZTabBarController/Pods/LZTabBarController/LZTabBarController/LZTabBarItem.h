//
//  LZTabBarItem.h
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTabBarItemContentView.h"

@interface LZTabBarItem : UITabBarItem

@property (nonatomic, strong) LZTabBarItemContentView *contentView;

@property (nonatomic, assign, getter=isShowBage) BOOL showBage;

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                  selectImage:(UIImage *)selectImage
                          tag:(NSInteger)tag;
@end
