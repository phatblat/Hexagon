//
//  HexagonView.m
//  Hexagon
//
//  Created by Ben Chatelain (KP) on 11/26/13.
//
//

#import "HexagonView.h"
#import <QuartzCore/QuartzCore.h>

@implementation HexagonView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self configureLayerForHexagon];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    if ((self = [super initWithCoder:coder])) {
        [self configureLayerForHexagon];
    }
    return self;
}

- (void)configureLayerForHexagon
{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.frame = self.bounds;

    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat hPadding = width * 1 / 8 / 2;

    UIGraphicsBeginImageContext(self.frame.size);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(width/2, 0)];
    [path addLineToPoint:CGPointMake(width - hPadding, height / 4)];
    [path addLineToPoint:CGPointMake(width - hPadding, height * 3 / 4)];
    [path addLineToPoint:CGPointMake(width / 2, height)];
    [path addLineToPoint:CGPointMake(hPadding, height * 3 / 4)];
    [path addLineToPoint:CGPointMake(hPadding, height / 4)];
    [path closePath];
    [path fill];
    maskLayer.path = path.CGPath;
    UIGraphicsEndImageContext();
    self.layer.mask = maskLayer;
}

@end
