//
//  UIColor+Works.h
//  GYBaseKit
//
//  Created by zhugy781 on 2020/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Works)

@property (nonatomic,strong, readonly) NSString *gy_hexString;

/**
 构造color
 @param r 整数 0~255
 @param g 整数 0~255
 @param b 整数 0~255
 */
+ (UIColor *)gy_colorWithIntegerRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;

/**
 构造color

 @param r 整数 0~255
 @param g 整数 0~255
 @param b 整数 0~255
 @param alpha 0~1
 */
+ (UIColor *)gy_colorWithIntegerRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b alpha:(CGFloat)alpha;

/**
 根据16进制生成color

 @param string 16进制 支持#FFFFFFFF、#FFFFFF、#FFF、FFF
 */
+ (nullable UIColor *)gy_colorWithHexString:(NSString *)string;

/**
 根据16进制生成color

 @param string 16进制 支持#FFFFFF,#FFF,FFF
 @param alpha 0~1
 */
+ (nullable UIColor *)gy_colorWithHexString:(NSString *)string alpha:(CGFloat)alpha;

@end

/**
 几种常用颜色
 */
@interface UIColor (Extension)

@property (nonatomic, strong , class, readonly) UIColor *gy_salmon;
@property (nonatomic, strong , class, readonly) UIColor *gy_bloodOrange;
@property (nonatomic, strong , class, readonly) UIColor *gy_orangeYellow;
@property (nonatomic, strong , class, readonly) UIColor *gy_greyish;
@property (nonatomic, strong , class, readonly) UIColor *gy_warmGrey;
@property (nonatomic, strong , class, readonly) UIColor *gy_paleGrey;
@property (nonatomic, strong , class, readonly) UIColor *gy_fadedBlue;
@property (nonatomic, strong , class, readonly) UIColor *gy_pinkishGrey;
@property (nonatomic, strong , class, readonly) UIColor *gy_purpleBrown;
@property (nonatomic, strong , class, readonly) UIColor *gy_carolinaBlue;
@property (nonatomic, strong , class, readonly) UIColor *gy_backgroundGrey;
@property (nonatomic, strong , class, readonly) UIColor *gy_barTintColor;
@property (nonatomic, strong , class, readonly) UIColor *gy_clayBrown;
@property (nonatomic, strong , class, readonly) UIColor *gy_dirtBrown;
@property (nonatomic, strong , class, readonly) UIColor *gy_shallowGrey;
@property (nonatomic, strong , class, readonly) UIColor *gy_black_alpha_40;
@property (nonatomic, strong , class, readonly) UIColor *gy_selectedCellColor;
@property (nonatomic, strong , class, readonly) UIColor *gy_mostlyWhite;
@property (nonatomic, strong , class, readonly) UIColor *gy_silver;
@property (nonatomic, strong , class, readonly) UIColor *gy_baseYellow;
@property (nonatomic, strong , class, readonly) UIColor *gy_blackColor;
@property (nonatomic, strong , class, readonly) UIColor *gy_titleRagularColor;

@end

NS_ASSUME_NONNULL_END
