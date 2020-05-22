//
//  WTSearchTextField.m
//  EliteShow
//
//  Created by PENG TAO on 2018/11/1.
//  Copyright © 2018年 Elite Show. All rights reserved.
//

#import "WTSearchTextField.h"
#import "UIViewExt.h"
#import "UIImage+Category.h"
#import "UIColor+Category.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation WTSearchTextField

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder
{
    self = [super init];
    if (self) {
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:15];
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage bundleImageNamed:@"main_search_img" inObject:self]];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imgV.image.size.width + 12 + 8, 35.f)];
        [view addSubview:imgV];
        imgV.left = 12;
        imgV.top = (view.height - imgV.image.size.height) / 2;
        imgV.contentMode = UIViewContentModeCenter;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = view;
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; // 创建属性字典
        attrs[NSFontAttributeName] =  [UIFont systemFontOfSize:15]; // 设置font
        attrs[NSForegroundColorAttributeName] = [UIColor blackColor]; // 设置颜色
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:placeHolder attributes:attrs]; // 初始化富文本占位字符串
        self.attributedPlaceholder = attStr;
//        self.clearButtonMode = UITextFieldViewModeAlways;
        self.returnKeyType = UIReturnKeyDone;
//        UIButton *btn = [self valueForKey:@"_clearButton"];
        self.backgroundColor = [UIColor hexColor:0xF5F4F9];
//        [btn setImage:ImageNamed(@"main_search_clear_img") forState:UIControlStateNormal];
//        [btn setBackgroundColor:SECTION_TITLE_C];
        self.clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.clearBtn setImage:[UIImage bundleImageNamed:@"main_search_clear_img" inObject:self] forState:UIControlStateNormal];
        [self.clearBtn sizeToFit];
        self.clearBtn.width += 15;
        self.showClearBtn = NO;
        @weakify(self)
        [[[self.clearBtn rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            self.text = @"";
            self.showClearBtn = NO;
            if (self.tfDidChange) {
                self.tfDidChange(self.text);
            }
        }];
        self.rightViewMode = UITextFieldViewModeAlways;
        self.rightView = self.clearBtn;
        self.layer.cornerRadius = 35.f / 2;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
