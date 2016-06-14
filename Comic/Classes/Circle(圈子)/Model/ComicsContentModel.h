//
//  ComicsContentModel.h
//  Comic
//
//  Created by 孟军 on 16/6/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DataContentModel,UserContentModel,ComicContentModel;
@interface ComicsContentModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DataContentModel *data;

@property (nonatomic, assign) NSInteger code;

@end

@interface DataContentModel : NSObject

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, assign) BOOL is_favourite;

@property (nonatomic, strong) UserContentModel *user;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, copy) NSString *discover_image_url;

@property (nonatomic, assign) NSInteger label_id;

@property (nonatomic, strong) NSArray<ComicContentModel *> *comics;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, assign) NSInteger updated_at;

@property (nonatomic, copy) NSString *vertical_image_url;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, assign) NSInteger comics_count;

@property (nonatomic, assign) NSInteger fav_count;

@property (nonatomic, assign) NSInteger likes_count;

@end

@interface UserContentModel : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) NSInteger grade;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *reg_type;

@end

@interface ComicContentModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSInteger likes_count;

@property (nonatomic, assign) NSInteger topic_id;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, assign) NSInteger updated_at;

@property (nonatomic, copy) NSString *url;

@end

