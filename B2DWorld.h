//
//  B2DWorld.h
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DBody.h"

@interface B2DWorld : NSObject
{

}

- (id)initWithGravity:(B2DVec2)gravity;
- (B2DBody*)createBody:(B2DBodyDef)bodyDef;
- (void)stepWithDeltaTime:(double)dT velocityIterations:(int)velocityIterations positionIterations:(int)positionIterations;
- (NSArray*)bodyList;
- (void)setGravity:(B2DVec2)gravity;

@end
