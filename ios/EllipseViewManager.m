#import <Foundation/Foundation.h>
#import "EllipseView.h"
#import "EllipseViewManager.h"

#import <React/RCTBridge.h>

@implementation EllipseViewManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

- (UIView *)view
{
    return [[EllipseView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(topLeft, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(topRight, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(bottomRight, CGFloat)
RCT_EXPORT_VIEW_PROPERTY(bottomLeft, CGFloat)

@end