//
//  PopulCell.m
//  Comic
//
//  Created by 孟军 on 16/6/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PopulCell.h"
@interface PopulCell()
@property(nonatomic)TopicsModel  *topicList;

@end
@implementation PopulCell

-(TopicsModel *)topicList{


    if (!_topicList) {
        _topicList=[TopicsModel new];
        
    }

    return _topicList;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setComicModel:(TopicsModel *)comicModel{
    _topicList=comicModel;
    self.comicNameLabel.text=comicModel.title;
    self.comicAvater.text=comicModel.user.nickname;
     NSString *urlString=comicModel.cover_image_url;
    self.selectionStyle= UITableViewCellSelectionStyleNone;
    [self.populImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    self.dingBtn.hidden=YES;
    self.talkBtn.hidden=YES;
    self.ContentTextView.text=comicModel.desc;
    
}
-(void)setEndComicModel:(TopicsEndModel *)endComicModel{



 NSString *urlString=endComicModel.cover_image_url;

    self.comicNameLabel.text=endComicModel.title;
    self.comicAvater.text=endComicModel.user.nickname;
    self.selectionStyle= UITableViewCellSelectionStyleNone;
    [self.populImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
    
    NSString *dingBtnNumber;
    NSString *talkBtnNumber;
    self.ContentTextView.hidden=YES;
    if (endComicModel.likes_count>=10000) {
        
        dingBtnNumber=[NSString stringWithFormat:@"%.1f万",(endComicModel.likes_count/10000.0)];
        
    }else{
        dingBtnNumber=[NSString stringWithFormat:@"%zd",endComicModel.likes_count ];
    }
    [self.dingBtn setTitle: dingBtnNumber forState:UIControlStateNormal];
    
    
    
    if (endComicModel.comments_count>=10000) {
        talkBtnNumber=[NSString stringWithFormat:@"%.1f万",endComicModel.comments_count/10000.0];
        
    }else{
        talkBtnNumber=[NSString stringWithFormat:@"%zd",endComicModel.comments_count ];
    }
    [self.talkBtn setTitle:talkBtnNumber forState:UIControlStateNormal];
    


}
-(void)setComicContentModel:(ComicContentModel *)comicContentModel{


    NSString *urlString=comicContentModel.cover_image_url;
    
    self.comicNameLabel.text=comicContentModel.title;
//    self.comicAvater.text=comicContentModel.user.nickname;
    self.selectionStyle= UITableViewCellSelectionStyleNone;
    [self.populImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
    
    NSString *dingBtnNumber;
    NSString *talkBtnNumber;
    self.ContentTextView.hidden=YES;
    if (comicContentModel.likes_count>=10000) {
        
        dingBtnNumber=[NSString stringWithFormat:@"%.1f万",(comicContentModel.likes_count/10000.0)];
        
    }else{
        dingBtnNumber=[NSString stringWithFormat:@"%zd",comicContentModel.likes_count ];
    }
    [self.dingBtn setTitle: dingBtnNumber forState:UIControlStateNormal];
    
    
    
    if (comicContentModel.comments_count>=10000) {
        talkBtnNumber=[NSString stringWithFormat:@"%.1f万",comicContentModel.comments_count/10000.0];
        
    }else{
        talkBtnNumber=[NSString stringWithFormat:@"%zd",comicContentModel.comments_count ];
    }
    [self.talkBtn setTitle:talkBtnNumber forState:UIControlStateNormal];








}

@end
