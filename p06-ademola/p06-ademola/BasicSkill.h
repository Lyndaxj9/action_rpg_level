//
//  BasicSkill.h
//  p06-ademola
//
//  Created by Lynda on 4/13/17.
//  Copyright © 2017 Lynda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
@class Entity;

@protocol BasicSkill <NSObject>
@property (nonatomic) NSString *attackName;
@property (nonatomic) double cooldown, timePassed;

- (void)execute:(Entity *)target;
- (BOOL)skillReady;
@end
