//
//  SelectNormal.h
//  TaxiGo
//
//  Created by 叶威廷 on 2017/5/12.
//  Copyright © 2017年 studio sans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectNormalButton : UIButton

- (instancetype)initWithNormalImage:(UIImage *)normalImage
                     andSelectImage:(UIImage *)selectImage
                      andButtonType:(UIButtonType)type;

@end
