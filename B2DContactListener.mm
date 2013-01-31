//
//  B2DContactListener.m
//  Box2dTutorial
//
//  Created by Ben Trengrove on 24/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DContactListener.h"
#import "Box2D.h"
#import "B2DWorld.h"

#pragma mark - C++ Implementation

class b2DInternalContactListener : private b2ContactListener
{
    B2DContactListener *_wrapper;
public:
    b2DInternalContactListener (B2DContactListener *objCContactListener);
    
    void BeginContact(b2Contact* contact);
    void EndContact(b2Contact* contact);
};

b2DInternalContactListener::b2DInternalContactListener( B2DContactListener *wrapper )
{
    _wrapper = wrapper;
}

void b2DInternalContactListener::BeginContact(b2Contact *contact)
{
    if (_wrapper.beginContactBlock) {
        b2Body *b2Body1 = contact->GetFixtureA()->GetBody();
        b2Body *b2Body2 = contact->GetFixtureB()->GetBody();
        
        B2DWorld *world = _wrapper.physicsWorld;
        B2DBody *body1 = [world bodyForB2Body:b2Body1];
        B2DBody *body2 = [world bodyForB2Body:b2Body2];
        
        _wrapper.beginContactBlock(body1, body2);
    }
}

void b2DInternalContactListener::EndContact(b2Contact *contact)
{
    if (_wrapper.endContactBlock) {
        b2Body *b2Body1 = contact->GetFixtureA()->GetBody();
        b2Body *b2Body2 = contact->GetFixtureB()->GetBody();
        
        B2DWorld *world = _wrapper.physicsWorld;
        B2DBody *body1 = [world bodyForB2Body:b2Body1];
        B2DBody *body2 = [world bodyForB2Body:b2Body2];
        
        _wrapper.endContactBlock(body1, body2);
    }
}

#pragma mark - Objective C Wrapper


@interface B2DContactListener()
{
    b2DInternalContactListener *_listener;
}

@end


@implementation B2DContactListener

- (id)init
{
    self = [super init];
    if (self) {
        _listener = new b2DInternalContactListener(self);
    }
    return self;
}

- (void*)internalListener
{
    return _listener;
}

@end
