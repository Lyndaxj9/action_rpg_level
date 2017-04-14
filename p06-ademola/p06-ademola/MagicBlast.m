//
//  MagicBlast.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "MagicBlast.h"

@implementation MagicBlast

- (id)init
{
    self = [super init];
    
    if(self){
        _minDamage = 10;
        _cooldown = 5;
    }
    
    return self;
}

- (void)execute:(Entity*)a_target
{
    NSLog(@"[MagicBlast] execute:(Entity*) called");
    [a_target takeDamage:_minDamage];
}

@end
