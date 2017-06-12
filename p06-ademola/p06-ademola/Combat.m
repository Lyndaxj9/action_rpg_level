//
//  Combat.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "Combat.h"

@implementation Combat

//current not in use
- (instancetype)init
{
    self = [super init];
    
    if(self){
        _enemy = [[Entity alloc]init];
        _player = [[Entity alloc]init];
        
        _mb = [[MagicBlast alloc]init];
        _fb = [[FireBall alloc]init];
        
        _heal = [[Heal alloc]init];
        
        _attackSpeed = 1;
        _timePassed = 0;
    }
    
    return self;
}

//actively used one
- (instancetype)initWithPlayer:(Entity *)a_player andEnemy:(Entity *)a_enemy
{
    self = [super init];
    
    if(self){
        _gameOver = FALSE;
        
        _player = a_player;
        _enemy = a_enemy;
        
        _eH = [_enemy getHealth];
        _pH = [_player getHealth];
        
        _skills = [NSMutableArray array];
        
        _mb = [[MagicBlast alloc]init];
        [_skills addObject:_mb];
        _fb = [[FireBall alloc]init];
        [_skills addObject:_fb];
        _ib = [[FrostBolt alloc]init];
        [_skills addObject:_ib];
        _lg = [[Lightning alloc]init];
        [_skills addObject:_lg];
        _heal = [[Heal alloc]init];
        [_skills addObject:_heal];
        _slash = [[Slash alloc]init];
        [_skills addObject:_slash];
        _healE = [[Heal alloc]init];
        [_healE setCooldown:.25];
        [_skills addObject:_healE];
        
        _skillStatus = [NSMutableArray arrayWithCapacity:5];
        for(int i = 0; i < 5; i++){
            [_skillStatus addObject:[NSNumber numberWithBool:TRUE]];
        }
        
        _attackSpeed = 0;
        _timePassed = 0;
    }
    
    return self;
}

- (void)enemyAI
{
    if([_eH getCurrentHealth]/[_eH getMaxHealth] > .3){
        NSLog(@"ATTACK");
        [_enemy useSKill:_slash On:_player];
    } else {
        NSLog(@"before heal: %f", [_eH getCurrentHealth]);
        [_enemy useSKill:_healE On:_enemy];
        NSLog(@"after heal: %f", [_eH getCurrentHealth]);
    }
    [self checkHealth];
    if(_gameOver){
        [self gameEnd];
    }
}

//If i wanted to make the skills more mutable I could use an array and put
//skills in different parts of the array
- (void)selectAttack:(int)attackNum
{
    if(attackNum >= 0 && attackNum <= 3){
        [_player useSKill:[_skills objectAtIndex:attackNum] On:_enemy];
    } else if(attackNum == 4) {
        [_player useSKill:[_skills objectAtIndex:attackNum] On:_player];
    }

    [self checkHealth];
    if(_gameOver){
        [self gameEnd];
    }
}

- (void)checkHealth
{
    if([_eH getCurrentHealth] <= 0){
        _gameOver = TRUE;
        [_enemy setDeath:TRUE];
    } else if([_pH getCurrentHealth] <= 0){
        //NSLog(@"player current health: %f", [_pH getCurrentHealth]);
        _gameOver = TRUE;
        [_player setDeath:TRUE];
    }
}

- (void)gameEnd
{
    if([_enemy death]){
        NSLog(@"Player Wins");
    } else if([_player death]){
        NSLog(@"Player You Lose");
    }
}

- (void)gamereStart
{
    [_enemy setDeath:FALSE];
    [_player setDeath:FALSE];
    _gameOver = FALSE;
}

- (BOOL)getGameOver
{
    return _gameOver;
}

- (NSMutableArray *)getSkillStatus
{
    return _skillStatus;
}

- (void)update:(NSTimeInterval)deltaTime
{
    _enemy.timePassed += deltaTime;

    //update for cooldowns
    for(int i = 0; i < 7; i++){
        //update the amount of time that has
        //passed for each skill
        [[_skills objectAtIndex:i] setTimePassed:([[_skills objectAtIndex:i] timePassed] + deltaTime)];
        if(i < 5){
            //for the player skills set the bool for skillReady
            [_skillStatus replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:[[_skills objectAtIndex:i] skillReady]]];
        }
    }
    
    if(_enemy.timePassed > _enemy.attackSpeed && !_gameOver){
        //if(_timePassed > _attackSpeed){
        [self enemyAI];
        _enemy.timePassed = 0;
    }
}

@end
