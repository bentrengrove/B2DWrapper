//
//  B2DShape.m
//  Box2dTutorial
//
//  Created by Ben Trengrove on 22/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DShape.h"

@implementation B2DShape

- (void*)b2Shape
{
    NSAssert(0, @"Class is abstract");
    return NULL;
}

@end
