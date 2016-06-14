//
//  TRNavigatonController.m
//  新浪项目01
//
//  Created by mj on 16/4/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRNavigatonController.h"

@interface TRNavigatonController ()

@end

@implementation TRNavigatonController



+(void)initialize{
    // 设置UIBarButtonItem的样式
    [self setupBarButtonItemTheme];
    // 设置UINavigationBar主题
    [self setupNavigationBarTheme];



}
#pragma mark 设置UINavigationBar主题
+(void)setupNavigationBarTheme{
//获取全局的导航栏
    UINavigationBar *appearance=[UINavigationBar appearance];
    //使用属性字符串设置文字颜色和大小
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:20];
    [appearance setTitleTextAttributes:textAttrs];
    
    
    
}
#pragma mark 设置UIBarButtonItem的样式
+(void)setupBarButtonItemTheme{
    //通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance=[UIBarButtonItem appearance];
    //设置普通状态的文字
    NSMutableDictionary *textArray=[NSMutableDictionary dictionary];
    
    textArray[NSForegroundColorAttributeName]=[UIColor blackColor];
    textArray[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:textArray forState:UIControlStateNormal];
    //设置高亮状态文字
    NSMutableDictionary *hightextArray=[NSMutableDictionary dictionary];
    
    hightextArray[NSForegroundColorAttributeName]=COLOR(31, 189, 255,1.0);//    hightextArray[NSForegroundColorAttributeName]=[UIColor redColor];
    hightextArray[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:hightextArray forState:UIControlStateHighlighted];
    //不可用
    NSMutableDictionary *disabtextArray=[NSMutableDictionary dictionary];
    
    disabtextArray[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    disabtextArray[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:disabtextArray forState:UIControlStateDisabled];

}
#pragma mark 拦截Push进来的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
       //如果Push的不是栈底控制器（最先Push进来的那个控制器）
    if (self.viewControllers.count>0) {
               //隐藏底部状态栏
        viewController.hidesBottomBarWhenPushed=YES;
        
        //设置导航栏按钮
//        //左
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_back" highImageName:@"navigationbar_back_highlighted" target:self action:@selector(back) ];
//        //右
          viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self action:@selector(more) ];

        

    }
    //先判断栈有几个PUSh控制器
    
    [super pushViewController:viewController animated:animated];
}

-(void)back{
//返回
    [self popViewControllerAnimated:YES];
    
    
}
-(void)more{
    //回到根控制器
    [self popToRootViewControllerAnimated:YES];
    
}



@end
