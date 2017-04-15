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
@property (nonatomic) SKAction *obg;
@property (nonatomic) SKAction *eslash;

- (id)initWithSize:(CGSize)frame;
- (void)animateSkill:(NSString *)skillName;
@end
