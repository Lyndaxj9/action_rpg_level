//
//  BattleScene.h
//  p06-ademola
//
//  Created by Lynda on 4/9/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BattleN.h"
#import "Health.h"
#import "HealthBar.h"
#import "Entity.h"
#import "Combat.h"

@interface BattleScene : SKScene
@property (nonatomic) BattleN *battleN;
@property (nonatomic) Health *health, *health1;
@property (nonatomic) HealthBar *healthBar, *healthBar1;

@property (nonatomic) Combat *testC;
@property (nonatomic) BOOL pDeathAniSet;

@property (nonatomic) Entity *testE, *testP;

@property (nonatomic) NSTimeInterval deltaTime, previousTime, maxCooldown;


- (void)initHealth;
- (void)initHealthBar;
- (void)restartGame;
@end
