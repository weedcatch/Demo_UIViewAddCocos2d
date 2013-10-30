
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DirectorViewController : NSObject{
    
    CCGLView *_glView;
}

@property(nonatomic,assign)UIView *supView;


+(DirectorViewController *) shareDVC;

-(void)runScene:(CCScene*)aScene inView:(UIView*)aSupView;

@end










