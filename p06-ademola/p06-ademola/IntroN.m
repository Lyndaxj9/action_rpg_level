//
//  IntroN.m
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "IntroN.h"

@implementation IntroN

- (id)initWithSize:(CGSize)frame
{
    self = [super init];
    
    if(self)
    {
        _width = frame.width;
        _height = frame.height;
        
        //init NPC image
        _npc = [SKSpriteNode spriteNodeWithImageNamed:@"guyanime"];
        _npc.position = CGPointMake(200, 300);
        _npc.zPosition = -2;
        [self addChild:_npc];
        
        //init NPC text
        [self createLabels];
        
        _speechBox = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(_width-80, 100)];
        _speechBox.fillColor = [SKColor whiteColor];
        _speechBox.zPosition = -1;
        _speechBox.position = CGPointMake(_width/2, _height/5);
        [self addChild:_speechBox];
        
        //init button
        //creating a button
        //http://stackoverflow.com/questions/19082202/setting-up-buttons-in-skscene
        SKSpriteNode *next = [SKSpriteNode spriteNodeWithImageNamed:@"red-button-hi"];
        next.position = CGPointMake(350, 70);
        next.name = @"nextbutton";
        next.zPosition = 1.0;
        next.xScale = .1;
        next.yScale = .2;
        [self addChild:next];
        
    }
    
    return self;
}

//code for multiline labels
//https://xcodenoobies.blogspot.com/2014/12/multiline-sklabelnode-hell-yes-please-xd.html
- (void)createLabels
{
    NSString *dialouge = @"Ah!... Hello you scared me and to repay me can you help with something?";
    NSCharacterSet *separators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words = [dialouge componentsSeparatedByCharactersInSet:separators];
    
    NSUInteger len = [dialouge length];
    int width = 35;
    
    unsigned long totLines = len/width + 1;
    int count = 0;
    
    for(int i = 0; i < totLines; i++){
        NSUInteger lenPerLine = 0;
        NSString *lineStr = @"";
        
        while(lenPerLine < width) {
            if(count > [words count]-1){break;}
            
            lineStr = [NSString stringWithFormat:@"%@ %@", lineStr, words[count]];
            lenPerLine = [lineStr length];
            count++;
            //NSLog(@"%@", lineStr);
        }
        
        SKLabelNode *multilineLabel = [SKLabelNode labelNodeWithFontNamed:@"Cochin"];
        multilineLabel.text = lineStr;
        multilineLabel.name = @"multiline";
        //multilineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        multilineLabel.fontSize = 15;
        multilineLabel.fontColor = [SKColor blackColor];
        multilineLabel.position = CGPointMake(_width/2, _height/5-20*i);
        //NSLog(@"x: %f | y: %f", _width/2, _height/3+100-20*i);
        [self addChild:multilineLabel];
    }
}

@end
