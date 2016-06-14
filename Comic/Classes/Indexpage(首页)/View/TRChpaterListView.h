//
//  TRChpaterListView.h
//  Comic
//
//  Created by mj on 16/4/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRChpaterListView : UIView
@property (weak, nonatomic) IBOutlet UILabel *comicTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *comicAreaLabel;

@property (weak, nonatomic) IBOutlet UILabel *comicUpdatetimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *comicDescLabel;
@property (weak, nonatomic) IBOutlet UIImageView *comicIconImageView;
@end
