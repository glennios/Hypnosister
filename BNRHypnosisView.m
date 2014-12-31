//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Glenn on 12/30/14.
//  Copyright (c) 2014 Glenn. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    self.backgroundColor = [UIColor clearColor];
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds; // get your own view's bounds
    float radius  = MIN(bounds.size.width, bounds.size.height) / 2.0;

    // determine center coord
    CGPoint center;
    center.x      = bounds.origin.x + bounds.size.width  / 2.0;
    center.y      = bounds.origin.y + bounds.size.height / 2.0;

    // render pathstroke
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 10;
    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:(2.0*M_PI) clockwise:YES];
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
}

@end
