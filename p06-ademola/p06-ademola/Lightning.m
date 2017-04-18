//
//  Lightning.m
//  p06-ademola
//
//  Created by Lynda on 4/16/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Lightning.h"

@implementation Lightning
@synthesize attackName;

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 15;
        _cooldown = 2.75;
        _timePassed = _cooldown;
        attackName = @"lightning";
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[Lightning] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

- (BOOL)skillReady
{
    return (_timePassed >= _cooldown);
}

@end
