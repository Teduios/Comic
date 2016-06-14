//
//  TRScrollView.m
//  Comic
//
//  Created by mj on 16/4/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRScrollView.h"

@implementation TRScrollView


/**
 *  添加UISrollView
 */
-(void)setupScrollViewWith:(TRScrollView*)scrollView
{
    // 1.添加UISrollView

    // 2.添加图片
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    CGFloat imageCount=5;
    
    for (int i = 0; i<imageCount; i++) {
        // 创建UIImageView
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"pic%d", i + 1];
    
        
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        // 设置frame
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i * imageW;
        
    }
    
    // 3.设置其他属性
    scrollView.contentSize = CGSizeMake(imageCount * imageW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    
}

/**
 *  添加pageControl
 */
- (void)setupPageControlWith:(UIPageControl *)pageControl
{
       pageControl.numberOfPages = 5;
    pageControl.centerX = self.width * 0.5;
    pageControl.centerY = self.height - 30;
  
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor]; // 当前页的小圆点颜色
    pageControl.pageIndicatorTintColor = [UIColor grayColor]; // 非当前页的小圆点颜色

}

@end
