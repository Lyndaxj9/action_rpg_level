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
    SKTextureAtlas *os = [SKTextureAtlas atlasNamed:@"ogresprites"];
    SKTexture *ob0 = [os textureNamed:@"ogre_breath_0"];
    SKTexture *ob1 = [os textureNamed:@"ogre_breath_1"];
    NSArray *ob = @[ob0, ob1];
    SKAction *obg = [SKAction animateWithTextures:ob timePerFrame:0.7 resize:YES restore:YES];
    
    _enemy = [SKSpriteNode spriteNodeWithTexture:ob1];
    _enemy.position = CGPointMake(100, 250);
    //_enemy.size = CGSizeMake(100, 100);
    _enemy.xScale = _enemy.xScale * -1;
    [self addChild:_enemy];
    [_enemy runAction:[SKAction repeatActionForever:obg]];
}

- (void)createPlayer
{
    SKTextureAtlas *ms = [SKTextureAtlas atlasNamed:@"magesprites"];
    SKTexture *mr0 = [ms textureNamed:@"mage_rest_0"];
    SKTexture *mr1 = [ms textureNamed:@"mage_rest_1"];
    NSArray *mr = @[mr0, mr1];
    SKAction *mrg = [SKAction animateWithTextures:mr timePerFrame:0.7 resize:YES restore:YES];
    
    _player = [SKSpriteNode spriteNodeWithTexture:mr1];
    _player.position = CGPointMake(300, 250);
    //_enemy.size = CGSizeMake(100, 100);
    _player.xScale = _player.xScale * -1;
    [self addChild:_player];
    [_player runAction:[SKAction repeatActionForever:mrg]];
}

- (void)initAnimations
{
    
}

@end
