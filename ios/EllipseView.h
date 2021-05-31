#import <UIKit/UIKit.h>

@class RCTEventDispatcher;

@interface EllipseView : UIView

- (instancetype)initWithFrame:(CGRect)frame
NS_DESIGNATED_INITIALIZER;

- (UIColor *)colorFromHexString:(NSString *)hexString;

- (void) setBorderWidthParam:(double)borderWidth;

- (void) setBorderColorParam:(NSString *)borderColor;

- (void) setBackgroundColorParam:(NSString *)backgroundColor;

- (void) setBorderStyleParam:(NSString *)borderStyle;

@end
