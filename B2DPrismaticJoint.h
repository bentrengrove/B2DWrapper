//
//  B2DPrismaticJoint.h
//  Jungle Party
//
//  Created by Sebastian Grail on 11/02/13.
//  Copyright (c) 2013 Sebastian Grail. All rights reserved.
//

#import "B2DJoint.h"
#import "B2DTypes.h"

typedef struct m_B2DPrismaticJointDef
{
	B2DJointType type;
	
	/// The local anchor point relative to bodyA's origin.
	B2DVec2 localAnchorA;
	
	/// The local anchor point relative to bodyB's origin.
	B2DVec2 localAnchorB;
	
	/// The local translation unit axis in bodyA.
	B2DVec2 localAxisA;
	
	/// The constrained angle between the bodies: bodyB_angle - bodyA_angle.
	double referenceAngle;
	
	/// Enable/disable the joint limit.
	bool enableLimit;
	
	/// The lower translation limit, usually in meters.
	double lowerTranslation;
	
	/// The upper translation limit, usually in meters.
	double upperTranslation;
	
	/// Enable/disable the joint motor.
	bool enableMotor;
	
	/// The maximum motor torque, usually in N-m.
	double maxMotorForce;
	
	/// The desired motor speed in radians per second.
	double motorSpeed;
} B2DPrismaticJointDef;

static B2DPrismaticJointDef B2DPrismaticJointDefInit();
static inline B2DPrismaticJointDef B2DPrismaticJointDefInit()
{
	B2DPrismaticJointDef def;
	def.type = b2d_prismaticJoint;
	def.localAnchorA = B2DVec2Make(0, 0);
	def.localAnchorB = B2DVec2Make(0, 0);
	def.localAxisA = B2DVec2Make(1.0, 1.0);
	def.referenceAngle = 0.0;
	def.enableLimit = false;
	def.lowerTranslation = 0.0f;
	def.upperTranslation = 0.0f;
	def.enableMotor = false;
	def.maxMotorForce = 0.0f;
	def.motorSpeed = 0.0f;
	
	return def;
}

@interface B2DPrismaticJoint : B2DJoint

@end
