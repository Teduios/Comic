//
//  TRChapterListController.h
//  Comic
//
//  Created by mj on 16/4/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookItem;

@interface TRChapterListController : UITableViewController
/**漫画名字*/
@property(nonatomic,copy) NSString *comictitle;
/**漫画封面*/
@property(nonatomic) NSString *iconName;
/**漫画描述*/
@property(nonatomic) NSString *comicDesc;
/**最近更新*/
@property(nonatomic)  NSInteger updaTime;
/**漫画类型*/
@property(nonatomic) NSString *comicType;
/**漫画区域*/
@property(nonatomic) NSString *comicArea;
/**漫画是否完结*/
@property(nonatomic) BOOL isFinish;
@property(nonatomic) BOOL isCollect;




@end
