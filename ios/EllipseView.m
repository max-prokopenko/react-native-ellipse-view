#import <Foundation/Foundation.h>
#import "EllipseView.h"
#import "React/RCTEventDispatcher.h"


@implementation EllipseView : UIView  {
    
    RCTEventDispatcher *_eventDispatcher;
    CAShapeLayer *mask;
    UIBezierPath *path;
    UIView *maskView;
    
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

    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
        [super drawRect:rect];
        
        CGFloat w = rect.size.width; 
        CGFloat h = rect.size.height; 

        CGPoint last = CGPointMake(rect.origin.x, rect.origin.y + h * 0.5);
        [path moveToPoint:CGPointMake(last.x, last.y)];

        // LEFT/TOP curve 
        [path addCurveToPoint:CGPointMake(last.x + w * 0.5, last.y - (h * 0.5))
                controlPoint1:CGPointMake(last.x, last.y - (h * 0.5 - h * 0.04))
            controlPoint2:CGPointMake(last.x + w * 0.25, last.y - h * 0.5)];

        // TOP/RIGHT curve
        last = CGPointMake(last.x + w * 0.5, last.y - (h * 0.5));
        [path addCurveToPoint:CGPointMake(last.x + w * 0.5, last.y + h * 0.5)
                controlPoint1:CGPointMake(last.x + w * 0.25, last.y)
            controlPoint2:CGPointMake(last.x + w * 0.5, last.y + h * 0.04)];

         // RIGHT/BOTTOM curve
        last = CGPointMake(last.x + w * 0.5, last.y + (h * 0.5));
        [path addCurveToPoint:CGPointMake(last.x - w * 0.5, last.y + h * 0.5)
                controlPoint1:CGPointMake(last.x, last.y + (h * 0.5 - h * 0.04))
            controlPoint2:CGPointMake(last.x - w * 0.25, last.y + h * 0.5)];

         // BOTTOM/LEFT curve
        last = CGPointMake(last.x - w * 0.5, last.y + (h * 0.5));
        [path addCurveToPoint:CGPointMake(last.x - w * 0.5, last.y - h * 0.5)
                controlPoint1:CGPointMake(last.x - w * 0.25, last.y)
            controlPoint2:CGPointMake(last.x - w * 0.5, last.y - h * 0.04)];

    [path closePath];
    // !edit path
    mask.path = path.CGPath;
}


@end