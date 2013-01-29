//
//  B2DPolygonShape.h
//  Circus
//
//  Created by Ben Trengrove on 29/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import "B2DShape.h"
#import "B2DTypes.h"

@interface B2DPolygonShape : B2DShape

- (void)setAsBoxWithHalfWidth:(double)hx halfHeight:(double)hy;
- (void)setWithVertices:(B2DVec2*)vertices count:(int)vertexCount;

@end
