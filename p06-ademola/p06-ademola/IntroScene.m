//
//  IntroScene.m
//  p06-ademola
//
//  Created by Lynda on 4/9/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "IntroScene.h"

@implementation IntroScene

- (void)didMoveToView:(SKView *)view
{
    [self createSceneContents];
}

- (void)createSceneContents
{
    _introN = [[IntroN alloc]initWithSize:self.size];
    [self addChild:_introN];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

     UITouch *touch = [touches anyObject];
     CGPoint location = [touch locationInNode:self];
     SKNode *node = [self nodeAtPoint:location];
     
     if([node.name isEqualToString:@"nextbutton"]) {
     [self createBattleScene];
     }

}

- (void)createBattleScene
{
    SKScene *battleS = [[BattleScene alloc]initWithSize:self.size];
    SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
    [self.view presentScene:battleS transition:doors];
    
    NSLog(@"createBattleScene called.");
}



@end
