//
//  AppDelegate.m
//  Comic
//
//  Created by mj on 16/4/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "ChapterListViewModel.h"
#import "TRTabBarController.h"
#import "TRNetManager.h"
#import "BookModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //隐藏状态栏
    application.statusBarHidden=NO;
    
    //创建窗口
    self.window=[[UIWindow alloc]init];
    self.window.frame=[UIScreen mainScreen].bounds;
    
    //设置窗口的根控制器 自定义控制器
    
    self.window.rootViewController=[TRTabBarController new];
    //显示窗口
    [self.window makeKeyAndVisible];
    
    //
//       [TRNetManager getBookModel:@"妖精的尾巴" completionHandler:^(BookModel *model, NSError *error) {
//           NSLog(@"");
//    
//       }];
    
//    
//    [TRNetManager getImageListModel:@"妖精的尾巴" chapterId:7908 completionHandler:^(ImageListModel *modle, NSError *error) {
//        NSLog(@"");
//    
//    }];
//    
//
//    [PlistManager getComicName:^(NSArray<ComicName *> *allnames, NSError *error) {
//        NSLog(@"");
//        
//    }];
//    
    
    
//    [TRNetManager getChapterListModel:@"妖精的尾巴" completionHandler:^(ChapterListModel *model, NSError *error) {
//       
//        NSLog(@"");
//        
//    }];
//    
//    [TRNetManager getBannerListModel:^(BannersModel *model, NSError *error) {
//    
//    }];
//
    
//     [TRNetManager getComicListModel:^(ComicMainModel *model, NSError *error) {
//         
//     }];
//    
//
  
         [TRNetManager getEndComicContentModel:178 :^(ComicsContentModel *model, NSError *error) {
             
         }];
    
    
    
    
    return YES;
}


@end
