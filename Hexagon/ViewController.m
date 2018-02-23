//
//  ViewController.m
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

#import "ViewController.h"
#import "HexagonView.h"

@interface ViewController ()

@property (strong, nonatomic, nonnull) IBOutlet HexagonView *hexagon;
@property (strong, nonatomic, nonnull) IBOutlet NSLayoutConstraint *width;
@property (strong, nonatomic, nonnull) IBOutlet NSLayoutConstraint *aspectRatio;
@property (strong, nonatomic, nonnull) IBOutlet UISlider *slider;
@property (assign, nonatomic) NSNumber *baseWidth;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.slider.value = 1.0;
    self.baseWidth = @(self.width.constant);
    NSLog(@"baseWidth: %@", self.baseWidth);
}

- (IBAction)sliderMoved:(UISlider *)sender
{
    NSLog(@"Slider value: %f", sender.value);
    self.width.constant = self.baseWidth.floatValue * sender.value;
    [self.hexagon redraw];
}

@end
