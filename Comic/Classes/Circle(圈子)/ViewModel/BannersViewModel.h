//
//  BannersViewModel.h
//  Comic
//
//  Created by 孟军 on 16/6/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BannersModel;
@class BannerGroupModel;



@interface BannersViewModel : NSObject


/*漫画列表*/
@property(nonatomic,strong)NSMutableArray<BannerGroupModel*>*bannersList;

/**漫画Banner封面*/
- (NSString *)BannersImageNameForIndex:(NSInteger)index;

/*获取Banner方法*/

-(void)getBannerList:(void (^)(NSError *error))completionHandler;
@end
