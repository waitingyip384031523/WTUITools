//
//  WTTextView.h
//  EliteShow
//
//  Created by Elite Show on 2018/10/16.
//  Copyright © 2018 Elite Show. All rights reserved.
//

#import "IQTextView.h"

NS_ASSUME_NONNULL_BEGIN

@class WTDisableEmojiTextView;

typedef void(^textViewDidChange)(NSInteger length);

@interface WTDisableEmojiTextViewDelegate:NSObject<UITextViewDelegate>

@property (nonatomic, weak) WTDisableEmojiTextView *tv;

@end

@interface WTDisableEmojiTextView : IQTextView

@property (nonatomic, copy  ) textViewDidChange tvDidChange;
@property (nonatomic, assign) NSInteger         length;
@property (nonatomic, assign) BOOL              entryEmoji;
@property (nonatomic, strong) WTDisableEmojiTextViewDelegate *eDelegate;

- (BOOL)getEnable;

@end

NS_ASSUME_NONNULL_END
