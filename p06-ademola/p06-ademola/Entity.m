//
//  Entity.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Entity.h"

@implementation Entity

@synthesize timePassed, attackSpeed;
@synthesize usedSkill;

- (instancetype)init
{
    self = [super init];
    
    if(self){
        _defense = .1;
        _health = [[Health alloc] init];
        timePassed = 0;
        attackSpeed = 2;
        usedSkill = @"";
    }
    
    return self;
}

- (void)takeDamage:(float)damageAmnt
{
    //NSLog(@"takeDamage:(float) called");
    [_health damageHealth:(damageAmnt*(1-_defense))];
}

- (Health *)getHealth
{
    return _health;
}

- (void)useSKill:(id<BasicSkill>)basicSkill On:(Entity *)target
{
    //if i had attributes like intellect, attack dmg and stuff
    //I would do calculations here to see how much attack damage to
    //actually do
    
    //NSLog(@"useSKill called");
    usedSkill = [basicSkill attackName];
    [basicSkill execute:target];
}

@end
