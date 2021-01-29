//
//  GYUIAssistant.m
//  GYBaseKit
//
//  Created by zhugy781 on 2020/12/25.
//

#import "GYUIAssistant.h"

CGFloat gy_screen_scale(void) {
    CGFloat scale = ([UIScreen instancesRespondToSelector:@selector(scale)] ? [UIScreen.mainScreen scale] : (1.0f));
    return scale;
}


CGFloat gy_screen_width(void) {
    CGFloat width = ([UIScreen.mainScreen bounds].size.width);
    return width;
}


CGFloat gy_screen_height(void) {
    CGFloat height = ([UIScreen.mainScreen bounds].size.height);
    return height;
}


CGFloat gy_screen_width_in_portrait(void) {
    return MIN(gy_screen_width(), gy_screen_height());
}


CGFloat gy_screen_height_in_portrait(void) {
    return MAX(gy_screen_width(), gy_screen_height());
}


CGFloat gy_screen_width_in_landscape(void) {
    return MAX(gy_screen_width(), gy_screen_height());
}


CGFloat gy_screen_height_in_landscape(void) {
    return MIN(gy_screen_width(), gy_screen_height());
}


CGFloat gy_screen_center_x(void) {
    CGFloat centerX = gy_screen_width() * 0.5f;
    return centerX;
}


CGFloat gy_pixel(void) {
    static CGFloat pixel = 1.0f;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pixel = 1.0f / gy_screen_scale();
    });
    return pixel;
}


CGFloat gy_status_bar_height(void) {
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}


CGFloat gy_navigation_bar_height(void) {
    return 44.0f;
}


CGFloat gy_status_bar_and_navigation_bar_height(void) {
    return gy_status_bar_height() + gy_navigation_bar_height();
}


UIEdgeInsets gy_safe_area_insets(void) {
    if ([UIView instancesRespondToSelector:@selector(safeAreaInsets)]) {
        if (@available(iOS 11.0, *)) {
            return UIApplication.sharedApplication.delegate.window.safeAreaInsets;
        }
    }
    return UIEdgeInsetsZero;
}


CGFloat gy_safe_area_insets_top(void) {
    return gy_safe_area_insets().top;
}


CGFloat gy_safe_area_insets_left(void) {
    return gy_safe_area_insets().left;
}


CGFloat gy_safe_area_insets_bottom(void) {
    return gy_safe_area_insets().bottom;
}


CGFloat gy_safe_area_insets_right(void) {
    return gy_safe_area_insets().right;
}


UIEdgeInsets gy_screen_padding_insets(void) {
    if ([UIView instancesRespondToSelector:@selector(safeAreaInsets)]) {
        if (@available(iOS 11.0, *)) {
            UIEdgeInsets insets = UIApplication.sharedApplication.delegate.window.safeAreaInsets;
            if (insets.top <= 40.0f) {
                insets.top = 0.0f;
            }
            return insets;
        }
    }
    return UIEdgeInsetsZero;
}


CGFloat gy_screen_adaptive_float(CGFloat floatValue) {
    return gy_screen_adaptive_float_with_padding(floatValue, 0.0f);
}


CGFloat gy_screen_adaptive_float_with_padding(CGFloat floatValue, CGFloat padding) {
    CGFloat currentScreenWidth = MIN(gy_screen_width(), gy_screen_height()) - padding;
    CGFloat standardScreenWidth = 375.0f - padding;
    return floorf(floatValue / standardScreenWidth * currentScreenWidth);
}


CGPoint gy_screen_adaptive_point(CGPoint pointValue) {
    return CGPointMake(gy_screen_adaptive_float(pointValue.x), gy_screen_adaptive_float(pointValue.y));
}


CGSize gy_screen_adaptive_size(CGSize sizeValue) {
    return CGSizeMake(gy_screen_adaptive_float(sizeValue.width), gy_screen_adaptive_float(sizeValue.height));
}


CGRect gy_screen_adaptive_rect(CGRect rectValue) {
    return CGRectMake(gy_screen_adaptive_float(rectValue.origin.x), gy_screen_adaptive_float(rectValue.origin.y), gy_screen_adaptive_float(rectValue.size.width), gy_screen_adaptive_float(rectValue.size.height));
}


CGFloat gy_screen_vertical_adaptive_float_with_padding(CGFloat floatValue, CGFloat padding) {
    CGFloat currentScreenHeight = MAX(gy_screen_width(), gy_screen_height()) - padding;
    CGFloat standardScreenHeight = 667.0f - padding;
    return floorf(floatValue / standardScreenHeight * currentScreenHeight);
}

