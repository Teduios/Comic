//
//  TRComicImageCell.m
//  NovelApp2
//
//  Created by mj on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRComicImageCell.h"

@implementation TRComicImageCell

- (void)awakeFromNib {
    //用于去掉cell的左侧空隙
    self.separatorInset = UIEdgeInsetsZero;
    self.layoutMargins = UIEdgeInsetsZero;
    self.preservesSuperviewLayoutMargins = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
