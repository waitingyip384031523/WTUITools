//
//  WTTextField.m
//  EliteShow
//
//  Created by Elite Show on 2018/10/16.
//  Copyright © 2018 Elite Show. All rights reserved.
//

#import "WTDisableEmojiTextField.h"
#import "NSString+Judge.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface WTDisableEmojiTextField()<UITextFieldDelegate>

@end

@implementation WTDisableEmojiTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.isPhone = NO;
        self.maxTextLength = 0;
        @weakify(self)
        [[self.rac_textSignal takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSString * _Nullable x) {
            @strongify(self)
            UITextRange *selectedRange = [self markedTextRange];
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            if (!self.emoji) {
                if ([NSString stringContainsEmoji:x]) {
                    self.text = [NSString disable_emoji:x];
                }
            }
            if (!self.noSp) {
                NSString *s = @"@～！#¥%…&*（）+「」|：“《》？【】、；‘，。/~!$^()_+{}|:\"<>?-=[]\\;',/€£¥•⋯、！ ➋➌➍➎➏➐➑➒";
                if (!self.noDot) {
                    s = [s stringByAppendingString:@"."];
                }
                if (self.isEmail) {
                    if ([s containsString:@"."]) {
                        s = [s stringByReplacingOccurrencesOfString:@"." withString:@""];
                    }
                    if ([s containsString:@"@"]) {
                        s = [s stringByReplacingOccurrencesOfString:@"@" withString:@""];
                    }
                    if ([s containsString:@"-"]) {
                        s = [s stringByReplacingOccurrencesOfString:@"-" withString:@""];
                    }
                    if ([s containsString:@"_"]) {
                        s = [s stringByReplacingOccurrencesOfString:@"_" withString:@""];
                    }
//                    if (x.length == 1) {
//                        if (![NSString isABC:x]) {
//                            self.text = @"";
//                        }
//                    }
                }
                if (self.noChinese) {
                    NSString *str = self.text;
                    for(int i=0; i< [x length];i++){
                        NSRange range = NSMakeRange(i, 1);
                        NSString *strFromSubStr = [x substringWithRange:range];
                        if ([self isChinese:strFromSubStr]) {
                            //汉字
                            str = [str stringByReplacingOccurrencesOfString:strFromSubStr withString:@""];
                        } else {
                            //字母
                        }
                    }
                    self.text = str;
                }
                if (self.isWechat) {
                    if ([s containsString:@"-"]) {
                        s = [s stringByReplacingOccurrencesOfString:@"-" withString:@""];
                    }
                    if ([s containsString:@"_"]) {
                        s = [s stringByReplacingOccurrencesOfString:@"_" withString:@""];
                    }
//                    if (x.length == 1) {
//                        if (![NSString isABC:x]) {
//                            self.text = @"";
//                        }
//                    }
                }
                if (self.haveBlank) {
                    s = [s stringByReplacingOccurrencesOfString:@" " withString:@""];
                }
                if ([self.text containsString:@"……"]) {
                    NSMutableString *str = [[NSMutableString alloc] initWithString:self.text];
                    NSRange range = [str rangeOfString:@"……"];
                    [str deleteCharactersInRange:range];
                    self.text = str;
                }else{
                    if (!position) {
                        __block NSMutableString *str = [[NSMutableString alloc] initWithString:self.text];
                        [self.text containString:s completion:^(NSInteger index, BOOL contain) {
                            if (contain) {
                                [str deleteCharactersInRange:NSMakeRange(index, 1)];
                                self.text = str;
                            }
                        }];
                    }
                }
            }
            if (self.isPhone) {
                if (self.text.length > 11) {
                    self.text = [self.text substringWithRange:NSMakeRange(0, 11)];
                }
            }else{
                if (self.maxTextLength) {
                    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;
                    
                    if ([lang isEqualToString:@"zh-Hans"] || [lang isEqualToString:@"zh-Hant"]) { // zh-Hans代表简体中文输入，包括简体拼音，健体五笔，简体手写
                        
                        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                        
                        if (!position) {
                            if (self.text.length > self.maxTextLength) {
                                self.text = [self.text substringWithRange:NSMakeRange(0, self.maxTextLength)];
//                                [WTHUB showCenterWithText:MAX_INPUT_TEXT((int)self.maxTextLength)];
                            }
                            if (self.tfDidChange) {
                                self.tfDidChange(self.text);
                            }
                            self.showClearBtn = self.text.length;
                        }
                    } else {// 中文输入法以外的直接统计
                        if (self.text.length > self.maxTextLength) {
                            self.text = [self.text substringWithRange:NSMakeRange(0, self.maxTextLength)];
//                            [WTHUB showCenterWithText:MAX_INPUT_TEXT((int)self.maxTextLength)];
                        }
                        if (self.tfDidChange) {
                            self.tfDidChange(self.text);
                        }
                        self.showClearBtn = self.text.length;
                    }
                }
            }
            if (self.tfDidChange) {
                self.tfDidChange(self.text);
            }
            self.showClearBtn = self.text.length;
        }];
    }
    return self;
}

- (BOOL)isChinese:(NSString *)str
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:str];
}

- (void)setShowClearBtn:(BOOL)showClearBtn
{
    _showClearBtn = showClearBtn;
    if (self.clearBtn) {
        self.clearBtn.hidden = !showClearBtn;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (self.isFirstResponder && !position) {
        if (!self.noSp) {
            NSString *tem = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
            NSString *s = @"～！@#¥%…&*（）+「」|：“《》？【】、；‘，。/~!$^()_+{}|:\"<>?-=[]\\;',/€£¥•⋯、！ ";
            if (!self.noDot) {
                s = [s stringByAppendingString:@"."];
            }
            if (self.isEmail) {
                if ([s containsString:@"."]) {
                    s = [s stringByReplacingOccurrencesOfString:@"." withString:@""];
                }
                if ([s containsString:@"@"]) {
                    s = [s stringByReplacingOccurrencesOfString:@"@" withString:@""];
                }
                if ([s containsString:@"-"]) {
                    s = [s stringByReplacingOccurrencesOfString:@"-" withString:@""];
                }
                if ([s containsString:@"_"]) {
                    s = [s stringByReplacingOccurrencesOfString:@"_" withString:@""];
                }
            }
            if (self.isWechat) {
                if ([s containsString:@"."]) {
                    s = [s stringByReplacingOccurrencesOfString:@"." withString:@""];
                }
                if ([s containsString:@"-"]) {
                    s = [s stringByReplacingOccurrencesOfString:@"-" withString:@""];
                }
                if ([s containsString:@"_"]) {
                    s = [s stringByReplacingOccurrencesOfString:@"_" withString:@""];
                }
            }
            if (self.noChinese && [self isChinese:string]) {
                return NO;
            }
            if (self.haveBlank) {
                s = [s stringByReplacingOccurrencesOfString:@" " withString:@""];
                if ([string isEqualToString:@" "]) {
                    return YES;
                }
            }
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:s];
            NSString *str = [tem stringByTrimmingCharactersInSet:set];
            if (![string isEqualToString:str]) {
                return NO;
            }
        }
        if (self.isPure) {
            if (string.length)
            {
                unichar single = [string characterAtIndex:0]; // 当前输入的字符
                if ((single >= '0' && single <= '9') || single == '.')  // 数据正确
                {
                    // 首位不能为小数点
                    if (!textField.text.length)  // 还没有输入，首位
                    {
                        if (single == '.')
                        {
                            return NO;
                        }
                        return YES;
                    }
                    else
                    {
                        // 不是首位，判断其他
                        NSRange pointRange = [textField.text rangeOfString:@"."];
                        if (pointRange.length)
                        {
                            // 存在点，小数点之后2位
                            if (textField.text.length - pointRange.location > 2 || single == '.')
                            {
                                return NO;
                            }
                            return YES;
                        }
                        else
                        {
                            // 不存在点
                            if (![textField.text floatValue])
                            {
                                // 等于0，只能输入点
                                if (single == '.')
                                {
                                    return YES;
                                }
                                return NO;
                            }
                            else
                            {
                                // 大于0，最大5位数
                                if (textField.text.length >= 5 && single != '.')
                                {
                                    return NO;
                                }
                                return YES;
                            }
                        }
                    }
                }
                return NO;
            }
            return YES;
        }
        if ([[[self textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[self textInputMode] primaryLanguage]) {
            return NO;
        }
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.tfDidEndEdit) {
        self.tfDidEndEdit();
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (self.tfShouldBeginEdit) {
        return self.tfShouldBeginEdit();
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.tfShouldReturn) {
        return self.tfShouldReturn();
    }
    return YES;
}

@end
