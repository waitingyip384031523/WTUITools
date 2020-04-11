/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import "UIViewExt.h"

#define CORNER_RADIUS 5

CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

void DrawTopCapLine(CGRect rect, CGFloat cornerRadius, CGFloat lineW, UIColor *color)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, 0, cornerRadius);
    CGContextAddQuadCurveToPoint(context, 0, 0, cornerRadius, 0);
    CGContextAddLineToPoint(context, rect.size.width - cornerRadius, 0);
    CGContextAddQuadCurveToPoint(context, rect.size.width, 0, rect.size.width, cornerRadius);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextSetLineWidth(context, lineW);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
}

void DrawBottomCapLine(CGRect rect, CGFloat cornerRadius, CGFloat lineW, UIColor *color)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, rect.size.height - cornerRadius);
    CGContextAddQuadCurveToPoint(context, 0, rect.size.height, cornerRadius, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width - cornerRadius, rect.size.height);
    CGContextAddQuadCurveToPoint(context, rect.size.width, rect.size.height, rect.size.width, rect.size.height - cornerRadius);
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextSetLineWidth(context, lineW);
    [color setStroke];
    CGContextStrokePath(context);
}

void DrawLeftRightLine(CGRect rect, CGFloat lineW, UIColor *color)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextMoveToPoint(context, rect.size.width, 0);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextSetLineWidth(context, lineW);
    [color setStroke];
    CGContextStrokePath(context);
}

void DrawRightLine(CGRect rect, CGFloat lineW, UIColor *color)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, rect.size.width, 0);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextSetLineWidth(context, lineW);
    [color setStroke];
    CGContextStrokePath(context);
}

void DrawLeftLine(CGRect rect, CGFloat lineW, UIColor *color)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextSetLineWidth(context, lineW);
    [color setStroke];
    CGContextStrokePath(context);
}

void DrawLineCap(CGLineCap lineCap,CGFloat lineWidth, UIColor *lineColor, CGPoint startPoint, CGPoint endPoint,CGFloat *length)
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(context, lineCap);
    // 绘制线的宽度
    CGContextSetLineWidth(context, lineWidth);
    // 线的颜色
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    // 开始绘制
    CGContextBeginPath(context);
    // 设置虚线绘制起点
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    // 虚线的起始点
    CGContextSetLineDash(context, 0, length,2);
    // 绘制虚线的终点
    CGContextAddLineToPoint(context, endPoint.x,endPoint.y);
    // 绘制
    CGContextStrokePath(context);
    // 关闭图像
    CGContextClosePath(context);
}

@implementation UIView (ViewGeometry)

// Retrieve and set the origin
- (CGPoint) origin
{
	return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
	CGRect newframe = self.frame;
	newframe.origin = aPoint;
	self.frame = newframe;
}


// Retrieve and set the size
- (CGSize) size
{
	return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
	CGRect newframe = self.frame;
	newframe.size = aSize;
	self.frame = newframe;
}

// Query other frame locations
- (CGPoint) bottomRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
	CGFloat x = self.frame.origin.x;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) topRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y;
	return CGPointMake(x, y);
}


// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) height
{
	return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
	CGRect newframe = self.frame;
	newframe.size.height = newheight;
	self.frame = newframe;
}

- (CGFloat) width
{
	return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
	CGRect newframe = self.frame;
	newframe.size.width = newwidth;
	self.frame = newframe;
}

- (CGFloat) top
{
	return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
	CGRect newframe = self.frame;
	newframe.origin.y = newtop;
	self.frame = newframe;
}

- (CGFloat) left
{
	return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
	CGRect newframe = self.frame;
	newframe.origin.x = newleft;
	self.frame = newframe;
}

- (CGFloat) bottom
{
	return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
	CGRect newframe = self.frame;
	newframe.origin.y = newbottom - self.frame.size.height;
	self.frame = newframe;
}

- (CGFloat) right
{
	return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
	CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
	CGRect newframe = self.frame;
	newframe.origin.x += delta ;
	self.frame = newframe;
}

// Move via offset
- (void) moveBy: (CGPoint) delta
{
	CGPoint newcenter = self.center;
	newcenter.x += delta.x;
	newcenter.y += delta.y;
	self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
	CGRect newframe = self.frame;
	newframe.size.width *= scaleFactor;
	newframe.size.height *= scaleFactor;
	self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
	CGFloat scale;
	CGRect newframe = self.frame;
	
	if (newframe.size.height && (newframe.size.height > aSize.height))
	{
		scale = aSize.height / newframe.size.height;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	if (newframe.size.width && (newframe.size.width >= aSize.width))
	{
		scale = aSize.width / newframe.size.width;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	self.frame = newframe;	
}

- (id)findSuperViewWithSuperViewClass:(Class)clazz
{
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview findSuperViewWithSuperViewClass:clazz];
    }
}

-(void)addTopBorderWithColor:(UIColor *)color
                    andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

-(void)addBottomBorderWithColor:(UIColor *)color
                       andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer]; border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

-(void)addLeftBorderWithColor:(UIColor *)color
                     andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer]; border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

-(void)addRightBorderWithColor:(UIColor *)color
                      andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer]; border.backgroundColor = color.CGColor;
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)clipWithCorner:(UIRectCorner)corner andRadius:(CGFloat)radius strokeColor:(UIColor *)strokeColor
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = self.bounds;
    shape.path = path.CGPath;
    self.layer.mask = shape;
}

- (CAShapeLayer *)drawWithPath:(UIBezierPath *)path
{
    CAShapeLayer *borderLayer=[CAShapeLayer layer];
    borderLayer.path    =   path.CGPath;
    borderLayer.fillColor  = [UIColor clearColor].CGColor;
    borderLayer.frame = self.bounds;
    [self.layer addSublayer:borderLayer];
    return borderLayer;
}

- (CAShapeLayer *)drawTopCapWithCorner:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    return [self drawWithPath:path];
}

- (CAShapeLayer *)drawBottomCapWithCorner:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    return [self drawWithPath:path];
}

- (CAShapeLayer *)drawLeftCapWithCorner:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(radius, radius)];
    return [self drawWithPath:path];
}

+ (void)keyBoardAnimation:(void (^)(void))action
{
    [UIView beginAnimations:nil context:nil];
    if (action) {
        action();
    }
    [UIView setAnimationCurve:7];
    [UIView setAnimationDuration:.25f];
    [UIView commitAnimations];
}

- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view
                                   fromColor:(UIColor *)fColor
                                     toColor:(UIColor *)tColor{
    
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)fColor.CGColor,(__bridge id)tColor.CGColor];
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}

@end
