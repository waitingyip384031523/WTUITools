//
//  WTTextView.m
//  EliteShow
//
//  Created by Elite Show on 2018/10/16.
//  Copyright © 2018 Elite Show. All rights reserved.
//

#import "WTDisableEmojiTextView.h"
#import "NSString+Judge.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface WTDisableEmojiTextViewDelegate()

@end

@implementation WTDisableEmojiTextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (self.tv.isFirstResponder && !self.tv.entryEmoji) {
        if ([[[self.tv textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[self.tv textInputMode] primaryLanguage]) {
            return NO;
        }
    }
    return YES;
}

@end

@interface WTDisableEmojiTextView()

@end

@implementation WTDisableEmojiTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self observeText];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self observeText];
    }
    return self;
}

- (void)observeText
{
    self.eDelegate = [[WTDisableEmojiTextViewDelegate alloc] init];
    self.eDelegate.tv = self;
    __weak typeof(WTDisableEmojiTextViewDelegate) *weakDelegate = self.eDelegate;
    self.delegate = (id<UITextViewDelegate>)weakDelegate;
    @weakify(self)
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextViewTextDidChangeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self)
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (!self.entryEmoji) {
                if ([NSString stringContainsEmoji:self.text]) {
                    self.text = [NSString disable_emoji:self.text];
                    if (self.tvDidChange) {
                        self.tvDidChange(self.text.length);
                    }
                }
            }
        }
        NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;
        
        if ([lang isEqualToString:@"zh-Hans"] || [lang isEqualToString:@"zh-Hant"]) { // zh-Hans代表简体中文输入，包括简体拼音，健体五笔，简体手写
            
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            
            if (!position) {
                if (self.text.length > self.length) {
                    self.text = [self.text substringWithRange:NSMakeRange(0, self.length)];
                }
                if (self.tvDidChange) {
                    self.tvDidChange(self.text.length);
                }
            }
        } else {// 中文输入法以外的直接统计
            if (self.text.length > self.length) {
                self.text = [self.text substringWithRange:NSMakeRange(0, self.length)];
            }
            if (self.tvDidChange) {
                self.tvDidChange(self.text.length);
            }
        }
    }];
}

- (BOOL)getEnable
{
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        NSString *text = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([NSString isNullToString:text].length != 0) {
            return self.text.length;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

@end
