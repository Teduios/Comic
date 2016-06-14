//
//  EndComicModel.m
//  Comic
//
//  Created by 孟军 on 16/6/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "EndComicModel.h"

@implementation EndComicModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [DataEndModel class]
             };
}
@end
@implementation DataEndModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"topics" : [TopicsEndModel class]
             };
}

@end


@implementation TopicsEndModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"desc" : @"description"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [UserEndModel class]
             };
}
@end


@implementation UserEndModel

@end


