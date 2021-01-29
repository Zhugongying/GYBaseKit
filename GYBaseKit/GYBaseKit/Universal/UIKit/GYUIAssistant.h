//
//  GYUIAssistant.h
//  GYBaseKit
//
//  Created by zhugy781 on 2020/12/25.
//

#import <Foundation/Foundation.h>
#import "UIColor+Works.h"
#import "UIImage+Works.h"
#import "UILabel+Works.h"

NS_ASSUME_NONNULL_BEGIN

extern CGFloat gy_screen_scale(void);

extern CGFloat gy_screen_width(void);

extern CGFloat gy_screen_height(void);

extern CGFloat gy_screen_width_in_portrait(void);

extern CGFloat gy_screen_height_in_portrait(void);

extern CGFloat gy_screen_width_in_landscape(void);

extern CGFloat gy_screen_height_in_landscape(void);

extern CGFloat gy_screen_center_x(void);

extern CGFloat gy_pixel(void);

extern CGFloat gy_status_bar_height(void);

extern CGFloat gy_navigation_bar_height(void);

extern CGFloat gy_status_bar_and_navigation_bar_height(void);

extern UIEdgeInsets gy_safe_area_insets(void);
extern CGFloat gy_safe_area_insets_top(void);
extern CGFloat gy_safe_area_insets_left(void);
extern CGFloat gy_safe_area_insets_bottom(void);
extern CGFloat gy_safe_area_insets_right(void);

extern UIEdgeInsets gy_screen_padding_insets(void);

extern CGFloat gy_screen_adaptive_float(CGFloat floatValue);

extern CGFloat gy_screen_adaptive_float_with_padding(CGFloat floatValue, CGFloat padding);

extern CGPoint gy_screen_adaptive_point(CGPoint pointValue);

extern CGSize gy_screen_adaptive_size(CGSize sizeValue);

extern CGRect gy_screen_adaptive_rect(CGRect rectValue);

extern CGFloat gy_screen_vertical_adaptive_float_with_padding(CGFloat floatValue, CGFloat padding);



NS_ASSUME_NONNULL_END
