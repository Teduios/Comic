//
//  ComicContentViewController.m
//  Comic
//
//  Created by 孟军 on 16/6/4.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "ComicsContentModel.h"
#import "ComicContentViewController.h"
#import "PopulCell.h"
#import "WebViewControl.h"

@interface ComicContentViewController ()
@property(nonatomic)ComicsContentModel *comiscsList;
@property(nonatomic )BOOL isContent;


@end

@implementation ComicContentViewController


-(ComicsContentModel *)comiscsList{

    if (!_comiscsList) {
        _comiscsList=[ComicsContentModel new];
        
    }


    return _comiscsList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView .separatorStyle= UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PopulCell" bundle:nil] forCellReuseIdentifier:@"popCell"];
    [self setContentHead];
    [self RefreshList];
 

}



-(void)RefreshList
{
    MJWeakSelf;
    
    

    
    

        [TRNetManager getEndComicContentModel:self.bookId :^(ComicsContentModel *model, NSError *error) {
            self.comiscsList=model;
            
            [weakSelf.tableView reloadData];
              [self setContentHead];
        }];
   
    
    
    
    
    
    
    
}
-(void)setContentHead{
    CGRect rect=CGRectMake(0, 0, kSCREENW, 230);
    UIView *view=[[UIView alloc]initWithFrame:rect];
    view.backgroundColor=[UIColor grayColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:rect];
    NSString *urlString=self.comiscsList.data.cover_image_url ;
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    [view addSubview:imageView];
    self.tableView.tableHeaderView=view;

    
    


}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
        
        
    }
    
    if (!self.isContent) {
        return self.comiscsList.data.comics.count;

    }else{
    
        return 1;
        
    }
  }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        CGFloat viewH=50;
        
        UITableViewCell *cell=[[UITableViewCell alloc]init ];
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREENW, viewH)];
  
        UIButton *leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, kSCREENW/2-0.5, viewH)];
        view.backgroundColor=[UIColor grayColor];
        
        
        leftBtn.backgroundColor=[UIColor whiteColor];
        [leftBtn setTitle:@"内容简介" forState:UIControlStateNormal];
             [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(ContentClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(kSCREENW/2+0.5,0 ,kSCREENW/2-0.5, viewH)];
        [rightBtn addTarget:self action:@selector(lastClick) forControlEvents:UIControlEventTouchUpInside];

        [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
          [rightBtn setTitle:@"最新章节" forState:UIControlStateNormal];
        rightBtn.backgroundColor=[UIColor whiteColor];
        [view addSubview:leftBtn];
        [view addSubview:rightBtn];
        [cell.contentView addSubview:view];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        self.tableView.rowHeight=viewH;
        return cell;
    }
    if (!self.isContent) {
        PopulCell * cell=[tableView dequeueReusableCellWithIdentifier:@"popCell"];
        cell.comicContentModel=self.comiscsList.data.comics[indexPath.row];
        cell.comicAvater.text=self.comiscsList.data.user.nickname;
        
                self.tableView.rowHeight=80;
        return cell;
    }else{
        UITableViewCell *cell=[[UITableViewCell alloc]init];
        cell.textLabel .numberOfLines=0;
        cell.textLabel.font= [UIFont systemFontOfSize:12];
        cell.textLabel.text=self.comiscsList.data.des;
   
        
        
        return cell;
        
    }
    
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section==1) {
        if (!self.isContent) {
               return @"章节列表"; 
        }
    
        
    }
    return nil;
    

}

-(void)ContentClick{
    
    self.isContent=YES;
    [self.tableView reloadData];
    

}
-(void)lastClick{
    self.isContent=NO;
     [self.tableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        if (!self.isContent) {
            
            WebViewControl *webVc=[WebViewControl new];
            [self.navigationController pushViewController: webVc animated:YES];
            webVc.urlStirng=self.comiscsList.data.comics[indexPath.row].url;
            
            
            
        }
    }




}

@end
