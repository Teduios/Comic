//
//  BookViewModel.m
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BookViewModel.h"
#import "TRNetManager.h"
@implementation BookViewModel
-(NSInteger)rowNumber{
    return self.bookList.count;
}
/**漫画封面*/
- (NSString *)iconNameForIndex:(NSInteger)index{
    
 return [self.bookList[index]coverImg ];
    
    
}

/**漫画名字*/
- (NSString *)nameForIndex:(NSInteger)index{
    return [self.bookList[index]name];
    
}
/**漫画描述*/
- (NSString *)descForIndex:(NSInteger)index{
    return [self.bookList[index]des];
    
}
/**最近更新*/
-(NSInteger)lastUpdateForIndex:(NSInteger)index{
    return [self.bookList [index]lastUpdate];
            
}
/**漫画类型*/
-(NSString*)typeForIndex:(NSInteger)index{
    return [self.bookList[index]type];
    
}
/**漫画区域*/
-(NSString*)areaForIndex:(NSInteger)index{
    return [self.bookList[index]area];
    
}
/**漫画是否完结*/
-(BOOL )finishForIndex:(NSInteger)index{
    return [self.bookList[index]finish];
    
}



#pragma mark 懒加载
-(NSMutableArray<BooklistModel *> *)bookList{

    if (!_bookList) {
        _bookList=@[].mutableCopy;
       
    }
    return _bookList;
    

}


/*获取漫画方法*/
-(void)getBookModel:(NSString *)comicName comicType:(NSString *)comicType completionHandler:(void (^)(NSError *))completionHandler{
    
    
[TRNetManager getBookModel:comicName :comicType completionHandler:^(BookModel *model, NSError *error) {
    if (!error) {
        //将模型添加到数组中
            [self.bookList removeAllObjects];
            [self.bookList addObjectsFromArray:model.result.bookList];
   
           }
           completionHandler(error);
}];

}

@end
