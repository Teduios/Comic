//
//  EndComicModel.h
//  Comic
//
//  Created by 孟军 on 16/6/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataEndModel,TopicsEndModel,UserEndModel;
@interface EndComicModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DataEndModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface DataEndModel : NSObject

@property (nonatomic, strong) NSArray<TopicsEndModel *> *topics;

@end

@interface TopicsEndModel : NSObject

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) BOOL is_favourite;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, copy) NSString *discover_image_url;

@property (nonatomic, assign) NSInteger label_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger user_id;

@property (nonatomic, assign) NSInteger order;

@property (nonatomic, assign) NSInteger updated_at;

@property (nonatomic, copy) NSString *vertical_image_url;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, assign) NSInteger comics_count;

@property (nonatomic, assign) NSInteger likes_count;

@property (nonatomic, strong) UserEndModel *user;

@end

@interface UserEndModel : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) NSInteger grade;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *reg_type;

@end

