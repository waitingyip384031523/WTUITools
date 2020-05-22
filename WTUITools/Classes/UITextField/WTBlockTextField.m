//
//  WTBlockTextField.m
//  EliteShow
//
//  Created by Elite Show on 2018/10/5.
//  Copyright © 2018 Elite Show. All rights reserved.
//

#import "WTBlockTextField.h"

@interface WTBlockTextField()<UITextFieldDelegate>

@end

@implementation WTBlockTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (self.beginEditBlock) {
        return self.beginEditBlock();
    }
    return YES;
}

@end
