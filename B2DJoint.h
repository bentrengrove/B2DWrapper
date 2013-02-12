//
//  B2DJoint.h
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DJoint : NSObject

- (id)initWithB2Joint:(void*)joint;
- (void*)b2Joint;

@end
