//
//  BookItem.m
//  Comic
//
//  Created by mj on 16/4/22.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BookItem.h"

@implementation BookItem
// 归档方法
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.iconNameURL forKey:@"iconNameURL"];
    [aCoder encodeObject:self.comicDesc forKey:@"comicDesc"];
    [aCoder encodeObject:self.comicArea forKey:@"comicArea"];
    [aCoder encodeObject:self.comicType forKey:@"comicType"];
    [aCoder encodeInteger:self.updateTiem forKey:@"updateTime"];
    [aCoder encodeBool:self.isFinish forKey:@"isFinish"];
    
    
}
// 反归档方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self != nil) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.iconNameURL = [aDecoder decodeObjectForKey:@"iconNameURL"];
       self.comicDesc = [aDecoder decodeObjectForKey:@"comicDesc"];
       self.comicArea = [aDecoder decodeObjectForKey:@"comicArea"];
       self.comicType = [aDecoder decodeObjectForKey:@"comicType"];
       self.updateTiem=[aDecoder decodeIntForKey:@"updateTime"];
        self.isFinish=[aDecoder decodeBoolForKey:@"isFinish"];
        
        
        
    }
    return self;
}
@end
