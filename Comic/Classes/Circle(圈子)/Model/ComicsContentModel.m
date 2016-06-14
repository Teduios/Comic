//
//  ComicsContentModel.m
//  Comic
//
//  Created by 孟军 on 16/6/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ComicsContentModel.h"

@implementation ComicsContentModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [DataContentModel class]
             };
}
@end






@implementation DataContentModel


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"comics" : [ComicContentModel class],
             @"user" : [UserContentModel class]
             };
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"des" : @"description"
             };
}
@end


@implementation UserContentModel

@end


@implementation ComicContentModel

@end


