//
//  B2DWorld.h
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DBody.h"
#import "B2DRevoluteJoint.h"
#import "B2DContactListener.h"

@interface B2DWorld : NSObject
{

}

- (id)initWithGravity:(B2DVec2)gravity;

- (B2DBody*)createBody:(const B2DBodyDef *)bodyDef;
- (void)destoryBody:(B2DBody*)body;
- (void)destoryBody:(B2DBody*)body shouldDelayTillNextTick:(BOOL)delay;

- (B2DJoint*)createJointOfType:(B2DJointType)type withDef:(const void *)voidDef;
- (void)destroyJoint:(B2DJoint*)joint;

- (void)stepWithDeltaTime:(double)dT velocityIterations:(int)velocityIterations positionIterations:(int)positionIterations;
- (B2DBody*)bodyForB2Body:(void*)b2Body;

- (NSArray*)jointList;
- (NSArray*)bodyList;

- (void)setGravity:(B2DVec2)gravity;
- (B2DVec2)gravity;

- (void)setDebugDraw:(void*)debugDraw;
- (void)drawDebugData;

- (void)setContactListener:(B2DContactListener*)listener;

@end
