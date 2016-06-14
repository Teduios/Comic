//
//  TRTabBar.h
//  新浪项目01
//
//  Created by mj on 16/4/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TRTabBar;

@protocol TRTabBarDelegate<NSObject>
@optional

-(void)tabBarDidClickedPlusButton:(TRTabBar*)tabBar;
@end
@interface TRTabBar : UITabBar
@property(nonatomic,weak)id<TRTabBarDelegate>TabBardelegate;

@end
