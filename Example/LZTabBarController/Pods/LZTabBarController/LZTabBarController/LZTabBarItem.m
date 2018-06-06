//
//  LZTabBarItem.m
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBarItem.h"

@implementation LZTabBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentView = [[LZTabBarItemContentView alloc] init];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                  selectImage:(UIImage *)selectImage
                          tag:(NSInteger)tag {
    self = [self init];
    if (self) {
        [self setTitle:title image:image selectImage:selectImage tag:tag];
    }
    return self;
}

- (void)setShowBage:(BOOL)showBage {
    _showBage = showBage;
    self.contentView.bageHidden = !showBage;
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    [super setBadgeColor:badgeColor];
    self.contentView.bageColor = badgeColor;
}

- (void)setImage:(UIImage *)image {
    [super setImage:image];
    self.contentView.image = image;
}

- (void)setSelectedImage:(UIImage *)selectedImage {
    [super setSelectedImage:selectedImage];
    self.contentView.selectImage = selectedImage;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.contentView.title = title;
}

- (void)setTag:(NSInteger)tag {
    [super setTag:tag];
    self.contentView.tag = tag;
}

- (void)setTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage tag:(NSInteger)tag {
    self.title = title;
    
    if (image) {
        self.image = image;
    }
    
    if (selectImage) {
        self.selectedImage = selectImage;
    }
   
    self.tag = tag;
}

@end
