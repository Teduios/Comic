//
//  BookViewModel.h
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"
@interface BookViewModel : NSObject
/** 根据UI定义属性和方法 */
/*漫画总数*/
@property(nonatomic)NSInteger rowNumber;
/**漫画名字*/
@property(nonatomic)NSString *name;

/**漫画封面*/
- (NSString *)iconNameForIndex:(NSInteger)index;
/**漫画名字*/
- (NSString *)nameForIndex:(NSInteger)index;
/**漫画描述*/
- (NSString *)descForIndex:(NSInteger)index;
/**最近更新*/
-(NSInteger)lastUpdateForIndex:(NSInteger)index;
/**漫画类型*/
-(NSString*)typeForIndex:(NSInteger)index;
/**漫画区域*/
-(NSString*)areaForIndex:(NSInteger)index;
/**漫画是否完结*/
-(BOOL )finishForIndex:(NSInteger)index;


/** 根据Model定义属性和方法 */
/*漫画列表*/
@property(nonatomic,strong)NSMutableArray<BooklistModel*>*bookList;
/*获取漫画方法*/

-(void)getBookModel:(NSString *)comicName comicType:(NSString *)comicType completionHandler:(void (^)(NSError *error))completionHandler;



@end






