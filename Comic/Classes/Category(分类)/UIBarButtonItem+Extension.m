//
//  UIBarButtonItem+Extension.m
//  新浪项目01
//
//  Created by mj on 16/4/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "UIView+Coordinate.h"
#import "UIBarButtonItem+Extension.h"
//自定义 BarButtonItem
@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action{
    //创建按钮
    UIButton *btn=[[UIButton alloc]init];
    //设置按钮的背景正常状态图片
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置按钮的背景高亮状态的图片
    [btn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    //设置按钮的尺寸为背景图片的尺寸
    btn.size=btn.currentBackgroundImage.size;
    
    //监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    

//返回自定义的按钮
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}
@end
