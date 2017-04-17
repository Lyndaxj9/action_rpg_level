//
//  BattleN.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BattleN : SKNode
@property (nonatomic) CGFloat width, height;
@property (nonatomic) SKSpriteNode *player, *enemy;
@property (nonatomic) SKSpriteNode *spell, *potion;
@property (nonatomic) SKSpriteNode *healthBar;
@property (nonatomic) SKShapeNode *hotbar;

@property (nonatomic) SKTextureAtlas *es;
@property (nonatomic) SKTextureAtlas *ps;
@property (nonatomic) SKAction *obg, *mrg;
@property (nonatomic) SKAction *eslash, *edamage, *eheal, *edefeat;
@property (nonatomic) SKAction *pspell, *pdamage, *pheal, *pdefeat;

@property (nonatomic) int entityDefeated;

- (id)initWithSize:(CGSize)frame;
//- (void)animateSkill:(NSString *)skillName;
- (void)animateSkill:(NSString *)skillName withId:(int)entityid;
- (void)deathAnimationFor:(int)entityid;
@end
