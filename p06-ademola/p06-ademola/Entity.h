//
//  Entity.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Health.h"
#import "BasicSkill.h"
@protocol BasicSkill;

@interface Entity : NSObject

@property (nonatomic) Health *health;
//a value between 0 and 1
//if 1 blocks out all damage if 0 takes all damage
@property (nonatomic) float defense;
@property (nonatomic) double attackSpeed, timePassed;
@property (nonatomic) NSString *usedSkill;

- (instancetype) init;
- (void)takeDamage:(float)damageAmnt;
- (Health *)getHealth;
- (void)useSKill:(id<BasicSkill>)basicSkill On:(Entity *)target;

@end
