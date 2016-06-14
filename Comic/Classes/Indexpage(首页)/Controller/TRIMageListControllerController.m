//
//  TRIMageListControllerController.m
//  Comic
//
//  Created by mj on 16/4/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRIMageListControllerController.h"
#import "ImageListViewModel.h"
@interface TRIMageListControllerController ()<UIScrollViewDelegate>
@property(nonatomic) ImageListViewModel *imageListVM;
@property(nonatomic)UIScrollView *scrollView;
@property(nonatomic)UIImageView *imageView;


@end

@implementation TRIMageListControllerController
#pragma mark ----生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
   

}
-(void)viewWillAppear:(BOOL)animated{
    [self RefreshComic];
}
-(void)RefreshComic{
    if (!_imageListVM.imageList) {
    [self .imageListVM getImageListModel:self.comictitle chapterID:self.chapterID :^(NSError *error) {
        [self setupScrollView];
        }];
        }
}
#pragma mark -懒加载
-(ImageListViewModel *)imageListVM{
    if (!_imageListVM) {
        _imageListVM =[ImageListViewModel new];
    }
    return _imageListVM;
}

/**
 *  添加UISrollView
 */
-(void)setupScrollView{
    // 1.添加UISrollView
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=self.view.bounds;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
       // 2.添加图片
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    for (int i=0; i< self.imageListVM.rowNumber; i++) {
        UIImageView *imageView=[UIImageView new];
        NSString *imagePath=[self.imageListVM imageUrlForIndex:i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:[UIImage imageNamed:@"mine_icon_big_nor"]  options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        }];
        imageView.contentMode=UIViewContentModeScaleAspectFill;
         [scrollView addSubview:imageView];
        // 设置frame
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i * imageW+30;
        self.imageView=imageView;
        
    }
    // 3.设置其他属性
    scrollView.contentSize = CGSizeMake(self.imageListVM.imageList.count * imageW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;

    self.scrollView=scrollView;

   
}
@end
