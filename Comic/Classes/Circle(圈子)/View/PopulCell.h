//
//  PopulCell.h
//  Comic
//
//  Created by 孟军 on 16/6/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComicMainModel.h"
#import "EndComicModel.h"
#import "ComicsContentModel.h"
@interface PopulCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *populImageView;
@property (weak, nonatomic) IBOutlet UILabel *comicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *comicAvater;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
@property (weak, nonatomic) IBOutlet UITextView *ContentTextView;
@property(nonatomic)TopicsModel *comicModel;
@property(nonatomic)TopicsEndModel *endComicModel;
@property(nonatomic)ComicContentModel *comicContentModel;

@end
