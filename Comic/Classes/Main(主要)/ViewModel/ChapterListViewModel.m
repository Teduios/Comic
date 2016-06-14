//
//  ChapterListViewModel.m
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ChapterListViewModel.h"
#import "TRNetManager.h"
@implementation ChapterListViewModel
-(NSMutableArray<ChapterlistModel *> *)chapterList{

    if (!_chapterList) {
        _chapterList=@[].mutableCopy;
        
    }
    return _chapterList;

    
}
/**章节名字*/
-(NSString *)chapterNameForIndex:(NSInteger)index{

    return [self.chapterList[index]name];
}
/**章节id*/

-(NSInteger)chapteridForIndex:(NSInteger)index{


    return [self.chapterList[index]id];
    
}

/**获取章节列表*/

-(void)getChatperListModel:(NSString *)comicName :(void (^)(NSError *))completionHandler{

    
    [TRNetManager getChapterListModel:comicName completionHandler:^(ChapterListModel *model, NSError *error) {
        
        
        if (!error) {
            [self.chapterList removeAllObjects];
            [self.chapterList addObjectsFromArray:model.result.chapterList];
            
        }
        
        !completionHandler?:completionHandler(error);
        
    }];


}
@end
