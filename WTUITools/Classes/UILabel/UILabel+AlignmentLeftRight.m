//
//  UILabel+AlignmentLeftRight.m
//  EliteShow
//
//  Created by Waiting.Y on 2018/12/7.
//  Copyright © 2018年 Elite Show. All rights reserved.
//

#import "UILabel+AlignmentLeftRight.h"
#import <CoreText/CoreText.h>

@implementation UILabel (AlignmentLeftRight)

- (void)changeAlignmentRightandLeft
{
    
    CGRect textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil];
    
    CGFloat margin = (self.frame.size.width - textSize.size.width) / (self.text.length - 1);
    
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributeString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1)];
    self.attributedText = attributeString;
    
}

@end
