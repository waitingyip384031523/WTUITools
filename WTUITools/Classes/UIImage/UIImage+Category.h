//
//  UIImage+Category.h
//  ToMacao
//
//  Created by TaxiGoMac02 on 2017/2/15.
//  Copyright © 2017年 TaxiGoMac02. All rights reserved.
//

typedef enum : NSUInteger {
    GradientFromTopToBottom,
    GradientFromLeftToRight,
    GradientFromLeftTopToRightBottom,
    GradientFromLeftBottomToRightTop,
} GradientType;

@interface UIImage (Category)

- (UIImage *)changeImageColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)getImageWithColor:(UIColor*)color andSize:(CGSize)size;

- (UIImage *)imageWithRoundedCornersSize:(CGFloat)cornerRadius;
- (UIImage *)lineWithRoundedCornersSize:(CGFloat)cornerRadius;

- (UIImage *)imageWithShadowColor:(UIColor *)shadowColor
                     shadowOffset:(CGSize)shadowOffset
                       shadowBlur:(CGFloat)shadowBlur;

+ (UIImage *)getImageWithColor:(UIColor *)color
                       andSize:(CGSize)size
                        corner:(CGFloat)cornerRadius
                   borderColor:(UIColor *)boarderColor
                   borderWidth:(CGFloat)borderWidth;
- (UIImage *)getBoarderImg:(CGSize)size
                    corner:(CGFloat)cornerRadius
               borderColor:(UIColor *)boarderColor
               borderWidth:(CGFloat)borderWidth;

+ (UIImage *)getTopCapMaskImageRadius:(CGFloat)cornerRadius color:(UIColor *)color andSize:(CGSize)size;
+ (UIImage *)clipBottomLeftRadius:(CGFloat)radius
                            color:(UIColor *)color
                             size:(CGSize)size;
+ (UIImage *)getRoundImageRadius:(CGFloat)cornerRadius color:(UIColor *)color andSize:(CGSize)size;
+ (UIImage *)getRightCapRadius:(CGFloat)radius
                         color:(UIColor *)color
                          size:(CGSize)size;
- (UIImage *)getTopTriangleImg;
- (UIImage *)getRightCapRadius:(CGFloat)radius size:(CGSize)size;
- (UIImage *)getLeftCapRadius:(CGFloat)radius size:(CGSize)size;

- (UIImage *)clipImgInRect:(CGRect)rect;

- (UIImage *)scaleWithScaleSize:(float)scaleSize;

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

+ (UIImage *)snapshot:(UIView *)view;
+ (UIImage *)snapshot:(UIView *)view inRect:(CGRect)rect;

- (UIImage*)getSubImage:(CGRect)rect;

- (UIImage *)cutCenterSquareImageTrans:(CGAffineTransform)transform;

+ (UIImage *)normalSnapshotImage;

+ (UIImage*) imageBlackToTransparent:(UIImage*) image color:(UIColor *)color;

+ (UIImage *)circleImageNamed:(NSString *)name;
- (UIImage *)circleImage;
- (UIImage *)circleImageWithSize:(CGSize)size;

- (UIImage *)fixOrientation;

- (UIImage*)fixOrietationWithScale:(CGFloat)scale;
- (UIImage *)generatePhotoThumbnail:(UIImage *)image;
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize;
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

+ (UIImage *) getVideoPreViewImage:(NSURL *)path;
+ (UIImage *) imageCompressForWidthScale:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
+ (UIImage *) imageCompressFitSizeScale:(UIImage *)sourceImage targetSize:(CGSize)size;
- (UIImage *)changeImageColor:(UIColor *)color;
+ (CGSize)getImageSizeWithURL:(id)URL;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage*)rotate:(UIImageOrientation)orient;
// 创建一张渐变色图片
+ (UIImage *)createImageSize:(CGSize)imageSize
              gradientColors:(NSArray *)colors
                  percentage:(NSArray *)percents
                gradientType:(GradientType)gradientType;
+ (UIImage *)createImageSize:(CGSize)imageSize
              gradientColors:(NSArray *)colors
                  percentage:(NSArray *)percents
                  startPoint:(CGPoint)startPoint
                    endPoint:(CGPoint)endPoint;
+ (UIImage *)createImageSize:(CGSize)imageSize
              gradientColors:(NSArray *)colors
                  percentage:(NSArray *)percents
                  startPoint:(CGPoint)startPoint
                    endPoint:(CGPoint)endPoint
                      opaque:(BOOL)opaque;
- (UIImage *)capImgCorner:(CGFloat)cornerRadius
                   corner:(UIRectCorner)corner;
+ (UIImage *)bundleImageNamed:(NSString *)name inObject:(id)object;

@end
