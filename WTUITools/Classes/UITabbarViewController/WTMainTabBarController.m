//
//  YHTabBarController.m
//  Wt.Yip
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTMainTabBarController.h"

@interface WTMainTabBarController ()<WTMainTabBarDataSource,WTMainTabBarDelegate>

@end

@implementation WTMainTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupTabBarView];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setupTabBarView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupTabBarView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tabBarView.frame = self.tabBar.bounds;
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    [self.tabBar addSubview:self.tabBarView];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    self.tabBarView.selectedTabBarItemIndex = selectedIndex;
    [self.tabBarView setNeedsLayout];
}

- (void)setTabBarViewHeight:(CGFloat)tabBarViewHeight
{
    CGRect newFrame = self.tabBar.frame;
    newFrame.size.height = tabBarViewHeight;
    [self.tabBar setFrame:newFrame];
}

- (CGFloat)tabBarViewHeight
{
    return self.tabBar.frame.size.height;
}

//- (void)onlyShowCenterView:(BOOL)isShow
//{
//    if (isShow) {
//        self.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT - self.tabBar.frame.size.height, SCREEN_WIDTH, self.tabBar.frame.size.height);
//        self.centerView.frame = CGRectMake(SCREEN_WIDTH / 2 - 25, -10, 50, 50);
//    }else{
//        self.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.tabBar.frame.size.height);
//        self.centerView.frame = CGRectMake(SCREEN_WIDTH / 2 - 25, -54, 50, 50);
//    }
//}

#pragma mark - Private

- (void)setupTabBarView
{
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    
    self.tabBarView = [[WTMainTabBar alloc] initWithController:self];
    [self.tabBar addSubview:self.tabBarView];
}

#pragma mark - YHTabBarViewDelegate
- (BOOL)tabBar:(WTMainTabBar *)tabBar shouldSelectItemAtIndex:(NSUInteger)index
{
    UIViewController *viewControllerToSelect = self.viewControllers[index];
    
    BOOL shouldAskForPermission = [self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)];
    
    BOOL selectionAllowed = YES;
    
    if (shouldAskForPermission) {
        selectionAllowed = [self.delegate tabBarController:self shouldSelectViewController:viewControllerToSelect];
    }
    
    return selectionAllowed;
}

- (void)tabBar:(WTMainTabBar *)tabBar didSelectItemAtIndex:(NSUInteger)index
{
    self.selectedViewController = self.viewControllers[index];
}

#pragma mark - YHTabBarViewDataSource
- (NSArray *)leftTabBarItemsInTabBarView:(WTMainTabBar *)tabBarView
{
    return self.leftBarItems;
}

- (NSArray *)rightTabBarItemsInTabBarView:(WTMainTabBar *)tabBarView
{
    return self.rightBarItems;
}

- (UIView *)centerViewInTabBar:(WTMainTabBar *)tabBarView
{
    return self.centerView;
}

- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
