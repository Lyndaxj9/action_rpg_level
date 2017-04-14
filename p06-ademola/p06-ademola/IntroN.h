//
//  IntroN.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface IntroN : SKNode
@property (nonatomic) SKSpriteNode *npc;
@property (nonatomic) SKSpriteNode *next;
@property (nonatomic) SKLabelNode *npcSpeech;
@property (nonatomic) SKShapeNode *speechBox;
@property (nonatomic) CGFloat width, height;

- (id)initWithSize:(CGSize)frame;
@end
