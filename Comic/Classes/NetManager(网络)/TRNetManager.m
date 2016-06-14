//
//  TRNetManager.m
//  NovelApp
//
//  Created by mj on 16/4/15.
//  Copyright © 2016年 tarena. All rights reserved.
//
//#define KEY @"06ba9c9226c6d2aa6612feb715dea2e3"
#define KEY @"bd43749cfe13ae0682bf3f7e15db0f18"
#import "TRNetManager.h"

#import "NSObject+Netwoking.h"

@implementation TRNetManager


+(id)getBookModel:(NSString *)comicName :(NSString *)comicType completionHandler:(void (^)(BookModel *, NSError *))completionHandler{


    
    NSString *path=@"https://japi.juhe.cn/comic/book";
    NSDictionary *param=@{
                          @"name":comicName,
                          @"key":KEY,
                          
                          @"type":comicType
                          
                          };
    return   [self GET:path parameters:param progress:nil completionHandler:^(id responseObj, NSError *error) {
        
        completionHandler([ BookModel  parseJSON:responseObj],
                          error);
    }];


}

+(id)getChapterListModel:(NSString *)comicName completionHandler:(void (^)(ChapterListModel *, NSError *))completionHandler{

     NSString *path=@"https://japi.juhe.cn/comic/chapter";
    NSDictionary *params=@{
                          @"comicName":comicName,
                          @"key":KEY
                          };
    return    [self GET:path parameters:params progress:nil completionHandler:^(id responseObj, NSError *error) {

             completionHandler([ChapterListModel parseJSON:responseObj],error);
    }];
}


+(id)getImageListModel:(NSString *)comicName chapterId:(NSInteger)chapterId completionHandler:(void (^)(ImageListModel *, NSError *))completionHandler{
    NSString *path=@"https://japi.juhe.cn/comic/chapterContent";
    NSDictionary *param=@{
                          @"comicName":comicName,
                          @"id":@(chapterId),
                            @"key":KEY
                          };
return [self GET:path parameters:param progress:nil completionHandler:^(id responseObj, NSError *error) {

    completionHandler([ImageListModel parseJSON:responseObj],error);
}];
}




+(id)getBannerListModel:(void (^)(BannersModel *, NSError *))completionHandler{
    NSString *urlString = @"http://api.kuaikanmanhua.com/v1/banners";
    
    
    return [self GET:urlString parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        
        completionHandler([ BannersModel parseJSON:responseObj],error);
    }];
    
    
    
}

+(id)getComicListModel:(void (^)(ComicMainModel *, NSError *))competionHandler{

    NSString *urlString = @"http://api.kuaikanmanhua.com/v1/topic_lists/mixed/new?";
    
    
    return [self GET:urlString parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        
        competionHandler([ ComicMainModel parseJSON:responseObj],error);
    }];
    

}




+(id)getEndComicModel:(NSString *)tagName :(void (^)(EndComicModel *, NSError *))competionHandler{


    NSString *urlString = @"http://api.kuaikanmanhua.com/v1/topics";
    
    NSDictionary *params=@{
                           @"tag":tagName,
                           @"offset":@0,
                           @"limit":@20,
                           
                           };
    
    return [self GET:urlString parameters:params progress:nil completionHandler:^(id responseObj, NSError *error) {
        
        competionHandler([ EndComicModel parseJSON:responseObj],error);
    }];

}

+(id)getEndComicContentModel:(NSInteger)BookId :(void (^)(ComicsContentModel *, NSError *))competionHandler{
    
    NSString *url = @"http://api.kuaikanmanhua.com/v1/topics/";
    NSString *urlString=[NSString stringWithFormat:@"%@%ld",url,(long)BookId];
    NSDictionary *params=@{
                           @"sort":@0
                           };
    
    return [self GET:urlString parameters:params progress:nil completionHandler:^(id responseObj, NSError *error) {
        
        competionHandler([ ComicsContentModel parseJSON:responseObj],error);
    }];




}

@end
