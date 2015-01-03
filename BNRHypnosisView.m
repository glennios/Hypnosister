//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Glenn on 12/30/14.
//  Copyright (c) 2014 Glenn. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    self.backgroundColor = [UIColor clearColor];
    self.circleColor     = [UIColor lightGrayColor];
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds; // get your own view's bounds
    float radius  = hypot(bounds.size.width, bounds.size.height) / 2.0;

    // determine center coord
    CGPoint center;
    center.x      = bounds.origin.x + bounds.size.width  / 2.0;
    center.y      = bounds.origin.y + bounds.size.height / 2.0;

    // render pathstroke
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 10;

    for (; radius > 0; radius -= 20) {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center radius:radius startAngle:0 endAngle:(2.0*M_PI) clockwise:YES];
    }

    [self.circleColor setStroke];
    [path stroke];

    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [self drawLogo:currentContext];
}

- (void)drawLogo:(CGContextRef)currentContext {
    [self startShadow:currentContext];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(0, 0, 380, 561)];
    
    [self stopShadow:currentContext];
}

- (void)startShadow:(CGContextRef)currentContext {
    int    blurSz     = 3;
    CGSize blurOffset = CGSizeMake(4, 7);
    
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, blurOffset, blurSz);
}

- (void)stopShadow:(CGContextRef)currentContext {
    CGContextRestoreGState(currentContext);
}

@end
