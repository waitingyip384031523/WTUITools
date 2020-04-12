//
//  YHCountButton.h
//  Wt.Yip
//
//  Created by Wt.Yip on 2018/1/4.
//  //  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTButton.h"
#import "YHCountButtonStyle.h"

typedef void(^TouchBlock)(id x);

@interface WTCountButton : WTButton

- (instancetype)initWithStyle:(YHCountButtonStyle *)style;
+ (instancetype)countBtn;
- (void)openCountdown;

@property (nonatomic, copy  ) TouchBlock    touchBlock;
@property (nonatomic, assign) BOOL          isCounting;

- (void)onTouch;

@end
