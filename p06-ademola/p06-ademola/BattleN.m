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
        
        SKLabelNode *exp = [SKLabelNode labelNodeWithFontNamed:@"Cochin"];
        exp.fontColor = [SKColor blackColor];
        exp.fontSize = 20;
        exp.position = CGPointMake(_width/2, _height/2);
        exp.name = @"explaination";
        exp.text = @"top bar player health, bottom enemy health";
        [self addChild:exp];
        
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
            l.name = [NSString stringWithFormat:@"spelllabel0%d", i];
            [s addChild:l];
        }
        
    }
    
    return self;
}

@end
