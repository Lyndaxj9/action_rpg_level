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
        
        _mb = [[MagicBlast alloc]init];
        _fb = [[FireBall alloc]init];
        _ib = [[FrostBolt alloc]init];
        _lg = [[Lightning alloc]init];
        _heal = [[Heal alloc]init];
        _slash = [[Slash alloc]init];
        
        _attackSpeed = 1;
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
        [_enemy useSKill:_heal On:_enemy];
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
    if(attackNum == 0){
        [_player useSKill:_mb On:_enemy];
    } else if(attackNum == 1) {
        [_player useSKill:_fb On:_enemy];
    } else if(attackNum == 2){
        [_player useSKill:_ib On:_enemy];
    } else if(attackNum == 3){
        [_player useSKill:_lg On:_enemy];
    } else if(attackNum == 4) {
        [_player useSKill:_heal On:_player];
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
        NSLog(@"player current health: %f", [_pH getCurrentHealth]);
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

- (BOOL)getGameOver
{
    return _gameOver;
}

- (void)update:(NSTimeInterval)deltaTime
{
    _enemy.timePassed += deltaTime;
    //NSLog(@"timePassed: %f", _timePassed);
    if(_enemy.timePassed > _enemy.attackSpeed && !_gameOver){
        //if(_timePassed > _attackSpeed){
        [self enemyAI];
        _enemy.timePassed = 0;
    }
}

@end
