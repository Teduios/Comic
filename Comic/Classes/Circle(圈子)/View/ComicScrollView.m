//
//  ComicScrollView.m
//  Comic
//
//  Created by 孟军 on 16/6/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ComicScrollView.h"
#import "ComicMainModel.h"
#import "EndComicModel.h"
@interface ComicScrollView()

@end
@implementation ComicScrollView


-(ComicScrollView*)CreatScrollView:(InfosModel*)comicList{

    for (int i= 0; i<20;i++ ) {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(i*300, 0, 300, 100)];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 100)];
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(140, 20, 50, 30)];
        UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(180, 20, 100, 20)];
        UILabel *nickNameLab=[[UILabel alloc]initWithFrame:CGRectMake(180, 40, 200, 20)];
        nickNameLab.text=comicList.topics[i].user.nickname;
        
        nickNameLab.font=[UIFont systemFontOfSize:12];
        nickNameLab.textColor=[UIColor grayColor];
        
        nameLab.text=comicList.topics[i].title;
        
        nameLab.font=[UIFont boldSystemFontOfSize:14];
        
        lab.textAlignment=NSTextAlignmentCenter;
        
        lab.font=[UIFont boldSystemFontOfSize:18];
        
        lab.textColor=[UIColor purpleColor];
        
        lab.text=[NSString stringWithFormat:@"%d",i+1];
        
        [view addSubview:nameLab];
        [view addSubview:nickNameLab];
        [view addSubview:lab];
        
        NSString *urlString=comicList.topics[i].cover_image_url;
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        imageView .userInteractionEnabled=YES;
        [view addSubview:imageView];
        [self addSubview:view];
        
    }
    [self setContentSize:CGSizeMake(300*20, 40)];

    
    return self;
    

}


-(ComicScrollView *)setupScrollView:(EndComicModel*)comicList{





    for (int i= 0; i<comicList.data.topics.count;i++ ) {
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(i*300, 0, 300, 100)];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 100)];
        UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(160, 10, 200, 20)];
        nameLab.text=comicList.data.topics[i].title;
        
        nameLab.font=[UIFont boldSystemFontOfSize:12];
        [view addSubview:nameLab];
        
        
        UILabel *nickNameLab=[[UILabel alloc]initWithFrame:CGRectMake(160, 40, 200, 20)];
        nickNameLab.text=comicList.data.topics[i].user.nickname;
        nickNameLab.font=[UIFont systemFontOfSize:12];
        nickNameLab.textColor=[UIColor grayColor];
        [view addSubview:nickNameLab];
        
        
        NSString *urlString=comicList.data.topics[i].cover_image_url;
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        [view addSubview:imageView];
        [self addSubview:view];
        
    }
    [self setContentSize:CGSizeMake(300*comicList.data.topics.count, 40)];
    return self;
    
}
@end
