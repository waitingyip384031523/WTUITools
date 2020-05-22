//
//  NSString+Judge.h
//  EliteShow
//
//  Created by Wt.Yip on 2018/1/3.
//  //  Copyright © 2018年 EliteShow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Judge)

//判断是否为整形：
+ (BOOL)isPurelnt:(NSString *)string;
//判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString *)string;
//判空：
+ (NSString *)isNullToString:(id)string;
//判断手机号码：
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
// 汉字转unicode
+ (NSString *)utf8ToUnicode:(NSString *)string;
- (NSString *)utf8ToUnicode;

+ (NSString *)disable_emoji:(NSString *)text;
+ (BOOL)isInputRuleNotBlank:(NSString *)str;
+ (BOOL)stringContainsEmoji:(NSString *)string;
+ (BOOL)isABC:(NSString *)str;
- (NSString *)getNewSubStoreNameByRegularExpression;
- (NSString *)hexStringFromString:(NSString *)string;
- (NSString *)containString:(NSString *)str;
- (void)containString:(NSString *)str
           completion:(void(^)(NSInteger index, BOOL contain))completion;
+ (NSMutableAttributedString *)attWithStr:(NSString *)str
                                  keyword:(NSString *)keyword
                                    color:(UIColor *)color;
+ (NSMutableAttributedString *)attWithStr:(NSString *)str
                                     user:(NSString *)user
                               targetUser:(NSString *)targetUser
                                    color:(UIColor *)color;
+ (NSDictionary *)getUrlParameters:(NSString *)urlStr;
- (BOOL)isInputRuleAndNumber:(NSString *)exc;
- (NSInteger)byteLength;
+ (BOOL)checkDecimalDotPlaces:(NSRange)range dotPlaces:(NSNumber *)dotPlaces decimal:(NSString *)decimal;
- (NSUInteger)lengthOfString:(NSString *)str;
+ (void)rangesOfSubString:(NSString*)substring                          inString:(NSString*)string
                     find:(void(^)(NSRange range))find;
+ (NSMutableAttributedString *)attWithStr:(NSString *)str
                                  keyword:(NSString *)keyword
                                    color:(UIColor *)color
                                     font:(UIFont *)font;
+ (NSMutableAttributedString *)pAttWithStr:(NSString *)str
                                   keyword:(NSString *)keyword
                                     color:(UIColor *)color;
+ (NSMutableAttributedString *)pAttWithStr:(NSString *)str
                                   keyword:(NSString *)keyword
                                     color:(UIColor *)color
                                      font:(UIFont *)font;
-(NSString *)urlAddCompnentForValue:(NSString *)value key:(NSString *)key;

@end
