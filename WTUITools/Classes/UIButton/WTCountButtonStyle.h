//
//  YHCountButtonStyle.h
//  Wt.Yip
//
//  Created by Wt.Yip on 2018/1/4.
//  //  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTCountButtonStyle : NSObject

@property (nonatomic, copy  ) NSString  *normalTitle;
@property (nonatomic, copy  ) NSString  *unSelectTitle;
@property (nonatomic, strong) UIColor   *normalBgColor;
@property (nonatomic, strong) UIFont    *font;
@property (nonatomic, strong) UIColor   *normalFontColor;
@property (nonatomic, strong) UIColor   *countBgColor;
@property (nonatomic, assign) CGFloat   cornerRadius;
@property (nonatomic, strong) UIColor   *countFontColor;
@property (nonatomic, copy  ) NSString  *holderString;

+ (instancetype)defaultStyle;
+ (instancetype)userInfoStyle;

@end
