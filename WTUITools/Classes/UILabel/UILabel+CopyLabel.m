//
//  UILabel+CopyLabel.m
//  EliteShow
//
//  Created by Waiting.Y on 2019/5/31.
//  Copyright © 2019年 Elite Show. All rights reserved.
//

#import "UILabel+CopyLabel.h"
#import <objc/runtime.h>

@implementation UILabel (CopyLabel)

- (BOOL)copyable
{
    return [objc_getAssociatedObject(self, @selector(copyable)) boolValue];
}

- (void)setCopyable:(BOOL)copyable
{
    self.userInteractionEnabled = copyable;
    objc_setAssociatedObject(self, @selector(copyable), [NSNumber numberWithBool:copyable], OBJC_ASSOCIATION_ASSIGN);
    if (copyable) {
        [self addLongPress];
    }
}

#pragma mark - 添加长按手势
- (void)addLongPress
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longP];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillHide) name:UIMenuControllerWillHideMenuNotification object:nil];
}

- (void)longPress:(UILongPressGestureRecognizer *)longP
{
    if (longP.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuItem *copyItm = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyAction)];
        [[UIMenuController sharedMenuController] setMenuItems:@[copyItm]];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

#pragma mark - 菜单消失
- (void)menuWillHide
{
    [self resignFirstResponder];
    self.backgroundColor = [UIColor clearColor];
}

- (BOOL)canBecomeFirstResponder
{
    return [objc_getAssociatedObject(self, @selector(copyable)) boolValue];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copyAction)) {
        return YES;
    }
    return NO;
}

- (void)copyAction
{
    [self resignFirstResponder];
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    if (self.text.length) {
        pasteBoard.string = self.text;
    }else{
        pasteBoard.string = self.attributedText.string;
    }
    self.backgroundColor = [UIColor clearColor];
}

- (void)dealloc
{
    [self resignFirstResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
}

@end
