//
//  ComicScrollView.h
//  Comic
//
//  Created by 孟军 on 16/6/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComicScrollView : UIScrollView

-(ComicScrollView*)CreatScrollView:(InfosModel*)comicList;
-(ComicScrollView *)setupScrollView:(EndComicModel*)comicList;
@end
