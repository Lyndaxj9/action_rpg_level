//
//  Combat.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Health.h"
#import "Entity.h"
#import "BasicSkill.h"
#import "MagicBlast.h"
#import "FireBall.h"
#import "FrostBolt.h"
#import "Lightning.h"
#import "Heal.h"
#import "Slash.h"

@interface Combat : NSObject
@property (nonatomic) Entity *enemy, *player;
@property (nonatomic) Health *eH, *pH;
@property (nonatomic) MagicBlast *mb;
@property (nonatomic) FireBall *fb;
@property (nonatomic) FrostBolt *ib;
@property (nonatomic) Lightning *lg;
@property (nonatomic) Heal *heal;
@property (nonatomic) Slash *slash;


@property (nonatomic) double attackSpeed;
@property (nonatomic) double timePassed;
@property (nonatomic) BOOL gameOver, enemyDeath, playerDeath;

- (instancetype)init;
- (instancetype)initWithPlayer:(Entity *)a_player andEnemy:(Entity *)a_enemy;
- (void)update:(NSTimeInterval) deltaTime;
- (void)enemyAI;
- (void)selectAttack:(int)attackNum;
//some function to handle player attacks
@end
