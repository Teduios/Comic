//
//  UIImage+ResizedImage.h
//  新浪项目01
//
//  Created by mj on 16/4/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizedImage)
/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

@end
