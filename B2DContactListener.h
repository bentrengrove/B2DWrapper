//
//  B2DContactListener.h
//  Box2dTutorial
//
//  Created by Ben Trengrove on 24/01/13.
//  Copyright (c) 2013 Shiny Things. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DFixture.h"
#import "B2DBody.h"

typedef void(^B2DContactListenerBlock)(B2DBody *body1, B2DBody *body2);

@class B2DWorld;
@interface B2DContactListener : NSObject
{
    
}

@property (strong, nonatomic) B2DContactListenerBlock beginContactBlock;
@property (strong, nonatomic) B2DContactListenerBlock endContactBlock;
@property (weak, nonatomic) B2DWorld *physicsWorld;

- (void*)internalListener;

@end
