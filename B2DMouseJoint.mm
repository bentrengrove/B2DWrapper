//
//  B2DMouseJoint.m
//  Circus
//
//  Created by Ben Trengrove on 29/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DMouseJoint.h"
#import "b2MouseJoint.h"

@implementation B2DMouseJoint

- (void)setTarget:(B2DVec2 *)target {
	b2MouseJoint* mj = (b2MouseJoint *)self.b2Joint;
	mj->SetTarget(b2Vec2(target->x, target->y));
}

@end
