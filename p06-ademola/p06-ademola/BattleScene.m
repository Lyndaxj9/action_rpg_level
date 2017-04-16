//
//  BattleScene.m
//  p06-ademola
//
//  Created by Lynda on 4/9/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "BattleScene.h"

@implementation BattleScene

- (void)didMoveToView:(SKView *)view
{
    [self createSceneContents];
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor whiteColor];
    
    _battleN = [[BattleN alloc]initWithSize:self.size];
    [self addChild:_battleN];
    
    //_testC = [[Combat alloc]init];
    
    _testE = [[Entity alloc]init];
    _testP = [[Entity alloc]init];
    self.health = [_testE getHealth];
    self.health1 = [_testP getHealth];
    
    _testC = [[Combat alloc]initWithPlayer:_testP andEnemy:_testE];
    
    [self initHealthBar];
}

- (void)initHealth
{
    self.health = [[Health alloc] init];
}

- (void)initHealthBar
{
    float width = self.size.width * 0.7;
    float height = self.size.height * 0.05;
    self.healthBar = [[HealthBar alloc]initWithWidth:width andHeight:height];
    self.healthBar.position = CGPointMake(self.size.width/2.0, self.size.height - self.healthBar.barHeight*3);
    [self addChild:self.healthBar];
    
    self.healthBar1 = [[HealthBar alloc] initWithWidth:width andHeight:height];
    self.healthBar1.position = CGPointMake(self.size.width/2.0, self.size.height - self.healthBar1.barHeight);
    [self addChild:self.healthBar1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //call a skill
    //touch first sq cast MagicBlast
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node.name isEqualToString:@"spellbutton00"]) {
        [_testC selectAttack:0];
        [_battleN animateSkill:[_testP usedSkill] withId:1];
    } else if([node.name isEqualToString:@"spellbutton01"]) {
        [_testC selectAttack:1];
    } else if([node.name isEqualToString:@"spellbutton02"]) {
        
    } else if([node.name isEqualToString:@"spellbutton03"]) {
        
    } else if([node.name isEqualToString:@"spellbutton04"]) {
        [_testC selectAttack:4];
    }
}

- (void)update:(CFTimeInterval)currentTime
{
    self.deltaTime = MIN(1.0/30.0, currentTime - self.previousTime);
    self.previousTime = currentTime;
    [self.testC update:self.deltaTime];
    [_battleN animateSkill:[_testE usedSkill] withId:0];
    [_testE setUsedSkill:@""];
    [self.healthBar updateWithHealth:self.health];
    [self.healthBar1 updateWithHealth:self.health1];
    
}

@end
