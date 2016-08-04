//
//  BaseTabBarViewController.m
//  TabBarsAnimationDemo
//
//  Created by ArJun on 16/8/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseTabBarButton.h"

//整个屏幕的宽和高
#define SCREENWEIGHT [UIScreen mainScreen].bounds.size.width
#define kTabBarHeight 49

@interface BaseTabBarViewController ()
/** 自定义的覆盖原先的tarbar的控件 */
@property (nonatomic, strong) UIView *tabBarView;
/** 记录前一次选中的按钮 */
@property (nonatomic, strong) BaseTabBarButton *selectLastBtn;

@end

@implementation BaseTabBarViewController

//单例
static BaseTabBarViewController *controller = nil;
+(BaseTabBarViewController *)sharedController{
    @synchronized(self){
        if(controller == nil){
            controller = [[self alloc] init];
            [controller buildTabBar];
        }
    }
    return controller;
}
+(instancetype)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (controller == nil) {
            controller = [super allocWithZone:zone];
            return  controller;
        }
    }
    return nil;
}

- (void)buildTabBar{
    self.tabBar.hidden = YES;
    CGFloat tabBarViewY = self.view.frame.size.height - 49;
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, tabBarViewY, SCREENWEIGHT, 49)];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarView];
}

+ (instancetype)addChildVc:(NSArray *)childVcs titles:(NSArray *)titles images:(NSArray *)images selectedImages:(NSArray *)selectedImages tabBarNaviChildVC:(UINavigationController*)tabBarNaviChildVC{
    BaseTabBarViewController *baseTabBar = [BaseTabBarViewController sharedController];
    for (int i = 0; i < childVcs.count; ++i) {
        tabBarNaviChildVC = [[tabBarNaviChildVC.class alloc]
                             initWithRootViewController:childVcs[i]];
        
        [baseTabBar addChildViewController:tabBarNaviChildVC];
        
        [baseTabBar creatButtonWithNormalName:images[i]
                                andSelectName:selectedImages[i]
                                     andTitle:titles[i] andTag:i
                                     andIndex:childVcs.count] ;
    }
    
    BaseTabBarButton * button = baseTabBar.tabBarView.subviews[0];
    [baseTabBar changeViewController:button];
    
    return baseTabBar;
}

#pragma mark 按钮被点击时调用
- (void)changeViewController:(BaseTabBarButton *)sender
{
    sender.enabled = NO;
    if (_selectLastBtn != sender) {
        _selectLastBtn.enabled = YES;
    }
    _selectLastBtn = sender;
    self.selectedViewController = self.viewControllers[sender.tag];
}
#pragma mark 创建一个按钮

- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andTag:(int)tag andIndex:(NSInteger)index{
    
    BaseTabBarButton * customButton = [BaseTabBarButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = tag;
    NSInteger count = index;
    CGFloat buttonW = _tabBarView.frame.size.width /  count;
    CGFloat buttonH = _tabBarView.frame.size.height;
    
    customButton.frame = CGRectMake(buttonW * tag, 0, buttonW, buttonH);
    [customButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateDisabled];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor orangeColor] forState:UIControlStateDisabled];
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_tabBarView addSubview:customButton];
}

#pragma mark 是否隐藏tabBar
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated
{
    self.tabBarHidden = yesOrNO;
    if (yesOrNO == YES)
    {
        if (self.tabBarView.frame.origin.y == self.view.frame.size.height)
        {
            return;
        }
    }
    else
    {
        if (_tabBarView.frame.origin.y == self.view.frame.size.height - kTabBarHeight)
        {
            return;
        }
    }
    if (animated == YES)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        if (yesOrNO == YES)
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y + kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        else
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y - kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        if (yesOrNO == YES)
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y + kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        else
        {
            _tabBarView.frame = CGRectMake(_tabBarView.frame.origin.x, _tabBarView.frame.origin.y - kTabBarHeight, _tabBarView.frame.size.width, _tabBarView.frame.size.height);
        }
        [UIView commitAnimations];
    }
}




@end
