//
//  YHTabBar.h
//  HowKong
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 EliteShow. All rights reserved.
//

@class YHMainTabBar;
@class YHMainTabBarController;

@protocol YHMainTabBarDataSource <NSObject>

- (NSArray *_Nullable)leftTabBarItemsInTabBarView:(YHMainTabBar *_Nullable)tabBarView;
- (NSArray *_Nullable)rightTabBarItemsInTabBarView:(YHMainTabBar *_Nullable)tabBarView;
- (UIView *_Nullable)centerViewInTabBar:(YHMainTabBar *_Nullable)tabBarView;

@end

@protocol YHMainTabBarDelegate <NSObject>

- (void)tabBar:(YHMainTabBar *_Nullable)tabBar didSelectItemAtIndex:(NSUInteger)index;
- (BOOL)tabBar:(YHMainTabBar *_Nullable)tabBar shouldSelectItemAtIndex:(NSUInteger)index;

@end

@interface YHMainTabBar : UIView

- (instancetype _Nullable )initWithController:(YHMainTabBarController *_Nullable)controller;

@property (nonatomic, weak, nullable) id<YHMainTabBarDataSource> dataSource;

@property (nonatomic, weak, nullable) id<YHMainTabBarDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedTabBarItemIndex;

@property (nonatomic, copy) UIColor * _Nullable tabBarColor;
@property (nonatomic, assign) UIEdgeInsets tabBarViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets tabBarItemEdgeInsets;

@end
