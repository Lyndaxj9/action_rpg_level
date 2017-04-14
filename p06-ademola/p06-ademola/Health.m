//
//  Health.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Health.h"

@implementation Health

- (instancetype)init
{
    self = [super init];
    
    if (self){
        self.max = 100;
        self.current = self.max;
        //set to a positive non zero value for regeneration
        self.regeneration = 0;
    }
    
    return self;
}

//really needed if a regeneration effect is wanted
- (void)update:(NSTimeInterval)deltaTime
{
    self.current = MIN(self.max, self.current + (self.regeneration * deltaTime));
}

- (void)damageHealth:(float)damage
{
    NSLog(@"health damaged by: %f", damage);
    if(damage > 0){
        self.current = MAX(0, self.current - damage);
    } else {
        self.current = MIN(self.max, self.current - damage);
    }
    
}

- (void)setHealth:(float)health
{
    self.max = health;
    self.current = self.max;
}

- (float)getCurrentHealth
{
    return self.current;
}

- (float)getMaxHealth
{
    return self.max;
}

@end
