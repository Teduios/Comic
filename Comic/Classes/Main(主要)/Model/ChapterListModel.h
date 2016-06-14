//
//  ChapterListModel.h
//  NovelApp2
//
//  Created by mj on 16/4/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResultChapterModel,ChapterlistModel;
@interface ChapterListModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) ResultChapterModel *result;

@property (nonatomic, copy) NSString *reason;
@property (nonatomic, strong) NSArray<ChapterlistModel *> *chapterList;
@end
@interface ResultChapterModel : NSObject

@property (nonatomic, copy) NSString *comicName;

@property (nonatomic, strong) NSArray<ChapterlistModel *> *chapterList;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger limit;

@end

@interface ChapterlistModel : NSObject
/**漫画章节名字*/
@property (nonatomic, copy) NSString *name;
/**漫画章节ID*/
@property (nonatomic, assign) NSInteger id;

@end

