#import <Foundation/Foundation.h>
#import "EllipseView.h"
#import "EllipseViewManager.h"

#import <React/RCTBridge.h>

@implementation EllipseViewManager

@synthesize bridge = _bridge;

RCT_EXPORT_VIEW_PROPERTY(backgroundColorParam, NSString)
RCT_EXPORT_VIEW_PROPERTY(borderColorParam, NSString)
RCT_EXPORT_VIEW_PROPERTY(borderStyleParam, NSString)
RCT_EXPORT_VIEW_PROPERTY(borderWidthParam, double);
RCT_EXPORT_VIEW_PROPERTY(coeffParam, double);

RCT_EXPORT_MODULE();

- (UIView *)view
{
    EllipseView *ellipseView = [[EllipseView alloc] init];
    return ellipseView;
}


@end
