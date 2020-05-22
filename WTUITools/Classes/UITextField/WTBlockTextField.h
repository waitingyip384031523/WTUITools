//
//  WTBlockTextField.h
//  EliteShow
//
//  Created by Elite Show on 2018/10/5.
//  Copyright © 2018 Elite Show. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTBlockTextField;

typedef BOOL(^textFieldShouldBeginEdit)(void);

@interface WTBlockTextField : UITextField

@property (nonatomic, copy  ) textFieldShouldBeginEdit  beginEditBlock;

@end
