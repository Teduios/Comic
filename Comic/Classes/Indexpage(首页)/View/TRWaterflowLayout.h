//
//  TRWaterflowLayout.h
//  Comic
//
//  Created by mj on 16/4/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TRWaterflowLayout;

@protocol TRWaterflowLayoutDelegate <NSObject>
@required
- (CGFloat)waterflowLayout:(TRWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout;
@end

@interface TRWaterflowLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<TRWaterflowLayoutDelegate> delegate;
@end
