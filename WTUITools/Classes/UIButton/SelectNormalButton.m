//
//  SelectNormal.m
//  TaxiGo
//
//  Created by 叶威廷 on 2017/5/12.
//  Copyright © 2017年 studio sans. All rights reserved.
//

#import "SelectNormalButton.h"

@interface SelectNormalButton()
{
    UIImage *_normalImg;
    UIImage *_selectImg;
}

@end

@implementation SelectNormalButton

- (instancetype)initWithNormalImage:(UIImage *)normalImage
                     andSelectImage:(UIImage *)selectImage
                      andButtonType:(UIButtonType)type
{
    self = [SelectNormalButton buttonWithType:type];
    if (self) {
        _normalImg = normalImage;
        _selectImg = selectImage;
        [self setImage:_normalImg forState:UIControlStateNormal];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        if (_selectImg) {
            [self setImage:_selectImg forState:UIControlStateNormal];
        }
    }else{
        if (_normalImg) {
            [self setImage:_normalImg forState:UIControlStateNormal];
        }
    }
}

@end
