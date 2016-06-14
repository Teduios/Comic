//
//  ImageListViewModel.h
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ImageListModel.h"
@interface ImageListViewModel : NSObject
/** 根据UI定义属性和方法 */

/*漫画页总数*/
@property(nonatomic)NSInteger rowNumber;



/** 根据Model定义属性和方法 */
@property(nonatomic)NSMutableArray<ImagelistModel*> *imageList;

/**漫画内容图片*/
-(NSString*)imageUrlForIndex:(NSInteger)index;


/**获取漫画内容图片*/
-(void)getImageListModel:(NSString*)comicName chapterID:(NSInteger)chapterId
:(void(^)(NSError *error))completionHandler;


@end
