//
//  FBDBTools.h
//  Comic
//
//  Created by mj on 16/4/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;
@class FMDatabase;


@interface FBDBTools : NSObject
@property(nonatomic) FMDatabase *db;
/**创建数据库*/
-(void)creatDataBase:(NSString *)filePath;
/**创建数据表*/
-(void)creatDataTAble:(NSString*)sql;

/** 查询数据*/
-(FMResultSet*)executeQuery:(NSString*)sql;

/** 删除数据*/
-(void)exexuteUpdate:(NSString*)sql;

@end
