//
//  UIColor+Works.m
//  GYBaseKit
//
//  Created by zhugy781 on 2020/12/25.
//

#import "UIColor+Works.h"

@implementation UIColor (Works)


- (NSString *)gy_hexString {
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 0;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return [NSString stringWithFormat:@"#%02X%02X%02X", (unsigned int)(r * 255.0),(unsigned int)(g * 255.0),(unsigned int)(b * 255.0)];
}


+ (UIColor *)gy_colorWithIntegerRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b {
    return [self gy_colorWithIntegerRed:r green:g blue:b alpha:1.0f];
}


+ (UIColor *)gy_colorWithIntegerRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((CGFloat)(r) / 255.0f) green:((CGFloat)(g) / 255.0f) blue:((CGFloat)(b) / 255.0f) alpha:alpha];
}


+ (nullable UIColor *)gy_colorWithHexString:(NSString *)string {
    CGFloat r, g, b, a;
    if (gy_convertHexStringToRGBAValue(string, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}


+ (nullable UIColor *)gy_colorWithHexString:(NSString *)string alpha:(CGFloat)alpha {
    CGFloat r, g, b, a;
    if (gy_convertHexStringToRGBAValue(string, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    }
    return nil;
}


static BOOL gy_convertHexStringToRGBAValue(NSString *str, CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [[str stringByTrimmingCharactersInSet:set] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4) {
            *a = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        } else {
            *a = 1;
        }
    } else {
        *r = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) {
            *a = gy_integerValueFromHexString([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        } else {
            *a = 1;
        }
    }
    return YES;
}


static inline NSUInteger gy_integerValueFromHexString(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}


@end



@implementation UIColor (Extension)


+ (UIColor *)gy_salmon {
    return [UIColor gy_colorWithIntegerRed:255 green:119 blue:119];
}


+ (UIColor *)gy_bloodOrange {
    return [UIColor gy_colorWithIntegerRed:245 green:1 blue:18];
}


+ (UIColor *)gy_orangeYellow {
    return [UIColor gy_colorWithIntegerRed:255 green:168 blue:0];
}


+ (UIColor *)gy_greyish {
    return [UIColor gy_colorWithIntegerRed:184 green:184 blue:184];
}


+ (UIColor *)gy_warmGrey {
    return [UIColor colorWithWhite:118.0f/255.0f alpha:1];
}


+ (UIColor *)gy_paleGrey {
    return [UIColor gy_colorWithIntegerRed:237 green:239 blue:243];
}


+ (UIColor *)gy_fadedBlue {
    return [UIColor gy_colorWithIntegerRed:111 green:140 blue:206];
}


+ (UIColor *)gy_pinkishGrey {
    return [UIColor gy_colorWithIntegerRed:196 green:198 blue:198];
}


+ (UIColor *)gy_purpleBrown {
    return [UIColor gy_colorWithIntegerRed:50 green:40 blue:44];
}


+ (UIColor *)gy_carolinaBlue {
    return [UIColor gy_colorWithIntegerRed:145 green:176 blue:255];
}


+ (UIColor *)gy_backgroundGrey {
    return [UIColor gy_colorWithIntegerRed:237 green:240 blue:242];
}


+ (UIColor *)gy_barTintColor {
    return [UIColor gy_colorWithIntegerRed:50 green:39 blue:43];
}


+ (UIColor *)gy_clayBrown {
    return [UIColor gy_colorWithIntegerRed:177 green:102 blue:56];
}


+ (UIColor *)gy_dirtBrown {
    return [UIColor gy_colorWithIntegerRed:110 green:87 blue:46];
}


+ (UIColor *)gy_shallowGrey {
    return [UIColor gy_colorWithIntegerRed:242 green:242 blue:242];
}


+ (UIColor *)gy_black_alpha_40 {
    return [UIColor gy_colorWithIntegerRed:0 green:0 blue:0 alpha:0.4];
}


+ (UIColor *)gy_selectedCellColor {
    return [UIColor gy_colorWithIntegerRed:217 green:217 blue:217];
}


+ (UIColor *)gy_mostlyWhite {
    return [UIColor gy_colorWithIntegerRed:251 green:251 blue:251];
}


+ (UIColor *)gy_silver {
    return [UIColor gy_colorWithIntegerRed:204 green:204 blue:204];
}


+ (UIColor *)gy_baseYellow {
    return [UIColor gy_colorWithHexString:@"ffda44"];
}


+ (UIColor *)gy_blackColor {
    return [UIColor gy_colorWithHexString:@"#141318"];
}


+ (UIColor *)gy_titleRagularColor {
    return [UIColor colorWithRed:0.66 green:0.66 blue:0.67 alpha:1];
}



@end
