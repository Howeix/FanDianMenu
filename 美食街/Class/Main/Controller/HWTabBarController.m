//
//  HWTabBarController.m
//  美食街
//
//  Created by 黄炜 on 2018/1/17.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWTabBarController.h"
#import "HWFavoriteTableViewController.h"
#import "HWHomePageViewController.h"
#import "HWMenuViewController.h"
#import "HWNavController.h"
#import "HWTabBar.h"
#import "UIImage+Image.h"


@interface HWTabBarController ()

@end

@implementation HWTabBarController


+(void)initialize{
    
    //拿到当前类的UITabBarItem的标志,统一设置
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    //创建一个描述文本属性的字典
    NSMutableDictionary *dictNor = [NSMutableDictionary dictionary];
    dictNor[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    dictNor[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:dictNor forState:UIControlStateNormal];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在这里安装导航控制器
    [self setupAllNavController];
    
    //移除系统的tabBar
    [self setupTabBar];
    
    [self setupAllTitleButton];
    
}


-(void)setupAllTitleButton{
    
    HWNavController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"首页";
    nav.tabBarItem.image = [UIImage imageWithOriginalImage:[UIImage imageNamed:@"home"]];
    nav.tabBarItem.selectedImage = [UIImage imageWithOriginalImage:[UIImage imageNamed:@"home_select"]];
    
    
    HWNavController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"地方菜谱";
    nav1.tabBarItem.image = [UIImage imageWithOriginalImage:[UIImage imageNamed:@"menu"]];
    nav1.tabBarItem.selectedImage = [UIImage imageWithOriginalImage:[UIImage imageNamed:@"menu_select"]];
    
    HWNavController *nav2 = self.childViewControllers[2];
    nav2.tabBarItem.title = @"收藏";
    nav2.tabBarItem.image = [UIImage imageWithOriginalImage:[UIImage imageNamed:@"video"]];
    nav2.tabBarItem.selectedImage = [UIImage imageWithOriginalImage:[UIImage imageNamed:@"video_select"]];
    
}

-(void)setupTabBar{
    
    HWTabBar *tabBar = [[HWTabBar alloc] init];
    
    [self setValue:tabBar forKey:@"tabBar"];
//    [tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_image"]];
    tabBar.backgroundColor = [UIColor colorWithRed:210.0 / 255.0 green:117.0 / 255.0 blue:28.0 / 255.0 alpha:1];
    
}

-(void)setupAllNavController{
    
    HWHomePageViewController *homePageVC = [[HWHomePageViewController alloc] init];
    HWNavController *nav1 = [[HWNavController alloc] initWithRootViewController:homePageVC];
    [self addChildViewController:nav1];
    
    HWMenuViewController *menuVC = [HWMenuViewController new];
    HWNavController *nav2 = [[HWNavController alloc] initWithRootViewController:menuVC];
    [self addChildViewController:nav2];
    
    HWFavoriteTableViewController *favVc = [HWFavoriteTableViewController new];
    HWNavController *nav3 = [[HWNavController alloc] initWithRootViewController:favVc];
    [self addChildViewController:nav3];
    
}

-(void)setupChildViewControllerInNav:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selImage title:(NSString *)title{

}



@end
