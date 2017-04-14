//
//  Slash.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Slash.h"

@implementation Slash

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 10;
        _cooldown = 1;
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[Slash] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

@end
