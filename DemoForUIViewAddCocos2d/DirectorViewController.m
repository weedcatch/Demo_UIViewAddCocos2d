
#import "DirectorViewController.h"


@implementation DirectorViewController


static DirectorViewController *_sharedDVC = nil;
+(DirectorViewController *) shareDVC{
    if (!_sharedDVC) {
        
        _sharedDVC = [[DirectorViewController alloc] init];
    }
    
    return _sharedDVC;
}

-(id) init{
	if( self=[super init]) {
        [self setupCocos2DView];
	}
	return self;
}


- (void)setupCocos2DView {
    
    _glView = [CCGLView viewWithFrame:[UIScreen mainScreen].bounds  //kEAGLColorFormatRGB565
                          pixelFormat:kEAGLColorFormatRGBA8	// kEAGLColorFormatRGBA8
                          depthFormat:0                        // GL_DEPTH_COMPONENT16_OES
               ];
    _glView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _glView.opaque = NO;
    _glView.backgroundColor = [UIColor clearColor];
    
    
    CAEAGLLayer *eaglLayer = (CAEAGLLayer *)_glView.layer;
    eaglLayer.opaque = NO;
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    const CGFloat myColor[] = {0.0, 0.0, 0.0, 0.0};
    eaglLayer.backgroundColor = CGColorCreate(rgb, myColor);
    CGColorSpaceRelease(rgb);
    
    
    [[CCDirector sharedDirector] setView:_glView];
    
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
}



-(void)runScene:(CCScene*)aScene inView:(UIView*)aSupView{
    
    //self.supView = aSupView;

    if ([CCDirector sharedDirector].runningScene !=nil) {
        [[CCDirector sharedDirector].runningScene cleanup];
        [[CCDirector sharedDirector] replaceScene:aScene];
    }else{
        [[CCDirector sharedDirector] runWithScene:aScene];
    }
    
    
    
    //add to view
    UIView *aView;
    BOOL hasIn = NO;
    for (aView in aSupView.subviews) {
        
        if (aView == _glView) {
            [aSupView bringSubviewToFront:_glView];
            hasIn = YES;
        }
    }
    if (!hasIn) {
        [aSupView addSubview:_glView];
        [aSupView bringSubviewToFront:_glView];
    }
    
}

@end


