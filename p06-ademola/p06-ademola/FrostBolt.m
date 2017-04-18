//
//  FrostBolt.m
//  p06-ademola
//
//  Created by Lynda on 4/16/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "FrostBolt.h"

@implementation FrostBolt
@synthesize attackName;
@synthesize cooldown, timePassed;

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 13;
        cooldown = 1.5;
        timePassed = cooldown;
        attackName = @"frostbolt";
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[FrostBolt] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

- (BOOL)skillReady
{
    return (timePassed >= cooldown);
}

@end
