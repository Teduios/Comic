//
//  BookModel.h
//  NovelApp2
//
//  Created by mj on 16/4/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResultModel,BooklistModel;
@interface BookModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, strong) ResultModel *result;

@property (nonatomic, copy) NSString *reason;

@property (nonatomic, strong) NSArray<BooklistModel *> *bookList;

@end

@interface ResultModel : NSObject

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger limit;

@property (nonatomic, strong) NSArray<BooklistModel *> *bookList;

@end

@interface BooklistModel : NSObject
/**漫画是否完结*/
@property (nonatomic, assign) BOOL finish;
/**漫画区域*/
@property (nonatomic, copy) NSString *area;
/**漫画封面*/
@property (nonatomic, copy) NSString *coverImg;
/**漫画类型*/
@property (nonatomic, copy) NSString *type;
/**最近更新*/
@property (nonatomic, assign) NSInteger lastUpdate;
/**漫画名字*/
@property (nonatomic, copy) NSString *name;
/**漫画描述*/
@property (nonatomic, copy) NSString *des;

@end

