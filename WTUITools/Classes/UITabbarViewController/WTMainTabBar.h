//
//  YHTabBar.h
//  Wt.Yip
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

@class WTMainTabBar;
@class WTMainTabBarController;

@protocol WTMainTabBarDataSource <NSObject>

- (NSArray *_Nullable)leftTabBarItemsInTabBarView:(WTMainTabBar *_Nullable)tabBarView;
- (NSArray *_Nullable)rightTabBarItemsInTabBarView:(WTMainTabBar *_Nullable)tabBarView;
- (UIView *_Nullable)centerViewInTabBar:(WTMainTabBar *_Nullable)tabBarView;

@end

@protocol WTMainTabBarDelegate <NSObject>

- (void)tabBar:(WTMainTabBar *_Nullable)tabBar didSelectItemAtIndex:(NSUInteger)index;
- (BOOL)tabBar:(WTMainTabBar *_Nullable)tabBar shouldSelectItemAtIndex:(NSUInteger)index;

@end

@interface WTMainTabBar : UIView

- (instancetype _Nullable )initWithController:(WTMainTabBarController *_Nullable)controller;

@property (nonatomic, weak, nullable) id<WTMainTabBarDataSource> dataSource;

@property (nonatomic, weak, nullable) id<WTMainTabBarDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedTabBarItemIndex;

@property (nonatomic, copy) UIColor * _Nullable tabBarColor;
@property (nonatomic, assign) UIEdgeInsets tabBarViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets tabBarItemEdgeInsets;

@end
