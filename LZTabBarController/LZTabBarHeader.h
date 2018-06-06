//
//  LZTabBarHeader.h
//  LZTabBarController
//
//  Created by Ray on 2018/6/4.
//  Copyright © 2018年 Ray. All rights reserved.
//

#ifndef LZTabBarHeader_h
#define LZTabBarHeader_h

#define DEPRECATED(explain) __attribute__((deprecated(explain)))
#define IS_IPHONE   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_IOS_11   ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.f)
#define IS_IPHONE_X (IS_IOS_11 && IS_IPHONE && (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) == 375 && MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) == 812))

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

// 尺寸的比例，由于设计图是根据iPhone6P的尺寸来的，其他的机型需要按一定的比例进行缩放
#define IPHONE_6P_SCREEN_SIZE_WIDTH 414.0f // iPhone6P屏幕的宽
#define RealWidth (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_WIDTH : SCREEN_HEIGHT) // 避免不同系统版本在横竖屏时宽度问题
#define kRPViewRatio (RealWidth/IPHONE_6P_SCREEN_SIZE_WIDTH)  // 缩放比例
#define kRPRealValue(value) (((value) / 3.0f) * kRPViewRatio) // 根据比例得到实际的尺寸

#define kBottomOffsetValue (IS_IPHONE_X ? (34) : 0)

//RGB颜色读取
#define RGBAlpha(hexValue,a) [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0f green:((float)(((hexValue) & 0xFF00) >> 8))/255.0f blue: ((float)((hexValue) & 0xFF))/255.0f alpha:(a)]
#define RGB(hexValue) RGBAlpha(hexValue, 1.0f)



#endif /* LZTabBarHeader_h */
