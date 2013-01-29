//
//  B2DPolygonShape.m
//  Circus
//
//  Created by Ben Trengrove on 29/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DPolygonShape.h"
#import "Box2D.h"
#include "B2DHelper.h"

@interface B2DPolygonShape()
{
    b2PolygonShape _shape;
}

@end

@implementation B2DPolygonShape

- (id)init
{
    self = [super init];
    if (self) {
        _shape = b2PolygonShape();
    }
    return self;
}

- (void)setWithVertices:(B2DVec2*)vertices count:(int)vertexCount
{
    b2Vec2 *b2Vertices = (b2Vec2*)malloc(sizeof(b2Vec2) * vertexCount);
    for (int i = 0; i<vertexCount; i++) {
        B2DVec2 v = vertices[i];
        b2Vertices[i] = B2DVecToCPlusPlus(v);
    }
    
    _shape.Set(b2Vertices, vertexCount);
    
    free(b2Vertices);
}

- (void)setAsBoxWithHalfWidth:(double)hx halfHeight:(double)hy
{
    _shape.SetAsBox(hx, hy);
}

- (void)setAsBoxWithHalfWidth:(double)hx halfHeight:(double)hy center:(B2DVec2)center angle:(double)angle
{
    _shape.SetAsBox(hx, hy, B2DVecToCPlusPlus(center), angle);
}

- (void*)b2Shape
{
    return &_shape;
}

@end
