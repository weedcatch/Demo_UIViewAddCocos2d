//
//  ViewController.m
//  DemoForUIViewAddCocos2d
//
//  Created by weedcatch on 13-10-30.
//  Copyright (c) 2013年 weedcatch. All rights reserved.
//

#import "ViewController.h"
#import "DirectorViewController.h"
#import "cocos2d.h"
#import "MyLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 440)];
    aView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:aView];
    
    
    [[DirectorViewController shareDVC] runScene:[MyLayer scene] inView:aView];
    
}



@end
