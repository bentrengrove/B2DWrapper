//
//  B2DWorld.m
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DWorld.h"
#import "B2DTypes.h"
#include "B2DHelper.h"

@interface B2DWorld()
{
    b2World *_world;
    NSMutableArray *_bodyList;
}

@end

@implementation B2DWorld

- (id)initWithGravity:(B2DVec2)gravity
{
    if (self = [super init]) {
        b2Vec2 g = b2Vec2(gravity.x, gravity.y);
        _world = new b2World(g);
        
        _bodyList = [NSMutableArray array];
    }
    return self;
}

- (B2DBody*)createBody:(B2DBodyDef)bodyDef
{
    b2BodyDef def;
    def.type = (b2BodyType)bodyDef.type;
    def.position = B2DVecToCPlusPlus(bodyDef.position);
    def.angle = bodyDef.angle;
    def.linearVelocity = B2DVecToCPlusPlus(bodyDef.linearVelocity);
    def.linearDamping = bodyDef.linearDamping;
    def.angularDamping = bodyDef.angularDamping;
    def.allowSleep = bodyDef.allowSleep;
    def.awake = bodyDef.awake;
    def.fixedRotation = bodyDef.fixedRotation;
    def.bullet = bodyDef.bullet;
    def.active = bodyDef.active;
    def.userData = bodyDef.userData;
    def.gravityScale = bodyDef.gravityScale;
    
    b2Body *body = _world->CreateBody(&def);
    B2DBody *objCBody = [[B2DBody alloc] initWithB2Body:body];
    
    [_bodyList addObject:objCBody];
    return objCBody;
}

- (void)stepWithDeltaTime:(double)dT velocityIterations:(int)velocityIterations positionIterations:(int)positionIterations
{
    _world->Step(dT, velocityIterations, positionIterations);
}

- (NSArray*)bodyList
{
    return [NSArray arrayWithArray:_bodyList];
}

- (void)dealloc
{
    delete _world;
}

- (void)setGravity:(B2DVec2)gravity
{
    _world->SetGravity(B2DVecToCPlusPlus(gravity));
}

@end
