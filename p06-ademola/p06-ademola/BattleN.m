//
//  BattleN.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "BattleN.h"

@implementation BattleN

-(id)initWithSize:(CGSize)frame
{
    self = [super init];
    
    if(self){
        _width = frame.width;
        _height = frame.height;
        
        //place hotbar that contains the spells
        _hotbar = [SKShapeNode shapeNodeWithRect:CGRectMake(0, 0, _width, _height/6)];
        _hotbar.lineWidth = 2.0;
        _hotbar.fillColor = [SKColor blueColor];
        _hotbar.strokeColor = [SKColor blackColor];
        [self addChild:_hotbar];
        
        _es = [SKTextureAtlas atlasNamed:@"ogresprites"];
        _ps = [SKTextureAtlas atlasNamed:@"magesprites"];
        
        [self initAnimations];
        [self createEnemy];
        [self createPlayer];
        
        
        //spells
        for(int i = 0; i < 5; i++){
            SKSpriteNode *s = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake((_width-8*6)/5, _height/6-20)];
            s.position = CGPointMake(s.size.width/2+8*(i+1)+s.size.width*i, s.size.height/2+10);
            s.name = [NSString stringWithFormat:@"spellbutton0%d",i];
            [self addChild:s];
            
            SKLabelNode *l = [SKLabelNode labelNodeWithFontNamed:@"Cochin"];
            l.fontSize = 30;
            l.fontColor = [SKColor blackColor];
            l.position = CGPointMake(0, 0);
            l.zPosition = 5;
            l.text = [NSString stringWithFormat:@"%d",i];
            l.name = [NSString stringWithFormat:@"spellbutton0%d", i];
            [s addChild:l];
        }
        
    }
    
    return self;
}

- (void)createEnemy
{
    SKTexture *ob0 = [_es textureNamed:@"ogre_breath_0"];
    SKTexture *ob1 = [_es textureNamed:@"ogre_breath_1"];
    NSArray *ob = @[ob0, ob1];
    _obg = [SKAction animateWithTextures:ob timePerFrame:0.5 resize:YES restore:YES];
    
    _enemy = [SKSpriteNode spriteNodeWithTexture:ob1];
    _enemy.position = CGPointMake(50, 250);
    _enemy.anchorPoint = CGPointMake(1, 0.5);
    _enemy.xScale = _enemy.xScale * -1;
    [self addChild:_enemy];
    [_enemy runAction:[SKAction repeatActionForever:_obg] withKey:@"idleAni"];
    //[_enemy runAction:_eslash withKey:@"slashAni"];
}

- (void)createPlayer
{
    SKTexture *mr0 = [_ps textureNamed:@"mage_rest_0"];
    SKTexture *mr1 = [_ps textureNamed:@"mage_rest_1"];
    NSArray *mr = @[mr0, mr1];
    _mrg = [SKAction animateWithTextures:mr timePerFrame:0.5 resize:YES restore:YES];
    
    _player = [SKSpriteNode spriteNodeWithTexture:mr1];
    _player.position = CGPointMake(300, 250);
    _player.anchorPoint = CGPointMake(0, 0.5);
    _player.xScale = _player.xScale * -1;
    [self addChild:_player];
    [_player runAction:[SKAction repeatActionForever:_mrg] withKey:@"idleAni"];
}

- (void)initAnimations
{
    //enemy slash animation
    NSMutableArray *enemySlash = [NSMutableArray array];
    
    for(int i = 0; i < 11; i++){
        NSString *textureName = [NSString stringWithFormat:@"ogre_slash_%d", i];
        SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
        [enemySlash addObject:texture];
    }
    
    _eslash = [SKAction animateWithTextures:enemySlash timePerFrame:0.1 resize:YES restore:YES];

    SKAction *move2p = [SKAction moveToX:225 duration:0.6];
    NSLog(@"playerpositionx: %f", _player.position.x);

    _eslash = [SKAction group:@[_eslash, move2p]];
    
    //enemy damaged animation
    SKTexture *e0 = [SKTexture textureWithImageNamed:@"ogre_damaged_0"];
    SKTexture *e1 = [SKTexture textureWithImageNamed:@"ogre_damaged_1"];
    NSArray *enemyDamaged = @[e0, e1];
    
    _edamage = [SKAction animateWithTextures:enemyDamaged timePerFrame:0.2 resize:YES restore:NO];
    
    //enemy heal animation
    SKTexture *r0 = [SKTexture textureWithImageNamed:@"ogre_heal_0"];
    SKTexture *r1 = [SKTexture textureWithImageNamed:@"ogre_heal_1"];
    NSArray *enemyHeal = @[r0, r1];
    
    _eheal = [SKAction animateWithTextures:enemyHeal timePerFrame:0.15 resize:YES restore:NO];
    
    //enemy defeat animation
    SKTexture *d0 = [SKTexture textureWithImageNamed:@"ogre_defeat_0"];
    SKTexture *d1 = [SKTexture textureWithImageNamed:@"ogre_defeat_1"];
    NSArray *enemyDefeat = @[d0, d1];

    _edefeat = [SKAction animateWithTextures:enemyDefeat timePerFrame:0.7 resize:YES restore:NO];
    
    //player spell animation
    NSMutableArray *playerSpell = [NSMutableArray array];
    
    for(int i = 0; i < 7; i++){
        NSString *textureName = [NSString stringWithFormat:@"mage_spell_%d", i];
        SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
        [playerSpell addObject:texture];
    }
    
    _pspell = [SKAction animateWithTextures:playerSpell timePerFrame:0.1 resize:YES restore:NO];
    
    //player damaged animation
    SKTexture *t0 = [SKTexture textureWithImageNamed:@"mage_damaged_0"];
    SKTexture *t1 = [SKTexture textureWithImageNamed:@"mage_damaged_1"];
    NSArray *playerDamaged = @[t0, t1];
    
    _pdamage = [SKAction animateWithTextures:playerDamaged timePerFrame:0.15 resize:YES restore:NO];
    
    //player heal animation
    SKTexture *h0, *h1, *h2;
    h0 = [SKTexture textureWithImageNamed:@"mage_heal_0"];
    h1 = [SKTexture textureWithImageNamed:@"mage_heal_1"];
    h2 = [SKTexture textureWithImageNamed:@"mage_heal_2"];
    NSArray *playerHeal = @[h0, h1, h2];
    
    _pheal = [SKAction animateWithTextures:playerHeal timePerFrame:0.2 resize:YES restore:NO];
    
    //player death animation
    NSMutableArray *playerDefeat = [NSMutableArray array];
    
    [playerDefeat addObject:t0];
    [playerDefeat addObject:t1];
    for(int i = 2; i < 10; i++){
        NSString *textureName = [NSString stringWithFormat:@"mage_defeat_%d", i];
        SKTexture *texture = [SKTexture textureWithImageNamed:textureName];
        [playerDefeat addObject:texture];
    }
    
    _pdefeat = [SKAction animateWithTextures:playerDefeat timePerFrame:0.2 resize:YES restore:NO];
   
}

- (void)animateSkill:(NSString *)skillName withId:(int)entityid
{
    if([skillName  isEqual: @"slash"]){
        NSLog(@"animateSkill slash");
        [_enemy removeActionForKey:@"idleAni"];
        CGFloat oldex = _enemy.position.x;
        SKAction *moveback = [SKAction moveToX:oldex duration:0.6];
        SKAction *seq = [SKAction sequence:@[_eslash, moveback, [SKAction repeatActionForever:_obg]]];
        _enemy.zPosition = 2;
        [_enemy runAction:seq withKey:@"slashAni"];
        
        SKAction *wait = [SKAction waitForDuration:0.3];
        SKAction *seqp = [SKAction sequence:@[wait, _pdamage, [SKAction repeatActionForever:_mrg]]];
        [_player runAction:seqp];
        
    } else if([skillName isEqualToString:@"magicblast"] || [skillName isEqualToString:@"fireball"] || [skillName isEqualToString:@"frostbolt"] || [skillName isEqualToString:@"lightning"]){
        [_player removeActionForKey:@"idleAni"];
        SKAction *seq = [SKAction sequence:@[_pspell, [SKAction repeatActionForever:_mrg]]];
        [_player runAction:seq withKey:@"magicAni"];
        
        SKAction *seqe = [SKAction sequence:@[[SKAction waitForDuration:0.3], _edamage, [SKAction repeatActionForever:_obg]]];
        [_enemy runAction:seqe];
    } else if([skillName isEqualToString:@"heal"] && entityid == 1) {
        [_player removeActionForKey:@"idleAni"];
        SKAction *seq = [SKAction sequence:@[_pheal, [SKAction repeatActionForever:_mrg]]];
        [_player runAction:seq withKey:@"heal"];
    } else if([skillName isEqualToString:@"heal"] && entityid == 0) {
        [_enemy removeActionForKey:@"idleAni"];
        SKAction *seq = [SKAction sequence:@[[SKAction repeatAction:_eheal count:2], [SKAction repeatActionForever:_obg]]];
        [_enemy runAction:seq withKey:@"heal"];
    }
}

- (void)deathAnimationFor:(int)entityid
{
    if(entityid == 0){
        [_enemy removeActionForKey:@"idleAni"];
        SKAction *seq = [SKAction repeatActionForever:_edefeat];
        [_enemy runAction:seq withKey:@"defeat"];
    } else if(entityid == 1){
        [_player removeActionForKey:@"idleAni"];
        [_player runAction:_pdefeat withKey:@"defeat"];
        [_player removeActionForKey:@"idleAni"];
    }
}
@end
