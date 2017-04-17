//
//  HealthBar.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "HealthBar.h"

@implementation HealthBar

- (instancetype)initWithWidth:(float)width andHeight:(float)height
{
    self = [super init];
    
    if(self){
        self.barWidth = width;
        self.barHeight = height;
        
        CGSize size = CGSizeMake(width, height);
        
        self.outline = [SKShapeNode shapeNodeWithRectOfSize:size];
        self.outline.lineWidth = height / 8.0;
        self.outline.fillColor = [UIColor clearColor];
        self.outline.strokeColor = [UIColor blackColor];
        self.outline.zPosition = 2;
        [self addChild:self.outline];
        
        self.fill = [SKShapeNode shapeNodeWithRectOfSize:size];
        self.fill.lineWidth = 0;
        self.fill.zPosition = self.outline.zPosition - 1;
        [self addChild:self.fill];
    }
    
    return self;
}

- (void)updateWithHealth:(Health *)health
{
    float healthProportion = (health.current/health.max);
    float fillWidth = (healthProportion * self.barWidth) - self.outline.lineWidth + 1;
    CGRect fillRect = CGRectMake(-fillWidth/2.0, -self.barHeight/2.0, fillWidth,self.barHeight);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:fillRect];
    self.fill.path = path.CGPath;
    self.fill.position = CGPointMake(-((self.outline.frame.size.width - self.fill.frame.size.width) /2.0) + self.outline.lineWidth, 0);
    
    //code to change color once health is at a certain level
    self.fill.fillColor = [UIColor redColor];
}

@end
