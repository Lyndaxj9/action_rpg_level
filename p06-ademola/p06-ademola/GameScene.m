//
//  GameScene.m
//  p06-ademola
//
//  Created by Lynda on 4/6/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

- (id)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    
    if(self){
        self.backgroundColor = [SKColor whiteColor];
        SKShapeNode *box = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.size.width-40, self.size.height-100)];
        box.position = CGPointMake(20+box.frame.size.width/2, 80+box.frame.size.height/2);
        box.fillColor = [SKColor grayColor];
        [self addChild:box];
        
        //Game Title
        SKLabelNode *title = [SKLabelNode labelNodeWithFontNamed:@"Baskerville"];
        title.text = @"THE GAME";
        title.name = @"title";
        //multilineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        title.fontSize = 60;
        title.fontColor = [SKColor whiteColor];
        title.position = CGPointMake(self.size.width/2, self.size.height/2);
        title.zPosition = 2;
        [self addChild:title];
        
        
        //creating a button
        //http://stackoverflow.com/questions/19082202/setting-up-buttons-in-skscene
        SKSpriteNode *start = [SKSpriteNode spriteNodeWithImageNamed:@"red-button-hi"];
        start.position = CGPointMake(330, 80);
        start.name = @"startbutton";
        start.zPosition = 1.0;
        start.xScale = .2;
        start.yScale = .2;
        [self addChild:start];
    }
    
    return self;
}


//create startGame method

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    
    if([node.name isEqualToString:@"startbutton"]) {
        NSLog(@"StartButton Touched");
        //[self startGame];
    }
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
