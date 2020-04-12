//
//  YHTabBar.m
//  Wt.Yip
//
//  Created by Wt.Yip on 2017/7/27.
//  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTMainTabBar.h"
#import "YHMainTabBarItem.h"
#import "YHMainTabBarController.h"
#import "YHSelectedButton.h"

@interface WTMainTabBar()

@property (nonatomic, strong) NSArray   *allBarItems;
@property (nonatomic, strong) UIView    *topLine;
@property (nonatomic, strong) UIView    *centerView;
@property (nonatomic, strong) UIView    *mainView;

@property (nonatomic, strong) NSArray   *leftButtonsArray;
@property (nonatomic, strong) NSArray   *rightButtonsArray;

@property (nonatomic, strong) NSDictionary *leftTabBarItems;
@property (nonatomic, strong) NSDictionary *rightTabBarItems;

@property (nonatomic, strong) NSArray *allAdditionalButtons;

@end

@implementation WTMainTabBar

- (instancetype)initWithController:(YHMainTabBarController *)controller
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _delegate = (id<WTMainTabBarDelegate>)controller;
        _dataSource = (id<WTMainTabBarDataSource>)controller;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupUI];
}

#pragma mark - Private
- (void)setupUI
{
    [self removeViewsBeforeUpdateUI];
    
    [self setupLineView];
    [self setupMainView];
    [self setupCenterView];
    
    [self setupAdditionalTabBarItems];
    [self setupBarItemsModelRepresentation];
    [self setupTabBarItemsViewRepresentation];
}

- (void)removeViewsBeforeUpdateUI
{
    if (self.mainView) {
        [self.mainView removeFromSuperview];
        self.mainView = nil;
    }
    
//    if (self.centerView) {
//        [self.centerView removeFromSuperview];
//        self.centerView = nil;
//    }
    
    if (self.topLine) {
        [self.topLine removeFromSuperview];
        self.topLine = nil;
    }
}

- (void)setupLineView
{
    self.topLine = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, self.bounds.size.width, 0.5)];
//    self.topLine.backgroundColor = white_color;
    [self addSubview:self.topLine];
}

- (void)setupMainView
{
    self.mainView = [[UIView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.bounds, self.tabBarViewEdgeInsets)];
    self.mainView.backgroundColor = self.tabBarColor;
    [self addSubview:self.mainView];
}

- (void)setupCenterView
{
    if ([self.dataSource respondsToSelector:@selector(centerViewInTabBar:)]) {
        self.centerView = [self.dataSource centerViewInTabBar:self];
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        [window addSubview:self.centerView];
    }
}

- (void)setupAdditionalTabBarItems
{
    NSArray *leftTabBarItems = [self.dataSource leftTabBarItemsInTabBarView:self];
    NSArray *rightTabBarItems = [self.dataSource rightTabBarItemsInTabBarView:self];
    
    NSUInteger numberOfLeftItems = [leftTabBarItems count];
    NSUInteger numberOfRightItems = [rightTabBarItems count];
    
    CGFloat availableSpaceForAdditionalItemLeft = CGRectGetWidth(self.mainView.frame) / 2.f - CGRectGetWidth(self.centerView.frame) / 2.f - self.tabBarItemEdgeInsets.left;
    CGFloat availabelSpaceForAdditionalItemRight = CGRectGetWidth(self.mainView.frame) / 2.f - CGRectGetWidth(self.centerView.frame) / 2.f - self.tabBarItemEdgeInsets.right;
    CGFloat maxWidthForLeftBarButtonItem = availableSpaceForAdditionalItemLeft / numberOfLeftItems;
    CGFloat maxWidthForRightBarButtonItem = availabelSpaceForAdditionalItemRight / numberOfRightItems;
    
    NSMutableArray *reverseArrayLeft = [NSMutableArray arrayWithCapacity:self.leftButtonsArray.count];
    for (id element in [leftTabBarItems reverseObjectEnumerator]) {
        [reverseArrayLeft addObject:element];
    }
    
    NSMutableArray *mutableArray = [NSMutableArray array];
//    CGFloat deltaLeft = 0.f;
//    if (maxWidthForLeftBarButtonItem > CGRectGetWidth(self.centerView.frame)) {
//        deltaLeft = maxWidthForLeftBarButtonItem - CGRectGetWidth(self.centerView.frame);
//    }
    
    CGFloat startPositionLeft = CGRectGetWidth(self.mainView.bounds) / 2.f - CGRectGetWidth(self.centerView.frame) / 2.f - self.tabBarItemEdgeInsets.left/* - deltaLeft / 2*/;
    
    for (int i = 0; i < numberOfLeftItems; i++) {
        CGFloat buttonOringinX = startPositionLeft - maxWidthForLeftBarButtonItem * (i + 1);
        CGFloat buttonOringinY = 0.f;
        
        CGFloat buttonWidth = maxWidthForLeftBarButtonItem;
        CGFloat buttonHeight = CGRectGetHeight(self.mainView.frame);
        
        startPositionLeft -= self.tabBarItemEdgeInsets.right;
        
        YHMainTabBarItem *item = reverseArrayLeft[i];
        UIImage *image = item.itemImage;
        UIImage *selectImage = item.selectedImage;
        NSString *title = item.title;
        
        YHSelectedButton *button = [[YHSelectedButton alloc] initWithImagePosition:YHButtonImageTop andMargin:2];
        button.frame = CGRectMake(buttonOringinX, buttonOringinY, buttonWidth, buttonHeight);
        [button addTarget:self action:@selector(didTapBarItem:) forControlEvents:UIControlEventTouchUpInside];
        
        if (numberOfLeftItems == 1) {
            CGRect rect = button.frame;
            rect.size.width = CGRectGetHeight(self.mainView.frame);
            button.bounds = rect;
        }
        
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:item.normalColor forState:UIControlStateNormal];
        [button setTitleColor:item.selectedColor forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [button setImage:selectImage forState:UIControlStateSelected];
        [button setImage:image forState:UIControlStateNormal];
        button.adjustsImageWhenHighlighted = NO;
        
        [mutableArray addObject:button];
        [self.mainView addSubview:button];
    }
    
    self.leftButtonsArray = [mutableArray copy];
    
    [mutableArray removeAllObjects];
    
//    CGFloat rightDelta = 0.f;
//    if (maxWidthForRightBarButtonItem > CGRectGetWidth(self.centerView.frame)) {
//        rightDelta = maxWidthForRightBarButtonItem - CGRectGetWidth(self.centerView.frame);
//    }
    
    CGFloat rightOffset = self.tabBarItemEdgeInsets.right;
    CGFloat startPositionRight = CGRectGetWidth(self.mainView.bounds) / 2.f + CGRectGetWidth(self.centerView.frame) / 2.f/* + rightDelta*/;
    
    for (int i = 0; i < numberOfRightItems; i++) {
        CGFloat buttonOriginX = startPositionRight;
        CGFloat buttonOriginY = 0.f;
        CGFloat buttonWidth = maxWidthForRightBarButtonItem;
        CGFloat buttonHeight = CGRectGetHeight(self.mainView.bounds);
        
        startPositionRight = buttonOriginX + maxWidthForRightBarButtonItem + rightOffset;
        
        YHMainTabBarItem *item = rightTabBarItems[i];
        UIImage *image = item.itemImage;
        UIImage *selectImage = item.selectedImage;
        NSString *title = item.title;
        
        YHSelectedButton *button = [[YHSelectedButton alloc] initWithImagePosition:YHButtonImageTop andMargin:2];
        button.frame = CGRectMake(buttonOriginX, buttonOriginY, buttonWidth, buttonHeight);
        
        if (numberOfLeftItems == 1) {
            CGRect rect = button.frame;
            rect.size.width = CGRectGetHeight(self.mainView.frame);
            button.bounds = rect;
        }
        
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:item.normalColor forState:UIControlStateNormal];
        [button setTitleColor:item.selectedColor forState:UIControlStateSelected];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:selectImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(didTapBarItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [mutableArray addObject:button];
        button.adjustsImageWhenHighlighted = NO;
        [self.mainView addSubview:button];
    }
    self.rightButtonsArray = [mutableArray copy];
}

- (void)setupBarItemsModelRepresentation
{
    NSMutableArray *tempMutableArrayOfBarItems = [NSMutableArray array];
    
    NSArray *leftTabBarItems = [self.dataSource leftTabBarItemsInTabBarView:self];
    NSArray *rightTabBarItems = [self.dataSource rightTabBarItemsInTabBarView:self];
    
    for (YHMainTabBarItem *item in leftTabBarItems) {
        [tempMutableArrayOfBarItems addObject:item];
    }
    
    for (YHMainTabBarItem *item in rightTabBarItems) {
        [tempMutableArrayOfBarItems addObject:item];
    }
    
    self.allBarItems = [tempMutableArrayOfBarItems copy];
}

- (void)setupTabBarItemsViewRepresentation {
    NSMutableArray *tempArray = [NSMutableArray array];
    NSMutableArray *reverseArray = [NSMutableArray arrayWithCapacity:[self.leftButtonsArray count]];
    
    for (YHSelectedButton *button in [self.leftButtonsArray reverseObjectEnumerator]) {
        [reverseArray addObject:button];
    }
    
    for (YHSelectedButton *button in [reverseArray arrayByAddingObjectsFromArray:self.rightButtonsArray]) {
        [tempArray addObject:button];
    }
    
    self.allAdditionalButtons = [tempArray copy];
    
    for (int i = 0; i < self.allAdditionalButtons.count; i++) {
        YHSelectedButton *button = self.allAdditionalButtons[i];
        if (i == self.selectedTabBarItemIndex) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

- (void)didTapBarItem:(id)sender
{
    NSUInteger index = [self.allAdditionalButtons indexOfObject:sender];
    
    if (![self.delegate tabBar:self shouldSelectItemAtIndex:index]) {
        return;
    }
    
    self.selectedTabBarItemIndex = index;
    
    [self setNeedsLayout];
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
        [self.delegate tabBar:self didSelectItemAtIndex:index];
    }
}

@end
