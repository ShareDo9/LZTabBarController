//
//  LZTabBarItemContentView.m
//
//  Created by Ray on 2018/4/25.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "LZTabBarItemContentView.h"
#import "LZTabBarItemPageView.h"
#import "LZTabBarHeader.h"

@interface LZTabBarItemContentView()

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong) UILabel *titlelb;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) LZTabBarItemPageView *pageView;
@end

@implementation LZTabBarItemContentView

- (void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
        [self updateDisplay];
    }
    
}

- (void)setBageColor:(UIColor *)bageColor {
    self.pageView.bageColor = bageColor;
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    if (normalTitleColor) {
        _normalTitleColor = normalTitleColor;
        [self updateDisplay];
    }
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor {
    if (selectTitleColor) {
        _selectTitleColor = selectTitleColor;
        [self updateDisplay];
    }
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self updateDisplay];
}

- (void)setSelectImage:(UIImage *)selectImage {
    _selectImage = selectImage;
    [self updateDisplay];
}

- (void)setBageHidden:(BOOL)bageHidden {
    _bageHidden = bageHidden;
   self.pageView.hidden = bageHidden;
}

- (void)setIsCustom:(BOOL)isCustom {
    
    if (_isCustom != isCustom) {
        [self setNeedsLayout];
    }
    
    _isCustom = isCustom;

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _normalTitleColor = [UIColor colorWithRed:167.0/255.0 green:167.0/255.0 blue:167.0/255.0 alpha:1.0];
        _selectTitleColor = [UIColor whiteColor];
        self.selected = NO;
        
        [self createSubView];
    }
    return self;
}

- (void)createSubView {
    
    self.titlelb = [[UILabel alloc] init];
    self.titlelb.textColor = _normalTitleColor;
    self.titlelb.textAlignment = NSTextAlignmentCenter;
    self.titlelb.font = [UIFont systemFontOfSize:10.0];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.pageView = [[LZTabBarItemPageView alloc] init];
    
    [self addSubview:self.imageView];
    [self addSubview:self.titlelb];
    [self addSubview:self.pageView];
}

- (void)updateDisplay {
    self.imageView.image = _selected ? (_selectImage ? _selectImage : _image) : _image;
    self.titlelb.text = _title;
    self.titlelb.textColor = _selected ? _selectTitleColor : _normalTitleColor;
}

- (void)updateLayout {
    
    CGFloat viewW = self.bounds.size.width;
    CGFloat viewH = self.bounds.size.height;
    
    _titlelb.hidden = (_titlelb.text.length == 0 && (!_titlelb.text));
    _imageView.hidden = _imageView.image == nil;
    
    CGFloat titlelbHieght = 15.0;
    
    CGSize imageSize    = [_imageView sizeThatFits:CGSizeMake(viewW, MAXFLOAT)];
    imageSize.height    = viewW * imageSize.height / imageSize.width;
    imageSize.width     = viewW;
    
    if (!(_titlelb.hidden || _imageView.hidden)) {
        
        
        self.titlelb.frame = CGRectMake(0.0,
                                        viewH - titlelbHieght,
                                        viewW,
                                        titlelbHieght);
        
        
        if (_isCustom) {
            
            self.imageView.frame = CGRectMake(0.0,
                                              viewH - imageSize.height,
                                              imageSize.width,
                                              imageSize.height);
            
            
        }else {
            
            [_imageView sizeToFit];
            
            self.imageView.center = CGPointMake(viewW/2.0, (viewH-titlelbHieght)/2.0);
        }

    }else if (!_titlelb.hidden) {
        
        self.titlelb.frame = CGRectMake(0.0,
                                        viewH - titlelbHieght,
                                        viewW,
                                        titlelbHieght);
        
    }else if (!_imageView.hidden) {
        
        if (_isCustom) {

            self.imageView.frame = CGRectMake(0.0,
                                              viewH - imageSize.height,
                                              imageSize.width,
                                              imageSize.height);
            
        }else {
            
            [_imageView sizeToFit];
            self.imageView.center = CGPointMake(viewW/2.0, viewH/2.0);
            
        }
        
        if (_isCustom) {
            self.clipsToBounds = NO;
        }else {
            self.clipsToBounds = YES;
        }
        
    }
    
    CGSize size = [_pageView sizeThatFits:CGSizeZero];
    
    if (_isCustom) {
        _pageView.frame = CGRectMake(viewW / 2.0 + kRPRealValue(25.0), kRPRealValue(20.0), size.width, size.height);
    }else {
        _pageView.frame = CGRectMake(viewW / 2.0 + kRPRealValue(15.0), kRPRealValue(10.0), size.width, size.height);
    }
}

- (void)selectItem {
    self.selected = YES;
    [self updateDisplay];
}

- (void)deselectItem {
    self.selected = NO;
    [self updateDisplay];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return NO;
}

@end
