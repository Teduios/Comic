//
//  TRProfileController.m
//  NovelApp
//
//  Created by mj on 16/4/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRProfileController.h"
#import <SDWebImage/SDImageCache.h>
#import <SDImageCache.h>
#import "SDWebImageCompat.h"
#import "TRBookShelfController.h"
#import "TRNavigatonController.h"
#import "TRAboutPorFileViewController.h"
@interface TRProfileController ()
@end
@implementation TRProfileController

- (void)viewDidLoad {
    [super viewDidLoad];


    /**去掉分割线*/
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}
-(void)viewDidAppear:(BOOL)animated{
[self.tableView reloadSection:0 withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.userInteractionEnabled=YES;
    
    if (indexPath.section==0) {
        cell.textLabel.text=@"清空缓存";
        cell.imageView.image=[UIImage imageNamed:@"delete"];
        NSString *title = nil;
        NSUInteger size = [SDImageCache sharedImageCache].getSize;
        if (size > 1024 * 1024) {
            CGFloat floatSize = size / 1024.0 / 1024.0;
            title = [NSString stringWithFormat:@"%.fM",floatSize];
        }else if (size > 1024){
            CGFloat floatSize = size / 1024.0;
            title = [NSString stringWithFormat:@"%.fKB",floatSize];
        }else if(size > 0)
        {
            title = [NSString stringWithFormat:@"%ldKB",(unsigned long)size];
        }
        cell.detailTextLabel.text = title;
    }else if(indexPath.section==1){
        
     cell.textLabel.text=@"收藏";
        cell.imageView.image=[UIImage imageNamed:@"collect_normal"];
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;

        
    }
    else{
    
       cell.textLabel.text=@"关于我们";
       cell.imageView.image=[UIImage imageNamed:@"pencil_normal"];
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        

    }
    
    
    return cell;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section==0) {
        return @"系统设置";
        
    }else if(section==1){
     return @"我的收藏";
    }else{
    return @"意见反馈";
        
    }


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        //清空缓存
        [[SDImageCache sharedImageCache] clearDisk];
        [self.tableView reloadData];        //刷新缓存大小
        [self.tableView reloadSection:0 withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if(indexPath.section==1)
    {

        NSLog(@"收藏");
        
        TRBookShelfController *shelfVC=[TRBookShelfController new];
        shelfVC.title=@"书架";
        
        [self.navigationController pushViewController:shelfVC animated:YES];
    }else if(indexPath.section==2){
    
        TRAboutPorFileViewController *aboutPorfile=[TRAboutPorFileViewController new];
        aboutPorfile.title=@"关于我们";
        [self.navigationController pushViewController:aboutPorfile animated:YES];
        
    
    
    
    }
    


}

@end
