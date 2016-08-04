//
//  AJTestOneViewController.m
//  TabBarsAnimationDemo
//
//  Created by ArJun on 16/8/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "AJTestOneViewController.h"
#import "AJViewController.h"
#import "BaseTabBarViewController.h"

@implementation AJTestOneViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[BaseTabBarViewController sharedController] hidesTabBar:NO animated:YES];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"10471400,3840,2400"]];
    [image sizeToFit];
    [self.view addSubview:image];
    UIButton *pushBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    [pushBtn setTitle:@"跳转1" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
    UIButton *pushBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    [pushBtn2 setTitle:@"跳转2" forState:UIControlStateNormal];
    [pushBtn2 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn2];
    
    UIButton *pushBtn3 = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    [pushBtn3 setTitle:@"跳转3" forState:UIControlStateNormal];
    [pushBtn3 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn3];
    
    UIButton *pushBtn4 = [[UIButton alloc]initWithFrame:CGRectMake(200, 300, 100, 100)];
    [pushBtn4 setTitle:@"跳转4" forState:UIControlStateNormal];
    [pushBtn4 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn4];
}
- (void)push{
    AJViewController *vc =[[AJViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
