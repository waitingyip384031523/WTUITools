//
//  NSString+Judge.m
//  EliteShow
//
//  Created by Wt.Yip on 2018/1/3.
//  //  Copyright © 2018年 EliteShow. All rights reserved.
//

#import "NSString+Judge.h"

@implementation NSString (Judge)

//判断是否为整形：
+ (BOOL)isPurelnt:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val]&&[scan isAtEnd];
}

//判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val]&&[scan isAtEnd];
}

//判空：
+ (NSString *)isNullToString:(id)string
{
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] ||
        [string isEqual:[NSNull null]] || [string isEqual:NULL] ||
        [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL ||
        [string isKindOfClass:[NSNull class]] ||
        [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 ||
        [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"])
    {
        return @"";
        
        
    }else{
        
        return (NSString *)string;
    }
}

// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[0-9]|5[0-9]|8[0-9]|7[0-9]|9[0-9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}

- (NSString *)utf8ToUnicode
{
    NSUInteger length = [self length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
        unichar _char = [self characterAtIndex:i];
        // 判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='a' && _char <= 'z'){
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i,1)]];
        }else{
            // 中文和字符
            [s appendFormat:@"\\u%x",[self characterAtIndex:i]];
            // 不足位数补0 否则解码不成功
            if(s.length == 4) {
                [s insertString:@"00" atIndex:2];
            } else if (s.length == 5) {
                [s insertString:@"0" atIndex:2];
            }
        }
        [str appendFormat:@"%@", s];
    }
    return str;
}

+ (NSString *)utf8ToUnicode:(NSString *)string
{
    NSUInteger length = [string length];
    NSMutableString *str = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        NSMutableString *s = [NSMutableString stringWithCapacity:0];
        unichar _char = [string characterAtIndex:i];
        // 判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='a' && _char <= 'z'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else{
            // 中文和字符
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            // 不足位数补0 否则解码不成功
            if(s.length == 4) {
                [s insertString:@"00" atIndex:2];
            } else if (s.length == 5) {
                [s insertString:@"0" atIndex:2];
            }
        }
        [str appendFormat:@"%@", s];
    }
    return str;
}

+ (BOOL)isInputRuleNotBlank:(NSString *)str {
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    // 这里是后期补充的内容:九宫格判断
    if (!isMatch) {
        NSString *other = @"➋➌➍➎➏➐➑➒";
        unsigned long len=str.length;
        for(int i=0;i<len;i++)
        {
            unichar a=[str characterAtIndex:i];
            if(!((isalpha(a))
                 ||(isalnum(a))
                 ||((a=='_') || (a == '-'))
                 ||((a >= 0x4e00 && a <= 0x9fa6))
                 ||([other rangeOfString:str].location != NSNotFound)
                 ))
                return NO;
        }
        return YES;
        
    }
    return isMatch;
}


+ (NSString *)disable_emoji:(NSString *)text {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}

- (NSUInteger)lengthOfString:(NSString *)str
{
    NSUInteger length = 0;
    NSRange range;
    for (int i=0; i < str.length; i+=range.length) {
        range = [str rangeOfComposedCharacterSequenceAtIndex:i];
        length += 1;
    }
    
    return length;
}

+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f9e8) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3 || ls == 0xfe0f) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0x200d) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

+ (BOOL)isABC:(NSString *)str
{
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    if ([regular numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)]) {
        return YES;
    }else{
        return NO;
    }
}

- (NSString *)getNewSubStoreNameByRegularExpression
{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"～！@#¥%……&*（）——+「」|：“《》？【】、；‘，。/~!$^()_+{}|:\"<>?-=[]\\;',/€£¥•" options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators | NSRegularExpressionAnchorsMatchLines | NSRegularExpressionAllowCommentsAndWhitespace error:&error];
    NSString *result = [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@"pk"];
    return [result componentsSeparatedByString:@"pk"].firstObject;
}


- (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

/**
 十进制转换十六进制
 
 @param decimal 十进制数
 @return 十六进制数
 */
+ (NSString *)getHexByDecimal:(NSInteger)decimal {
    
    NSString *hex =@"";
    NSString *letter;
    NSInteger number;
    for (int i = 0; i<9; i++) {
        
        number = decimal % 16;
        decimal = decimal / 16;
        switch (number) {
                
            case 10:
                letter =@"A"; break;
            case 11:
                letter =@"B"; break;
            case 12:
                letter =@"C"; break;
            case 13:
                letter =@"D"; break;
            case 14:
                letter =@"E"; break;
            case 15:
                letter =@"F"; break;
            default:
                letter = [NSString stringWithFormat:@"%ld", number];
        }
        hex = [letter stringByAppendingString:hex];
        if (decimal == 0) {
            
            break;
        }
    }
    return hex;
}

- (NSString *)containString:(NSString *)str
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:str];
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    for (NSInteger i = length; i > 0; i--) {
        if (![characterSet characterIsMember:charBuffer[i - 1]]) {
            break;
        }
    }
    NSString *ss = [self substringWithRange:NSMakeRange(location, length - location)];
    return ss;
}

- (void)containString:(NSString *)str
           completion:(void(^)(NSInteger index, BOOL contain))completion
{
    BOOL contain = NO;
    NSInteger index = 0;
    for (int i = 0; i < str.length; i++) {
        NSString *subStr = [str substringWithRange:NSMakeRange(i, 1)];
        if ([self containsString:subStr]) {
            contain = YES;
            index = [self rangeOfString:subStr].location;
            break;
        }
    }
    if (completion) {
        completion(index, contain);
    }
}

+ (void)rangesOfSubString:(NSString*)substring                  inString:(NSString*)string
                   find:(void(^)(NSRange range))find
{
    if (substring.length == 0 || string.length == 0) {
        return;
    }
    NSRange searchRange = NSMakeRange(0,string.length);
    NSRange foundRange;
    while (searchRange.location < string.length) {
        searchRange.length = string.length - searchRange.location;
        foundRange = [string rangeOfString:substring options:NSCaseInsensitiveSearch range:searchRange];
        if (foundRange.location != NSNotFound) {
            // found an occurrence of the substring! do stuff here
            searchRange.location = foundRange.location+foundRange.length;
            if (find) {
                find(foundRange);
            }
        } else {
            // no more substring to find
            break;
        }

    }
}

/**
 * 判断 字母、数字、中文
 */
- (BOOL)isInputRuleAndNumber:(NSString *)exc
{
    NSString *other = exc;     //九宫格的输入值
    unsigned long len = self.length;
    for(int i=0;i<len;i++)
    {
        unichar a=[self characterAtIndex:i];
        BOOL isOther = ([other rangeOfString:self].location != NSNotFound);
        if(!((isalpha(a))
             ||(isalnum(a))
             //             ||((a=='_') || (a == '-')) //判断是否允许下划线，昵称可能会用上
             ||((a >= 0x4e00 && a <= 0x9fa6))
             ||isOther
             ))
            return NO;
    }
    return YES;
}

- (NSInteger)byteLength
{
    NSUInteger len = self.length;
    NSString *pattern = @"[\u4e00-\u9fa5]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger numMatch = [regex numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, len)];
    return len + numMatch;
}

+ (NSMutableAttributedString *)attWithStr:(NSString *)str
                                  keyword:(NSString *)keyword
                                    color:(UIColor *)color
{
    if (![NSString isNullToString:str].length) {
        return nil;
    }
    NSMutableAttributedString *attS = [[NSMutableAttributedString alloc] initWithString:str];
    //    NSRange range = [str rangeOfString:self.data.keyword];
    
    NSString *copyStr = str;
    
    NSArray *array = [copyStr componentsSeparatedByString:keyword];
    int d = 0;
    for (int i = 0; i < array.count - 1; i++) {
        NSString *string = array[i];
        NSNumber *number = [NSNumber numberWithInt:d += string.length];
        d += keyword.length;
        NSRange range = NSMakeRange([number integerValue], keyword.length);
        if (range.length) {
            [attS addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    return attS;
}

static NSInteger prefix = 15;

+ (NSMutableAttributedString *)pAttWithStr:(NSString *)str
                                   keyword:(NSString *)keyword
                                     color:(UIColor *)color
{
    if (![NSString isNullToString:str].length) {
        return nil;
    }
    NSMutableAttributedString *attS = [[NSMutableAttributedString alloc] initWithString:str];
    //    NSRange range = [str rangeOfString:self.data.keyword];
    
    NSString *copyStr = str;
    
    NSArray *array = [copyStr componentsSeparatedByString:keyword];
    if (array.count) {
        NSString *st = [array firstObject];
        if (st.length > prefix) {
            NSInteger loc = st.length - prefix - 1;
            st = [st substringWithRange:NSMakeRange(loc, prefix)];
            attS = [[NSMutableAttributedString alloc] initWithString:[str substringWithRange:NSMakeRange(loc, str.length - loc)]];
            array = [attS.string componentsSeparatedByString:keyword];
        }else{
            
        }
    }
    int d = 0;
    for (int i = 0; i < array.count - 1; i++) {
        NSString *string = array[i];
        NSNumber *number = [NSNumber numberWithInt:d += string.length];
        d += keyword.length;
        NSRange range = NSMakeRange([number integerValue], keyword.length);
        if (range.length) {
            [attS addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    return attS;
}

+ (NSMutableAttributedString *)pAttWithStr:(NSString *)str
                                   keyword:(NSString *)keyword
                                     color:(UIColor *)color
                                      font:(UIFont *)font
{
    NSMutableAttributedString *attr = [self pAttWithStr:str keyword:keyword color:color];
    if (attr) {
        attr = [[NSMutableAttributedString alloc] initWithAttributedString:attr];
        [attr addAttributes:@{NSFontAttributeName:font} range:NSMakeRange(0, attr.length)];
        return attr;
    }
    return nil;
}

+ (NSMutableAttributedString *)attWithStr:(NSString *)str
                                  keyword:(NSString *)keyword
                                    color:(UIColor *)color
                                     font:(UIFont *)font
{
    NSMutableAttributedString *attr = [self attWithStr:str keyword:keyword color:color];
    if (attr) {
        attr = [[NSMutableAttributedString alloc] initWithAttributedString:attr];
        [attr addAttributes:@{NSFontAttributeName:font} range:NSMakeRange(0, attr.length)];
        return attr;
    }
    return nil;
}


+ (NSMutableAttributedString *)attWithStr:(NSString *)str
                                     user:(NSString *)user
                               targetUser:(NSString *)targetUser
                                    color:(UIColor *)color
{
    NSMutableAttributedString *attS = [[NSMutableAttributedString alloc] initWithString:str];
    //    NSRange range = [str rangeOfString:self.data.keyword];
    
    NSString *copyStr = str;
    
    if (user.length) {
        NSArray *array = [copyStr componentsSeparatedByString:user];
        int d = 0;
        for (int i = 0; i < array.count - 1; i++) {
            NSString *string = array[i];
            NSNumber *number = [NSNumber numberWithInt:d += string.length];
            d += user.length;
            NSRange range = NSMakeRange([number integerValue], user.length);
            if (range.length) {
                [attS addAttribute:NSForegroundColorAttributeName value:color range:range];
                break;
            }
        }
    }
    if (targetUser.length) {
        NSArray *ar = [copyStr componentsSeparatedByString:targetUser];
        int a = 0;
        for (int i = 0; i < ar.count - 1; i++) {
            NSString *string = ar[i];
            NSNumber *number = [NSNumber numberWithInt:a += string.length];
            a += targetUser.length;
            NSRange range = NSMakeRange([number integerValue], targetUser.length);
            if (range.length) {
                [attS addAttribute:NSForegroundColorAttributeName value:color range:range];
                break;
            }
        }
    }
    return attS;
}

+ (NSDictionary *)getUrlParameters:(NSString *)urlStr
{
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSArray *params =[URL.query componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    for (NSString *paramStr in params) {
        NSArray *dicArray = [paramStr componentsSeparatedByString:@"="];
        if (dicArray.count > 1) {
            NSString *decodeValue = [dicArray[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [tempDic setObject:decodeValue forKey:dicArray[0]];
        }
    }
    return tempDic;
}

/**
 
 *  检查浮点数小数位并校验小数点合法性
 *
 * @param range     浮点数总长度
 * @param dotPlaces 小数位
 * @param decimal   浮点数
 * @param string    当前输入的数值
 *
 * @return YES：没有小数点或者限制两位浮点数
 */

+ (BOOL)checkDecimalDotPlaces:(NSRange)range dotPlaces:(NSNumber *)dotPlaces decimal:(NSString *)decimal{
    
    BOOL bHaveDot = false;
    
    if (dotPlaces.integerValue < 0) {
        dotPlaces = @0;
    }
    
    if ([decimal rangeOfString:@"."].location == NSNotFound){
        bHaveDot = false;
    }else{
        bHaveDot = true;
    }
    
    if (bHaveDot) {
        //判断小数点的位数
        NSRange ran = [decimal rangeOfString:@"."];
        
        if(range.location - ran.location > dotPlaces.integerValue) {
            return NO;
        }
    }
    return YES;
}

-(NSString *)urlAddCompnentForValue:(NSString *)value key:(NSString *)key{
    
    NSMutableString *string = [[NSMutableString alloc]initWithString:self];
    @try {
        NSRange range = [string rangeOfString:@"?"];
        if (range.location != NSNotFound) {//找到了
            //如果?是最后一个直接拼接参数
            if (string.length == (range.location + range.length)) {
                NSLog(@"最后一个是?");
                string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,value]];
            }else{//如果不是最后一个需要加&
                if([string hasSuffix:@"&"]){//如果最后一个是&,直接拼接
                    string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,value]];
                }else{//如果最后不是&,需要加&后拼接
                    string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",key,value]];
                }
            }
        }else{//没找到
            if([string hasSuffix:@"&"]){//如果最后一个是&,去掉&后拼接
                string = (NSMutableString *)[string substringToIndex:string.length-1];
            }
            string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"?%@=%@",key,value]];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
    return string.copy;
}

@end
