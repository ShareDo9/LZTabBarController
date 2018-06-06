//
//  LZTabBar.m
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBar.h"
#import "LZTabBarController.h"
#import "LZTabBarItemContainer.h"
#import "LZTabBarItem.h"
#import "LZTabBarHeader.h"

@interface LZTabBar()

@property (nonatomic, strong) NSMutableArray<LZTabBarItemContainer *> *containers;
@property (nonatomic, strong) UIView *lineView;

/// x底部背景图
@property (nonatomic, strong) UIImageView *bgBtmImageview;

/// 背景图片
@property (nonatomic, strong) UIImage *backgroundImg;

/// 背景颜色
@property (nonatomic, strong) UIColor *backgroundImgColor;

/// 是否隐藏背景
@property (nonatomic, assign, getter=isHiddenImageView) BOOL hiddenImageView;

/// 是否自定义tabbar
@property (nonatomic, assign) BOOL isCustom;

/// 是否显示线
@property (nonatomic, assign) BOOL isShowLine;

/// tabbar未选中文字颜色
@property (nonatomic, strong) UIColor *normalTitleColor;

/// tabbar选中文字颜色
@property (nonatomic, strong) UIColor *selectedTitleColor;

@end

@implementation LZTabBar

- (instancetype)init {
    if (self = [super init]) {
        _backgroundImgColor = [UIColor whiteColor];
        self.hiddenImageView = NO;
        self.isCustom = NO;
        self.isShowLine = YES;
    }
    return self;
}

- (NSMutableArray<LZTabBarItemContainer *> *)containers {
    if (!_containers) {
        _containers = [NSMutableArray<LZTabBarItemContainer *> array];
    }
    return _containers;
}

- (void)setHiddenImageView:(BOOL)hiddenImageView {
    _hiddenImageView = hiddenImageView;

        
    if (hiddenImageView) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setBackgroundImage:[UIImage new]];
        [self setShadowImage:[UIImage new]];
        
    }else {
        
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[self drawBackgroundImage]];
        if (!self.lineView) {
            [self addSubview:[self drawLine]];
        }
    }
}

- (void)setBackgroundImg:(UIImage *)backgroundImg {
    _backgroundImg = backgroundImg;

    if (backgroundImg) {
        self.hiddenImageView = NO;
    }
}

- (void)setBackgroundImgColor:(UIColor *)backgroundImgColor {
    _backgroundImgColor = backgroundImgColor;
    
    [self setHiddenImageView:self.hiddenImageView];
}

- (void)setIsShowLine:(BOOL)isShowLine {
    _isShowLine = isShowLine;
    self.lineView.hidden = !isShowLine;
}

- (void)setIsCustom:(BOOL)isCustom {
    
    if (_isCustom != isCustom) {
        [self reload];
    }
    
    self.isShowLine = !isCustom;
    self.hiddenImageView = isCustom;
    
    _isCustom = isCustom;
}

- (void)setBgBtmImage:(UIImage *)bgBtmImage {
    if (bgBtmImage) {
        if (!self.bgBtmImageview) {
            self.bgBtmImageview = [[UIImageView alloc]init];
            [self addSubview:self.bgBtmImageview];
        }
        self.bgBtmImageview.image = bgBtmImage;
    }else {
        if (self.bgBtmImageview) {
            [self.bgBtmImageview removeFromSuperview];
            self.bgBtmImageview = nil;
        }
    }
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    _normalTitleColor = normalTitleColor;
    [self reload];
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    _selectedTitleColor = selectedTitleColor;
    [self reload];
}

- (void)setItems:(NSArray<UITabBarItem *> *)items {
    [super setItems:items];
    [self reload];
    self.tabbarCtrl.selectedIndex = 0;
}

- (void)setItems:(NSArray<UITabBarItem *> *)items animated:(BOOL)animated {
    [super setItems:items animated:animated];
    [self reload];
    
    /// 当使用addChildViewController:添加控制器时，在调用setSelectedIndex:方法时item还没有添加到数组中（self.items == nil），需要在item赋值完成时手动调用一次selectedIndex
    self.tabbarCtrl.selectedIndex = 0;
}

- (void)selectAction:(LZTabBarItemContainer *)container {
    NSInteger index = MAX(0, container.tag - 1000);
    [self selectIndex:index];
}

- (void)selectIndex:(NSInteger)index {
    NSInteger newIndex = index;
    NSInteger currentIndex = self.selectedItem == nil? -1:[self.items indexOfObject:self.selectedItem];
    
    if (newIndex != currentIndex) {
        
        if (currentIndex != -1 &&
            currentIndex < self.items.count) {
            LZTabBarItem *currentItem = (LZTabBarItem *)self.items[currentIndex];
            if ([currentItem isKindOfClass:[LZTabBarItem class]]) {
                [currentItem.contentView deselectItem];
            }
        }
        
        if (newIndex != -1 &&
            newIndex < self.items.count) {
            LZTabBarItem *newItem = (LZTabBarItem *)self.items[newIndex];
            if ([newItem isKindOfClass:[LZTabBarItem class]]) {
                [newItem.contentView selectItem];
                [self.delegate tabBar:self didSelectItem:newItem];
            }
        }
    }
}

- (void)reload {
    [self removeAll];
    __weak typeof(self) weakSelf = self;
    [self.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[LZTabBarItem class]]) {
            LZTabBarItem *item = (LZTabBarItem *)obj;
            item.contentView.bageColor = RGB(0xff655d);
            item.contentView.isCustom = weakSelf.isCustom;
            item.contentView.normalTitleColor = weakSelf.normalTitleColor;
            item.contentView.selectTitleColor = weakSelf.selectedTitleColor;
            item.showBage = NO;
            LZTabBarItemContainer *container = [[LZTabBarItemContainer alloc] initWithTag:(1000+idx)];
            [container addTarget:weakSelf action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
            [weakSelf addSubview:container];
            [container addSubview:item.contentView];
            [weakSelf.containers addObject:container];
        }
    }];
    
    if (self.isShowLine) {
        [self bringSubviewToFront:self.lineView];
    }
    
    [self setNeedsLayout];
}

- (void)removeAll {
    [self.containers enumerateObjectsUsingBlock:^(LZTabBarItemContainer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.containers removeAllObjects];
}

- (void)updateLayout {
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            obj.hidden = YES;
        }
    }];
    
    CGFloat x = 0;
    CGFloat y = 0.5;
    CGFloat w = self.itemWidth == 0.0 ? self.bounds.size.width / self.containers.count : self.itemWidth;
    CGFloat h = self.bounds.size.height - kBottomOffsetValue;
    for (LZTabBarItemContainer *container in self.containers) {
        container.frame = CGRectMake(x, y, w, h);
        x += w;
    }
    
    if (_bgBtmImageview) {
        _bgBtmImageview.frame = CGRectMake(0, h, self.bounds.size.width, kBottomOffsetValue);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateLayout];
}

/// 解决高度改变tabbar跳动以及push动画问题
- (CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [super sizeThatFits:size];
    CGFloat height = self.tabbarCtrl.tabBarHeight;
    if (height > 0) {
        sizeThatFits.height = self.tabbarCtrl.tabBarHeight;
    }
    return sizeThatFits;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isPoint = [super pointInside:point withEvent:event];
    
    if (!isPoint) {
        for (LZTabBarItemContainer *container in self.containers) {
            if ([container pointInside:CGPointMake(point.x - container.frame.origin.x, point.y - container.frame.origin.y) withEvent:event]) {
                isPoint = YES;
            }
        }
    }
    return isPoint;
}

- (UIImage *)drawBackgroundImage {
    
    CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight    = [UIScreen mainScreen].bounds.size.height;
    
    // 为了防止tabbar往下移动，分割线会显示出来，这里给出足够的空间
    CGFloat offset = 100;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(screenWidth, screenHeight + offset), FALSE, 0);
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight + offset)];
    
    CGFloat pxOffset = kBottomOffsetValue;
    CGFloat tabBarHeight = self.bounds.size.height - pxOffset;
    
    UIImageView * imgBg = [[UIImageView alloc] init];
    imgBg.frame = CGRectMake(0,
                             screenHeight + offset - tabBarHeight - pxOffset,
                             screenWidth,
                             tabBarHeight + pxOffset);
    if (_backgroundImg == nil) {
        imgBg.backgroundColor = self.backgroundImgColor;
    }else {
        imgBg.image = _backgroundImg;
        imgBg.backgroundColor = [UIColor clearColor];
    }
    [view addSubview:imgBg];
    
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    
    view.layer.contents = nil;
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIView *)drawLine {
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0.0,
                                                            0.0,
                                                            [UIScreen mainScreen].bounds.size.width,
                                                            1.0/[UIScreen mainScreen].scale)];
    line.backgroundColor = RGB(0xdddddd);
    self.lineView = line;
    
    return line;
}

@end
