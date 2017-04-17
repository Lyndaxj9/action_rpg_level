//
//  FrostBolt.h
//  p06-ademola
//
//  Created by Lynda on 4/16/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSkill.h"

@interface FrostBolt : NSObject <BasicSkill>
@property (nonatomic) float minDamage;
@property (nonatomic) double cooldown, timePassed;
@property (nonatomic) NSString *attackName;

- (void)execute:(Entity *)a_target;
@end
