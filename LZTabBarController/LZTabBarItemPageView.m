//
//  LZTabBarItemPageView.m
//
//  Created by Ray on 2018/5/2.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBarItemPageView.h"

@interface LZTabBarItemPageView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LZTabBarItemPageView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.layer.masksToBounds = YES;
    [self addSubview:self.imageView];
}

- (void)setBageColor:(UIColor *)bageColor {
    _bageColor = bageColor;
    self.imageView.backgroundColor = bageColor;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake((self.bounds.size.width - 8.0)/2.0, (self.bounds.size.height - 8.0)/2.0, 8.0, 8.0);
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.height/2.0;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(18.0, 18.0);
}

@end
