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

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 13;
        _cooldown = 2.5;
        _timePassed = _cooldown;
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
    return (_timePassed >= _cooldown);
}

@end
