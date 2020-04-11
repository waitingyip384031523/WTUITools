/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);
void DrawTopCapLine(CGRect rect, CGFloat cornerRadius, CGFloat lineW, UIColor *color);
void DrawBottomCapLine(CGRect rect, CGFloat cornerRadius, CGFloat lineW, UIColor *color);
void DrawLeftRightLine(CGRect rect, CGFloat lineW, UIColor *color);
void DrawRightLine(CGRect rect, CGFloat lineW, UIColor *color);
void DrawLeftLine(CGRect rect, CGFloat lineW, UIColor *color);
void DrawLineCap(CGLineCap lineCap,CGFloat lineWidth, UIColor *lineColor, CGPoint startPoint, CGPoint endPoint,CGFloat *length);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
- (id)findSuperViewWithSuperViewClass:(Class)clazz;

-(void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
-(void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)clipWithCorner:(UIRectCorner)corner andRadius:(CGFloat)radius strokeColor:(UIColor *)strokeColor;
- (CAShapeLayer *)drawTopCapWithCorner:(CGFloat)radius;
- (CAShapeLayer *)drawBottomCapWithCorner:(CGFloat)radius;
- (CAShapeLayer *)drawLeftCapWithCorner:(CGFloat)radius;

+ (void)keyBoardAnimation:(void(^)(void))action;

- (UIViewController *)parentController;
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view
                                   fromColor:(UIColor *)fColor
                                     toColor:(UIColor *)tColor;

@end
