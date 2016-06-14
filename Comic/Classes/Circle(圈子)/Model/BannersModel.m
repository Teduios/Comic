//
//  BannersModel.m
//  Comic
//
//  Created by 孟军 on 16/6/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BannersModel.h"

@implementation BannersModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"data" : [BannersDataModel class]};
}

@end
@implementation BannersDataModel



+ (NSDictionary *)modelContainerPropertyGenericClass {
   return @{@"banner_group" : [BannerGroupModel class],
            };
}


@end


@implementation BannerGroupModel

@end


