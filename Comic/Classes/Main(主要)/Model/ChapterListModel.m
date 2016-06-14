//
//  ChapterListModel.m
//  NovelApp2
//
//  Created by mj on 16/4/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ChapterListModel.h"

@implementation ChapterListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"chapterList" : [ChapterlistModel class],
             @"result":[ResultChapterModel class]};
}
@end
@implementation ResultChapterModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"chapterList" : [ChapterlistModel class],
             @"result":[ResultChapterModel class]};
}
@end


@implementation ChapterlistModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"chapterList" : [ChapterlistModel class]
           };
}
@end


