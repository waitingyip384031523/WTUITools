//
//  WTTextField.h
//  EliteShow
//
//  Created by Elite Show on 2018/10/16.
//  Copyright © 2018 Elite Show. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textFieldDidEndEdit)(void);
typedef void(^textFieldDidChange)(NSString *text);
typedef BOOL(^textFieldShouldBeginEdit)(void);
typedef BOOL(^textFieldShouldReturn)(void);
typedef void(^textFieldOverText)(void);

@interface WTDisableEmojiTextField : UITextField

@property (nonatomic, copy  ) textFieldDidEndEdit         tfDidEndEdit;
@property (nonatomic, copy  ) textFieldDidChange          tfDidChange;
@property (nonatomic, copy  ) textFieldShouldBeginEdit    tfShouldBeginEdit;
@property (nonatomic, copy  ) textFieldShouldReturn       tfShouldReturn;
@property (nonatomic, copy  ) textFieldOverText           tfOverText;
@property (nonatomic, strong) UIButton                    *clearBtn;
@property (nonatomic, assign) BOOL                        noChinese;
@property (nonatomic, assign) BOOL                        emoji;
@property (nonatomic, assign) BOOL                        showClearBtn;
@property (nonatomic, assign) BOOL                        isEmail;
@property (nonatomic, assign) BOOL                        isWechat;
@property (nonatomic, assign) BOOL                        isPhone;
@property (nonatomic, assign) BOOL                        noDot;
@property (nonatomic, assign) BOOL                        noSp;
@property (nonatomic, assign) BOOL                        isPure;
@property (nonatomic, assign) BOOL                        haveBlank;
@property (nonatomic, assign) NSInteger                   maxTextLength;

@end
