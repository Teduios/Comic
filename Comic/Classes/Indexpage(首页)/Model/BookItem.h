//
//  BookItem.h
//  Comic
//
//  Created by mj on 16/4/22.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookItem : NSObject<NSCoding>
/**漫画名字*/
@property(nonatomic)NSString *name;
/**漫画封面*/
@property(nonatomic)NSString *iconNameURL;
/**漫画描述*/
@property(nonatomic) NSString *comicDesc;
/**最近更新*/
@property(nonatomic) NSInteger  updateTiem;
/**漫画类型*/
@property(nonatomic) NSString *comicType;
/**漫画区域*/
@property(nonatomic) NSString *comicArea;
/**漫画是否完结*/
@property(nonatomic)BOOL isFinish;


 

@end
