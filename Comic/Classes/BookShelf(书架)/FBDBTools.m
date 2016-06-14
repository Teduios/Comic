//
//  FBDBTools.m
//  Comic
//
//  Created by mj on 16/4/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "FBDBTools.h"



@interface FBDBTools()



@end
@implementation FBDBTools


-(void)creatDataBase:(NSString *)filePath{

    FMDatabase *db = [FMDatabase databaseWithPath:filePath];
    _db = db;
    // 打开数据库
    BOOL flag = [db open];
    if (flag) {
//        NSLog(@"打开成功");
    }else{
//        NSLog(@"打开失败");
    }
    


}

-(void)creatDataTAble:(NSString*)sql{

    [self creatDataBase:FilePath];
    
    // 创建数据库表
    BOOL flag1 = [_db executeUpdate:sql ];
    if (flag1) {
//        NSLog(@"创建成功");
    }else{
//        NSLog(@"创建失败");
    }

}


-(void)execuUpdata:(NSString *)sql{
    
    if ([_db open]) {
      
        BOOL fla = [_db executeUpdate:sql];
        if (fla) {
            //        NSLog(@"success");
        }else{
            //        NSLog(@"failure");
        }
        

    }
    
}

-(FMResultSet*)executeQuery:(NSString*)sql{
     [self creatDataBase:FilePath];
   return   [_db executeQuery:sql];
    

}

-(void)exexuteUpdate:(NSString*)sql{
    
    if ([_db
        open]) {
    
        BOOL flag = [_db executeUpdate:sql];
        if (flag) {
            //        NSLog(@"success");
        }else{
            //        NSLog(@"failure");
        }

        
    }
    
   

}




@end
