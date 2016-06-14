//
//  TRIconCollectionCell.h
//  Comic
//
//  Created by mj on 16/4/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRIconCollectionCell : UICollectionViewCell
//图片视图
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
//漫画名标签
@property (weak, nonatomic) IBOutlet UILabel *comicNameLabel;


@end
