//
//  HealthBar.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Health.h"

//HealthBar code from:
//https://www.youtube.com/watch?v=t_xPMTGkpd0&index=1&list=PLSu4oD8fW_f0CWidT67OiFim-Qk6kEhVc
@interface HealthBar : SKNode

@property (nonatomic) SKShapeNode *outline;
@property (nonatomic) SKShapeNode *fill;
@property (nonatomic) float barWidth, barHeight;

- (instancetype) initWithWidth:(float)width andHeight:(float)height;
- (void) updateWithHealth:(Health *) health;
@end
