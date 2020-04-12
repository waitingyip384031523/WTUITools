//
//  YHCountButton.m
//  Wt.Yip
//
//  Created by Wt.Yip on 2018/1/4.
//  //  Copyright © 2018年 Wt.Yip. All rights reserved.
//

#import "WTCountButton.h"
#import "UIImage+Category.h"

@interface WTCountButton()

@property (nonatomic, strong) YHCountButtonStyle *style;

@end

@implementation WTCountButton

+ (instancetype)countBtn
{
    return [[WTCountButton alloc] initWithStyle:[YHCountButtonStyle defaultStyle]];
}

- (instancetype)initWithStyle:(YHCountButtonStyle *)style
{
    self = [super initWithImagePosition:WTButtonText andMargin:0];
    if (self) {
        self.style = style;
        [self setTitle:self.style.normalTitle forState:UIControlStateNormal];
        [self setTitleColor:self.style.normalFontColor forState:UIControlStateNormal];
        [self.titleLabel setFont:self.style.font];
        [self setBackgroundImage:[[UIImage imageWithColor:[UIColor clearColor]] createImageSize:CGSizeMake(85.f, self.style.cornerRadius * 2) gradientColors:@[[UIColor colorWithRed:48.0 green:208.0 blue:214.0 alpha:1],[UIColor colorWithRed:47.0 green:233.0 blue:213.0 alpha:1]] percentage:@[@(0), @(1)] gradientType:GradientFromLeftTopToRightBottom] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:self.style.countBgColor] forState:UIControlStateDisabled];
        [self setTitleColor:self.style.countFontColor forState:UIControlStateDisabled];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.style.cornerRadius;
        [self addTarget:self action:@selector(onTouch) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)onTouch
{
    if (self.touchBlock) {
        self.touchBlock(self);
    }
//    [self openCountdown];
}

- (void)openCountdown
{
    NSTimeInterval time = 60.f;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);
    NSDate *endTime = [NSDate dateWithTimeIntervalSinceNow:time];
    dispatch_source_set_event_handler(_timer, ^{
        int seconds = [endTime timeIntervalSinceNow];
        if (seconds <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self setBackgroundImage:[UIImage imageWithColor:self.style.normalBgColor] forState:UIControlStateNormal];
//                [self setTitleColor:self.style.normalFontColor forState:UIControlStateNormal];
                [self setTitle:self.style.unSelectTitle forState:UIControlStateNormal];
                self.enabled = YES;
                self.isCounting = NO;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self setBackgroundImage:[UIImage imageWithColor:self.style.countBgColor] forState:UIControlStateNormal];
//                [self setTitleColor:self.style.normalFontColor forState:UIControlStateNormal];
                [self setTitle:[NSString stringWithFormat:@"%d%@",seconds,self.style.holderString] forState:UIControlStateNormal];
                [self.titleLabel setText:[NSString stringWithFormat:@"%d",seconds]];
                self.enabled = NO;
                self.isCounting = YES;
            });
        }
    });
    dispatch_resume(_timer);
}

@end
