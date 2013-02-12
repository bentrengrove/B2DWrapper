//
//  B2DMouseJoint.h
//  Circus
//
//  Created by Ben Trengrove on 29/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DJoint.h"
#import "B2DTypes.h"
@class B2DBody;

typedef struct m_B2DMouseJointDef
{
    /// The joint type is set automatically for concrete joint types.
	B2DJointType type;
    
	/// Use this to attach application specific data to your joints.
	void* userData;
    
	/// The first attached body.
	__unsafe_unretained B2DBody* bodyA;
    
	/// The second attached body.
	__unsafe_unretained B2DBody* bodyB;
    
	/// Set this flag to true if the attached bodies should collide.
	BOOL collideConnected;
	/// The initial world target point. This is assumed
	/// to coincide with the body anchor initially.
	B2DVec2 target;
    
	/// The maximum constraint force that can be exerted
	/// to move the candidate body. Usually you will express
	/// as some multiple of the weight (multiplier * mass * gravity).
	double maxForce;
    
	/// The response speed.
	double frequencyHz;
    
	/// The damping ratio. 0 = no damping, 1 = critical damping.
	double dampingRatio;
} B2DMouseJointDef;

static B2DMouseJointDef B2DMouseJointDefInit();
static inline B2DMouseJointDef B2DMouseJointDefInit()
{
    B2DMouseJointDef def;
    def.type = b2d_mouseJoint;
    def.userData = NULL;
    def.bodyA = NULL;
    def.bodyB = NULL;
    def.collideConnected = NO;
    
    def.target = B2DVec2Make(0, 0);
    def.maxForce = 0.0f;
    def.frequencyHz = 5.0f;
    def.dampingRatio = 0.7f;
    
    return def;
}

@interface B2DMouseJoint : B2DJoint

- (void)setTarget:(B2DVec2 *)target;

@end
