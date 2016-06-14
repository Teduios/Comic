//
//  TRSearchBar.m
//  新浪项目01
//
//  Created by mj on 16/4/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRSearchBar.h"

@implementation TRSearchBar

+(instancetype)SeacherBar{


    return [[self alloc]init];
    
}


-(instancetype)initWithFrame:(CGRect)frame{


    if (self=[super initWithFrame:frame]) {
        
       
        //设置背景 用九宫切图法
        self.backgroundColor=[UIColor lightGrayColor];

        //设置内容--垂直居中
        self.contentVerticalAlignment=UIControlContentHorizontalAlignmentCenter;
        //设置左边显示一个放大镜
        UIImageView *leftView=[UIImageView new];
        leftView.width=leftView.width+10;
        self.placeholder=@"请输入漫画名🔍";
        self.layer.cornerRadius=10;
        self.layer.masksToBounds=YES;
        
        //设置放大镜的内容居中
        leftView.contentMode=UIViewContentModeCenter;
        //将放大镜添加到文本框
        self.leftView=leftView;
        //设置文本框左边的View 永久显示
        self.leftViewMode=UITextFieldViewModeAlways;
        //清除按钮永久显示
        self.clearButtonMode=UITextFieldViewModeAlways;
             

        
        
    }
    return self ;
    
}
@end
