//
//  TRTabBarController.m
//  NovelApp
//
//  Created by mj on 16/4/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRTabBarController.h"
#import "TRTabBar.h"
#import "TRBookShelfController.h"
#import "TRCircleController.h"
#import "TRSearchController.h"
#import "TRProfileController.h"
#import "TRNavigatonController.h"
#import "TRHomeController.h"

@interface TRTabBarController ()<TRTabBarDelegate>

@end

@implementation TRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    
    //添加所有子控制器
    [self addAllChildVcs];
    //创建自定义TABBar
    [self addCustomTabBar];
//  self.tabBar.tintColor=[UIColor redColor];
    
self.tabBar.tintColor=COLOR(31, 189, 255,1.0);
    
}
#pragma mark  创建自定义TABBar
//创建自定义TABBar
-(void)addCustomTabBar{
    TRTabBar *customTabBar=[TRTabBar new];
    customTabBar.TabBardelegate=self;
    //更换系统自带TabBar
    [self setValue:customTabBar forKey:@"tabBar"];
    

}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    // 强制重新布局子控件（内部会调用layouSubviews）
    [self.tabBar setNeedsLayout];
}


#pragma mark 添加子控制器
//添加所有子控制器
-(void)addAllChildVcs{
    //书架
    TRBookShelfController *bookShelf=[TRBookShelfController new];
    [self addOneChlidVc:bookShelf title:@"书架" imageName:@"pencil_normal"  selectedImage:@"pencil_pressed"];
    
    TRHomeController *bookStore=[TRHomeController new];
    [self addOneChlidVc:bookStore title:@"首页" imageName:@"index" selectedImage:@"index_sel"];
    
    TRCircleController *circle=[[TRCircleController alloc]initWithStyle:UITableViewStyleGrouped];
    [self addOneChlidVc:circle title:@"书城" imageName:@"circle"selectedImage:@"circle_sel"];
    
    TRProfileController *profile=[TRProfileController new];
    [self addOneChlidVc:profile title:@"我的" imageName:@"mine_normal"selectedImage:@"mine_pressed"];
    
    
    
}
-(void)addOneChlidVc:(UIViewController*)chlidVc title:(NSString*)title imageName:(NSString*)imageName selectedImage:(NSString*)selectedImageName{

    chlidVc.title=title;
    
    //设置图标
    chlidVc.tabBarItem.image=[UIImage imageNamed :imageName];

    UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
    
    selectedImage =[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ];
    
    chlidVc.tabBarItem.selectedImage=selectedImage;
    //添加为TAbBar控制器的子控制器
    TRNavigatonController *nav=[[TRNavigatonController alloc]initWithRootViewController:chlidVc];
    [self addChildViewController:nav];
    
}
- (void)tabBarDidClickedPlusButton:(TRTabBar *)tabBar
{
    // 弹出搜索栏
    TRSearchController *seacherVC = [[TRSearchController alloc] init];
    TRNavigatonController *nav = [[TRNavigatonController alloc] initWithRootViewController:seacherVC];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
