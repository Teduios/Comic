//
//  TRComicImageCell.h
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRComicImageCell : UITableViewCell
/**封面图片*/
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/**漫画名字*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**最近更新*/

@property (weak, nonatomic) IBOutlet UILabel *lastUpdateLable;

/**漫画是否完结*/
@property (weak, nonatomic) IBOutlet UILabel *isFinishLabel;

@end
