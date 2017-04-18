//
//  MagicBlast.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "MagicBlast.h"

@implementation MagicBlast
@synthesize attackName;
@synthesize cooldown, timePassed;

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 10;
        cooldown = 2;
        timePassed = cooldown;
        attackName = @"magicblast";
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[MagicBlast] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

- (BOOL)skillReady
{
    return (timePassed >= cooldown);
}

@end
