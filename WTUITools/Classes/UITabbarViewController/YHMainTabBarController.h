//
//  YHTabBarController.h
//  HowKong
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 EliteShow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHMainTabBar.h"
#import "YHMainTabBarItem.h"

@class EHRotateButtonView;

@interface YHMainTabBarController : UITabBarController

@property (nonatomic, copy  ) NSArray       *leftBarItems;
@property (nonatomic, copy  ) NSArray       *rightBarItems;

@property (nonatomic, assign) CGFloat       tabBarViewHeight;
@property (nonatomic, strong) YHMainTabBar  *tabBarView;

@property (nonatomic, strong) UIView *centerView;

//- (void)onlyShowCenterView:(BOOL)isShow;

@end
