//
//  ImageListModel.h
//  NovelApp2
//
//  Created by mj on 16/4/16.
//  Copyright © 2016年 tarena. All rights reserved.
//




#import <Foundation/Foundation.h>

@class ResultImageModel,ImagelistModel;
@interface ImageListModel : NSObject


@property (nonatomic, assign) NSInteger error_code;
/**请求结果*/
@property (nonatomic, strong) ResultImageModel *result;

@property (nonatomic, copy) NSString *reason;
@property (nonatomic, strong) NSArray<ImagelistModel *> *imageList;

@end
@interface ResultImageModel : NSObject
/**内容ID*/
@property (nonatomic, assign) NSInteger chapterId;
/**参数名*/
@property (nonatomic, copy) NSString *comicName;

@property (nonatomic, strong) NSArray<ImagelistModel *> *imageList;

@end

@interface ImagelistModel : NSObject
/**内容ID*/
@property (nonatomic, assign) NSInteger id;
/**漫画图片*/
@property (nonatomic, copy) NSString *imageUrl;

@end

