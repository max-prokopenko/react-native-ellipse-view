#import <Foundation/Foundation.h>
#import "EllipseView.h"
#import "React/RCTEventDispatcher.h"
#import "React/RCTLog.h"

@implementation EllipseView  {
    
    RCTEventDispatcher *_eventDispatcher;
    CAShapeLayer *mask;
    UIBezierPath *path;
    CAShapeLayer *borderLayer;
    
    UIView *maskView;
    UIView *borderView;
    
    CGFloat coeff;
    NSArray *values;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {

        mask = [[CAShapeLayer alloc] init];
        mask.frame = frame;
        path = [[UIBezierPath alloc] init];
        mask.fillColor = [UIColor blackColor].CGColor;
        self.layer.opaque = false;
        
        // set mask layer
        maskView = [[UIView alloc] init];
        [maskView.layer addSublayer:mask];
        self.maskView = maskView;
        
        // // border
        borderView = [[UIView alloc] init];
        borderLayer = [[CAShapeLayer alloc] init];
        borderLayer.fillColor = nil;
        borderLayer.frame = frame;
        [borderView.layer addSublayer:borderLayer];
        [self addSubview:borderView];

    }
    
    return self;
}
- (void)didAddSubview:(UIView *)subview {
    [self bringSubviewToFront:borderView];
}
- (void)drawRect:(CGRect)rect {
        [super drawRect:rect];
        
        CGFloat w = rect.size.width; 
        CGFloat h = rect.size.height; 

        CGPoint last = CGPointMake(rect.origin.x, rect.origin.y + h * 0.5);
        [path moveToPoint:CGPointMake(last.x, last.y)];

        // LEFT/TOP curve 
        [path addCurveToPoint:CGPointMake(last.x + w * 0.5, last.y - (h * 0.5))
                controlPoint1:CGPointMake(last.x, last.y - (h * 0.345))
            controlPoint2:CGPointMake(last.x + w * 0.155, last.y - h * 0.5)];

        // TOP/RIGHT curve
        last = CGPointMake(last.x + w * 0.5, last.y - (h * 0.5));
        [path addCurveToPoint:CGPointMake(last.x + w * 0.5, last.y + h * 0.5)
                controlPoint1:CGPointMake(last.x + w * 0.345, last.y)
            controlPoint2:CGPointMake(last.x + w * 0.5, last.y + h * 0.155)];

         // RIGHT/BOTTOM curve
        last = CGPointMake(last.x + w * 0.5, last.y + (h * 0.5));
        [path addCurveToPoint:CGPointMake(last.x - w * 0.5, last.y + h * 0.5)
                controlPoint1:CGPointMake(last.x, last.y + (h * 0.345))
            controlPoint2:CGPointMake(last.x - w * 0.155, last.y + h * 0.5)];

         // BOTTOM/LEFT curve
        last = CGPointMake(last.x - w * 0.5, last.y + (h * 0.5));
        [path addCurveToPoint:CGPointMake(last.x - w * 0.5, last.y - h * 0.5)
                controlPoint1:CGPointMake(last.x - w * 0.345, last.y)
            controlPoint2:CGPointMake(last.x - w * 0.5, last.y - h * 0.155)];

    [path closePath];

    // !edit path
    mask.path = path.CGPath;
    borderLayer.path = path.CGPath;

    
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    if (hexString != nil) {
        unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:hexString];
        [scanner setScanLocation:1]; // bypass '#' character
        [scanner scanHexInt:&rgbValue];
        return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    } else {
        return [UIColor clearColor];
    }
}

- (void) setBorderWidthParam:(double)borderWidth {
    borderLayer.lineWidth = borderWidth;
    mask.lineWidth = borderWidth;
}

- (void) setBorderStyleParam:(NSString *)borderStyle {
    if ([borderStyle isEqualToString:@"dashed"]) {
        borderLayer.lineDashPattern = @[@5, @5];
    }
}

- (void) setBorderColorParam:(NSString *)borderColor {
    borderLayer.strokeColor = [self colorFromHexString:borderColor].CGColor;    
}

- (void) setBackgroundColorParam:(NSString *)backgroundColor {
    self.backgroundColor = [self colorFromHexString:backgroundColor];
}



@end
