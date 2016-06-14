//
//  BookModel.m
//  NovelApp2
//
//  Created by mj on 16/4/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bookList" : [BooklistModel class],
            @"result":[ResultModel class]};
}

@end
@implementation ResultModel



+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bookList" : [BooklistModel class],
             @"result":[ResultModel class]};
}

@end


@implementation BooklistModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bookList" : [BooklistModel class]};
}

@end


