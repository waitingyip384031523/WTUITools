//
//  YHCountButtonStyle.m
//  EliteShow
//
//  Created by Wt.Yip on 2018/1/4.
//  //  Copyright © 2018年 EliteShow. All rights reserved.
//

#import "YHCountButtonStyle.h"

#define UNSELECT_BTN_TEXT_COLOR UIColorFromRGB(0x9c9a94)

#define GET_VERIFY_CODE         @"获取验证码"
#define RESEND_VERIFY_CODE      @"重新发送"
#define DEFAULT_CORNER          3.f
#define HOLDER_TEXT             @"s"

#define SEND                    @"发送"

@implementation YHCountButtonStyle

+ (instancetype)defaultStyle
{
    YHCountButtonStyle *defaultStyle = [[YHCountButtonStyle alloc] init];
    defaultStyle.normalTitle = RESEND_VERIFY_CODE;
    defaultStyle.unSelectTitle = RESEND_VERIFY_CODE;
//    defaultStyle.normalBgColor = COMMON_BTN_HIGHLIGHT_COLOR;
//    defaultStyle.font = H13;
//    defaultStyle.normalFontColor = white_color;
//    defaultStyle.countBgColor = COMMON_DISABLED_BG_COLOR;
//    defaultStyle.countFontColor = white_color;
    defaultStyle.cornerRadius = 35.f / 2;
    defaultStyle.holderString = HOLDER_TEXT;
    return defaultStyle;
}

+ (instancetype)userInfoStyle
{
    YHCountButtonStyle *userInfoStyle = [[YHCountButtonStyle alloc] init];
    userInfoStyle.normalTitle = SEND;
    userInfoStyle.unSelectTitle = RESEND_VERIFY_CODE;
//    userInfoStyle.normalBgColor = MAIN_COLOR;
//    userInfoStyle.font = H15;
//    userInfoStyle.normalFontColor = white_color;
//    userInfoStyle.countFontColor = white_color;
//    userInfoStyle.countBgColor = UNSELECT_BTN_TEXT_COLOR;
    userInfoStyle.cornerRadius = DEFAULT_CORNER;
    userInfoStyle.holderString = HOLDER_TEXT;
    return userInfoStyle;
}

@end
