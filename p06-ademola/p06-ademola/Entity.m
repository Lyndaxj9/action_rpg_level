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
@synthesize usedSkill, death;

- (instancetype)init
{
    self = [super init];
    
    if(self){
        _defense = .1;
        _health = [[Health alloc] init];
        timePassed = 0;
        attackSpeed = .5;
        usedSkill = @"";
        death = FALSE;
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
    if([basicSkill skillReady]){
        usedSkill = [basicSkill attackName];
        [basicSkill execute:target];
        [basicSkill setTimePassed:0.0];
    } else {
        NSLog(@"%@ on cooldown", [basicSkill attackName]);
    }
}

- (void)setAttackSpeed:(double)speed
{
    attackSpeed = speed;
}

@end
