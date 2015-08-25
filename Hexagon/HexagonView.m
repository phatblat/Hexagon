//
//  HexagonView.m
//  Hexagon
//
//  Created by Ben Chatelain on 11/26/13.
//  Copyright (c) 2014 Ben Chatelain
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "HexagonView.h"
#import <QuartzCore/QuartzCore.h>

@implementation HexagonView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.frame = self.bounds;

    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat hPadding = (self.padding?self.padding:0);

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
