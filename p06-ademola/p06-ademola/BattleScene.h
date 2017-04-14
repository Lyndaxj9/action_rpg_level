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
#import "MagicBlast.h"
#import "FireBall.h"

@interface BattleScene : SKScene
@property (nonatomic) BattleN *battleN;
@property (nonatomic) Health *health, *health1;
@property (nonatomic) HealthBar *healthBar, *healthBar1;

@property (nonatomic) Combat *testC;

@property (nonatomic) Entity *testE, *testP;
@property (nonatomic) MagicBlast *mb;
@property (nonatomic) FireBall *fb;

@property (nonatomic) NSTimeInterval deltaTime;
@property (nonatomic) NSTimeInterval previousTime;

- (void)initHealth;
- (void)initHealthBar;
@end
