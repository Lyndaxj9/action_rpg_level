//
//  Heal.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Heal.h"

@implementation Heal

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = -15;
        _cooldown = 7;
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[Heal] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

@end
