//
//  InsideLineView.m
//  LineDemo
//
//  Created by Haven on 2018/11/13.
//  Copyright © 2018 Haven. All rights reserved.
//

#import "InsideLineView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height + 20

@implementation InsideLineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        tem = SCREEN_WIDTH/100;
        width = SCREEN_WIDTH;
        deviation = 350;
        count = 100;
        
        [NSTimer scheduledTimerWithTimeInterval:0.09f
                                         target:self
                                       selector:@selector(animation)
                                       userInfo:nil
                                        repeats:YES];
    }
    return self;
}

- (void)animation
{
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    ref=UIGraphicsGetCurrentContext();
    
    t = t+0.02;
    
    CGFloat redColor[4]={1.0,1,1,1.0};
    
    for (int i = 0; i < count; i ++) {
        
        double y1 = (480 / 2 - 10)*sin(2*M_PI*(1/width)*i*tem+t) + deviation;
        double y2 = (480 / 2 - 10)*sin(2*M_PI*(1/width)*(width / 2 + i * tem)+t) + deviation;
        
        double x1 = i * tem;
        
        double x2 = (width / 2 + i * tem);
        
        CGContextBeginPath(ref);
        CGContextMoveToPoint(ref,x1, y1);
        CGContextSetAlpha(ref, 0.3);
        CGContextAddLineToPoint(ref, x2, y2);
        
        CGContextSetStrokeColor(ref, redColor);
        CGContextStrokePath(ref);
        
        [self circleX:x1 Y:y1 Rad:1];
    }
    
    for (int i = 0; i < count; i ++) {
        
        double y1 = (480 / 2 - 10)*sin(2*M_PI*(1/width)*i*tem+t) + deviation;
        double y2 = (480 / 2 - 10)*sin(2*M_PI*(1/width)*((i + 1) * tem)+t) + deviation;
        
        double x1 = i * tem;
        
        double x2 = (i + 1) * tem;
        
        
        [self drawLineWithX:x1 Y:y1 X2:x2 Y2:y2];
    }
}

- (void)drawLineWithX:(float)x Y:(float)y X2:(float)x2 Y2:(float)y2
{
    CGContextBeginPath(ref);
    CGContextMoveToPoint(ref,x, y);
    CGContextAddLineToPoint(ref, x2, y2);
    CGContextStrokePath(ref);
}

- (void)circleX:(float)x Y:(float)y Rad:(float)rad
{
    CGContextBeginPath(ref);
    CGContextAddArc(ref, x, y, rad, 0, 2 * M_PI, 0);
    CGContextSetRGBFillColor (ref, 1, 0, 0, 1.0);
    CGContextStrokePath(ref);
    
}


@end
