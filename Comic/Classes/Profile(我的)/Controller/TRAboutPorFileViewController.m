//
//  TRAboutPorFileViewController.m
//  Comic
//
//  Created by mj on 16/4/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRAboutPorFileViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface TRAboutPorFileViewController ()

@end

@implementation TRAboutPorFileViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    //    cell.contents = (__bridge id)[UIImage imageNamed:@"47b5e3384e311b4f.jpg"].CGImage;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // =================== 背景图片 ===========================
    UIImageView * backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    backgroundView.image = [UIImage imageNamed:@"樱花树1"];
    backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundView];
    
    
    // =================== 樱花飘落 ====================
    CAEmitterLayer * snowEmitterLayer = [CAEmitterLayer layer];
    snowEmitterLayer.emitterPosition = CGPointMake(100, -30);
    snowEmitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    //    snowEmitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (__bridge id)[UIImage imageNamed:@"樱花瓣2"].CGImage;
    
    // 花瓣缩放比例
    snowCell.scale = 0.02;
    snowCell.scaleRange = 0.5;
    
    // 每秒产生的花瓣数量
    snowCell.birthRate = 7;
    snowCell.lifetime = 80;
    
    // 每秒花瓣变透明的速度
    snowCell.alphaSpeed = -0.01;
    
    // 秒速“五”厘米～～
    snowCell.velocity = 40;
    snowCell.velocityRange = 60;
    
    // 花瓣掉落的角度范围
    snowCell.emissionRange = M_PI;
    
    // 花瓣旋转的速度
    snowCell.spin = M_PI_4;
    
    // 每个cell的颜色
    //    snowCell.color = [[UIColor redColor] CGColor];
    
    // 阴影的 不透明 度
    snowEmitterLayer.shadowOpacity = 1;
    // 阴影化开的程度（就像墨水滴在宣纸上化开那样）
    snowEmitterLayer.shadowRadius = 8;
    // 阴影的偏移量
    snowEmitterLayer.shadowOffset = CGSizeMake(3, 3);
    // 阴影的颜色
    snowEmitterLayer.shadowColor = [[UIColor whiteColor] CGColor];
    
    
    snowEmitterLayer.emitterCells = [NSArray arrayWithObject:snowCell];
    [backgroundView.layer addSublayer:snowEmitterLayer];
    
    
    
    
    
}



@end
