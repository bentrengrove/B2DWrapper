//
//  B2DTypes.h
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#ifndef Box2dTutorial_B2DTypes_h
#define Box2dTutorial_B2DTypes_h

typedef struct m_B2DVec2 {
    double x;
    double y;
} B2DVec2;

typedef enum B2DJointType
{
	b2d_unknownJoint,
	b2d_revoluteJoint,
	b2d_prismaticJoint,
	b2d_distanceJoint,
	b2d_pulleyJoint,
	b2d_mouseJoint,
	b2d_gearJoint,
	b2d_wheelJoint,
    b2d_weldJoint,
	b2d_frictionJoint,
	b2d_ropeJoint
} B2DJointType;

static B2DVec2 B2DVec2Make(double x, double y);
static inline B2DVec2 B2DVec2Make(double x, double y)
{
    B2DVec2 vec;
    vec.x = x;
    vec.y = y;
    
    return vec;
}


#endif
