//
//  ImageListViewModel.m
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ImageListViewModel.h"
#import "TRNetManager.h"
@implementation ImageListViewModel
-(NSInteger)rowNumber{


    return self.imageList.count;
    
}

-(NSMutableArray<ImagelistModel *> *)imageList{

    if (!_imageList) {
        _imageList=@[].mutableCopy;
        
    }
    return _imageList;
}
/*漫画内容图片**/

-(NSString*)imageUrlForIndex:(NSInteger)index{


    return [self.imageList[index]imageUrl];
    
}

/**获取漫画内容图片*/

-(void)getImageListModel:(NSString *)comicName chapterID:(NSInteger)chapterId :(void (^)(NSError *))completionHandler{

    
    [TRNetManager getImageListModel:comicName chapterId:chapterId completionHandler:^(ImageListModel *modle, NSError *error) {
        if (!error) {
            [self.imageList addObjectsFromArray:modle.result.imageList];
        }
        !completionHandler ?: completionHandler(error);
    }];



}
@end
