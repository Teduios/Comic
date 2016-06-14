//
//  ComicMainModel.h
//  Comic
//
//  Created by 孟军 on 16/6/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataModel,InfosModel,TopicsModel,UserModel;
@interface ComicMainModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface DataModel : NSObject

@property (nonatomic, strong) NSArray<InfosModel *> *infos;

@end

@interface InfosModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<TopicsModel *> *topics;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *action;

@end

@interface TopicsModel : NSObject

@property (nonatomic, copy) NSString *cover_image_url;
//*description->desc
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

@property (nonatomic, assign) NSInteger comics_count;
@property (nonatomic, strong) UserModel *user;

@end

@interface UserModel : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) NSInteger grade;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *reg_type;

@end

