//
//  UIImage+ResizedImage.m
//  新浪项目01
//
//  Created by mj on 16/4/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIImage+ResizedImage.h"

@implementation UIImage (ResizedImage)
#pragma mark 可拉伸图片
+(UIImage *)resizedImage:(NSString *)name{

    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}


@end
