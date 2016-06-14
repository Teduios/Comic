//
//  ChapterListViewModel.h
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChapterListModel.h"
@interface ChapterListViewModel : NSObject
/** 根据UI定义属性和方法 */

/**章节名字*/
-(NSString*)chapterNameForIndex:(NSInteger)index;

/**章节id*/
-(NSInteger)chapteridForIndex:(NSInteger)index;


/** 根据Model定义属性和方法 */

/**章节列表*/
@property(nonatomic)NSMutableArray<ChapterlistModel*> *chapterList;
/**获取章节列表*/
-(void)getChatperListModel:(NSString*)comicName :(void(^)(NSError *error))completionHandler;

@end

