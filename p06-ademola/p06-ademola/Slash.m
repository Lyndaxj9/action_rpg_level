//
//  Slash.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Slash.h"

@implementation Slash
@synthesize attackName;
@synthesize cooldown, timePassed;

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 20; //prev: 10
        cooldown = 1.5;
        timePassed = cooldown;
        attackName = @"slash";
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[Slash] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

- (BOOL)skillReady
{
    return (timePassed >= cooldown);
}

@end
