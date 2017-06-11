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
    
    _pDeathAniSet = FALSE;
    
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
    float width = self.size.width * 0.4;
    float height = 25;
    //enemy healthbar
    self.healthBar = [[HealthBar alloc]initWithWidth:width andHeight:height];
    self.healthBar.position = CGPointMake(width/2+25, self.size.height - self.healthBar.barHeight);
    [self addChild:self.healthBar];
    
    //player healthbar
    self.healthBar1 = [[HealthBar alloc] initWithWidth:width andHeight:height];
    self.healthBar1.position = CGPointMake(self.size.width-(width/2+25), self.size.height - self.healthBar1.barHeight);
    self.healthBar1.xScale = self.healthBar1.xScale * -1;
    [self addChild:self.healthBar1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //call a skill
    //touch first sq cast MagicBlast
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if(![_testC getGameOver]){
        if([node.name isEqualToString:@"spellbutton00"]) {
            [_testC selectAttack:0];
        } else if([node.name isEqualToString:@"spellbutton01"]) {
            [_testC selectAttack:1];
        } else if([node.name isEqualToString:@"spellbutton02"]) {
            [_testC selectAttack:2];
        } else if([node.name isEqualToString:@"spellbutton03"]) {
            [_testC selectAttack:3];
        } else if([node.name isEqualToString:@"spellbutton04"]) {
            [_testC selectAttack:4];
        }
        [_battleN animateSkill:[_testP usedSkill] withId:1];
        [_testP setUsedSkill:@""];
    }
    if([_testC getGameOver] && [_testE death]){
        [_battleN deathAnimationFor:0];
    }
    if([_testC getGameOver] && ([node.name isEqualToString:@"tryAgain"] || [node.name isEqualToString:@"tryAgainL"])) {
        NSLog(@"Restart Game");
        [_health resetHealth];
        [_health1 resetHealth];
        [_battleN resetAnimaiton];
        /*
         - Reset health
         Reset cooldowns
         Reset gameover vars
         - Reset gameover death animation
         Remove button and you...
         */
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
    if([_testC getGameOver] && [_testP death] && !_pDeathAniSet){
        [_battleN deathAnimationFor:1];
        _pDeathAniSet = TRUE;
    }
    [_battleN updateSkillCooldown:[_testC getSkillStatus]];

}

@end
