//
//  AJViewController.m
//  TabBarsAnimationDemo
//
//  Created by ArJun on 16/8/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "AJViewController.h"
#import "BaseTabBarViewController.h"

@implementation AJViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[BaseTabBarViewController sharedController] hidesTabBar:YES animated:YES];
}
@end
