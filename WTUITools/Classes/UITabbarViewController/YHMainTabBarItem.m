//
//  YHMainTabBarItem.m
//  HowKong
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 EliteShow. All rights reserved.
//

#import "YHMainTabBarItem.h"

@implementation YHMainTabBarItem

#pragma mark - Initialization

- (instancetype)initWithItemImage:(UIImage *)itemImage
                    selectedImage:(UIImage * _Nullable)selectedImage
                      normalColor:(UIColor * _Nullable)normalColor
                    selectedColor:(UIColor * _Nullable)selectedColor
                            title:(NSString * _Nullable)title
{
    self = [super init];
    if (self) {
        _itemImage = itemImage;
        _selectedImage = selectedImage;
        _normalColor = normalColor;
        _selectedColor = selectedColor;
        _title = title;
    }
    return self;
}

@end
