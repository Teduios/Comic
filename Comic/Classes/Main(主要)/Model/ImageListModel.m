//
//  ImageListModel.m
//  NovelApp2
//
//  Created by mj on 16/4/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ImageListModel.h"

@implementation ImageListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
   return @{@"imageList" : [ImagelistModel class],
            @"result":[ResultImageModel class]            };
}
@end
@implementation ResultImageModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imageList" : [ImagelistModel class],
             @"result":[ResultImageModel class]            };
}
@end


@implementation ImagelistModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"imageList" : [ImagelistModel class],
             @"result":[ResultImageModel class]            };
}
@end


