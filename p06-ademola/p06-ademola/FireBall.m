//
//  FireBall.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "FireBall.h"

@implementation FireBall
@synthesize attackName;

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 12;
        _cooldown = 7;
        attackName = @"fireball";
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[FireBall] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

@end
