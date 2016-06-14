//
//  BannersViewModel.m
//  Comic
//
//  Created by 孟军 on 16/6/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BannersViewModel.h"
#import "BannersModel.h"
@implementation BannersViewModel
#pragma mark 懒加载

-(NSMutableArray<BannerGroupModel *> *)bannersList{
    
    if (!_bannersList) {
        _bannersList=@[].mutableCopy;
        
    }
    
    return _bannersList;
    
}


-(NSString *)BannersImageNameForIndex:(NSInteger)index{

    return self.bannersList[index].pic;
    
}

-(void)getBannerList:(void (^)(NSError *))completionHandler{

    [TRNetManager getBannerListModel:^(BannersModel *model, NSError *error) {
   
        
        
        
        if (!error ) {
            //将模型添加到数组中
            [self.bannersList removeAllObjects];
            [self.bannersList addObjectsFromArray:model.data.banner_group];
            
        }
        completionHandler(error);
    }];
    






}
@end
