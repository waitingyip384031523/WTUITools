//
//  YHCountButton.h
//  EliteShow
//
//  Created by Wt.Yip on 2018/1/4.
//  //  Copyright © 2018年 EliteShow. All rights reserved.
//

#import "YHButton.h"
#import "YHCountButtonStyle.h"

typedef void(^TouchBlock)(id x);

@interface YHCountButton : YHButton

- (instancetype)initWithStyle:(YHCountButtonStyle *)style;
+ (instancetype)countBtn;
- (void)openCountdown;

@property (nonatomic, copy  ) TouchBlock    touchBlock;
@property (nonatomic, assign) BOOL          isCounting;

- (void)onTouch;

@end
