//
//  YHMainTabBarItem.h
//  Wt.Yip
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

@interface WTMainTabBarItem : UIView

@property (nonatomic, strong, nullable) UIImage     *itemImage;
@property (nonatomic, strong, nullable) UIImage     *selectedImage;
@property (nonatomic, strong, nullable) NSString    *title;
@property (nonatomic, strong, nullable) UIColor     *normalColor;
@property (nonatomic, strong, nullable) UIColor     *selectedColor;

- (instancetype _Nullable )initWithItemImage:(UIImage * _Nullable)itemImage
                               selectedImage:(UIImage * _Nullable)selectedImage
                                 normalColor:(UIColor * _Nullable)normalColor
                               selectedColor:(UIColor * _Nullable)selectedColor
                                       title:(NSString * _Nullable)title;

@end
