//
//  B2DBody.m
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DBody.h"
#import "Box2D.h"
#import "B2DFixture.h"
#import "B2DHelper.h"

@interface B2DBody()
{
    b2Body *_body;
}

@end

@implementation B2DBody

- (id)initWithB2Body:(void*)body
{
    self = [super init];
    if (self) {
        _body = (b2Body*)body;
    }
    return self;
}

- (void)createFixture:(B2DFixtureDef*)fixtureDef
{
    b2FixtureDef def;
    def.shape = (const b2Shape*)[fixtureDef->shape b2Shape];
    def.userData = fixtureDef->userData;
    def.friction = fixtureDef->friction;
    def.restitution = fixtureDef->restitution;
    def.density = fixtureDef->density;
    def.isSensor = fixtureDef->isSensor;
    
    //TODO: Filter
    //def.filter = fixtureDef.filter;
    
    _body->CreateFixture(&def);
}

- (void)applyForceToCenter:(B2DVec2)force
{
    _body->ApplyForceToCenter(B2DVecToCPlusPlus(force));
}

- (void)applyForce:(B2DVec2)force toPoint:(B2DVec2)point
{
    _body->ApplyForce(B2DVecToCPlusPlus(force), B2DVecToCPlusPlus(point));
}

- (void)applyLinearImpulse:(B2DVec2)impulse toPoint:(B2DVec2)point
{
    _body->ApplyLinearImpulse(B2DVecToCPlusPlus(impulse), B2DVecToCPlusPlus(point));
}

- (void)applyAngularImpulse:(double)impulse
{
	_body->ApplyAngularImpulse(impulse);
}

- (void*)b2Body
{
    return _body;
}

- (void*)userData
{
    return _body->GetUserData();
}

- (void)setUserData:(void*)userData
{
    _body->SetUserData(userData);
}

- (B2DVec2)position
{
    return B2DVec2Make(_body->GetPosition().x, _body->GetPosition().y);
}

- (float)angle
{
    return _body->GetAngle();
}

- (float)mass {
	return _body->GetMass();
}

- (B2DVec2)worldCenter
{
    b2Vec2 center = _body->GetWorldCenter();
    return B2DVec2Make(center.x, center.y);
}

- (B2DVec2)localPointForWorldPoint:(B2DVec2)worldPoint {
	b2Vec2 localPoint = _body->GetLocalPoint(B2DVecToCPlusPlus(worldPoint));
	return B2DVec2Make(localPoint.x, localPoint.y);
}

- (BOOL)containsPoint:(B2DVec2)point {
	b2Fixture *fixture = _body->GetFixtureList();
	do {
		NSLog(@"%p", fixture);
		if (fixture->TestPoint(B2DVecToCPlusPlus(point))) {
			return YES;
		}
	} while ((fixture = fixture->GetNext()));
	return NO;
}

- (void)dealloc
{
    _body = NULL;
}

@end
