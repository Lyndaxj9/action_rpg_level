//
//  Health.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//
//Health code from
//https://www.youtube.com/watch?v=t_xPMTGkpd0&index=1&list=PLSu4oD8fW_f0CWidT67OiFim-Qk6kEhVc
#import <Foundation/Foundation.h>

@interface Health : NSObject

@property (nonatomic) float current, max, regeneration;

- (instancetype) init;
- (void) update:(NSTimeInterval) deltaTime;
- (void) damageHealth:(float) damage;
- (void) setHealth:(float) health;
- (float)getCurrentHealth;
- (float)getMaxHealth;
@end
