//
//  ComicMainModel.m
//  Comic
//
//  Created by 孟军 on 16/6/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ComicMainModel.h"

@implementation ComicMainModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [DataModel class],
             };
}
@end


@implementation DataModel



+ (NSDictionary *)modelContainerPropertyGenericClass {
     return @{@"infos" : [InfosModel class]
             };
}

@end


@implementation InfosModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
     return @{@"topics" : [TopicsModel class]
             };
}

@end


@implementation TopicsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"desc" : @"description"
            };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [UserModel class]
             };
}
@end


@implementation UserModel

@end


