//
//  MyLayer.m
//  DemoForUIViewAddCocos2d
//
//  Created by weedcatch on 13-10-30.
//  Copyright (c) 2013年 weedcatch. All rights reserved.
//

#import "MyLayer.h"

@implementation MyLayer

+(CCScene*)scene{
    CCScene *aScene = [CCScene node];
    MyLayer *aLayer = [MyLayer node];
    [aScene addChild:aLayer];
    
    return aScene;
}


-(id)init{
    if (self=[super init]) {
        
        //粒子效果
        _quad = [CCParticleSystemQuad particleWithFile:@"blade_sparkle.plist"];
        //[_quad stopSystem];
        [self addChild:_quad];
        
    }
    return self;
}




@end
