//
//  LZTabBarItemContainer.m
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBarItemContainer.h"
#import "LZTabBarItemContentView.h"

@implementation LZTabBarItemContainer

- (instancetype)initWithTag:(NSInteger)tag {
    self = [super init];
    if (self) {
        self.tag = tag;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[LZTabBarItemContentView class]]) {
            LZTabBarItemContentView *contentView = obj;
            obj.frame = self.bounds;
            [contentView updateLayout];
        }
    }];
}

@end
