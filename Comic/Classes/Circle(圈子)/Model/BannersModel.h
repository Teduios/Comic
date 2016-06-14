//
//  BannersModel.h
//  Comic
//
//  Created by 孟军 on 16/6/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BannersDataModel,BannerGroupModel;
@interface BannersModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) BannersDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface BannersDataModel : NSObject

@property (nonatomic, strong) NSArray<BannerGroupModel *> *banner_group;

@end

@interface BannerGroupModel : NSObject

@property (nonatomic, copy) NSString *value;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger type;

@end

