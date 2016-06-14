//
//  TRCircleController.m
//  NovelApp
//
//  Created by mj on 16/4/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRCircleController.h"
#import "BannersModel.h"
#import "UIScrollRollView.h"
#import "BannersViewModel.h"
#import "ComicMainModel.h"
#import "PopulCell.h"
#import "ChartsCell.h"
#import "EndComicModel.h"
#import "MoreViewController.h"
#import "ComicContentViewController.h"
#import "ComicScrollView.h"
@interface TRCircleController ()
@property(nonatomic)UIScrollRollView *scrollView;
@property(nonatomic)BannersModel * banner;
@property(nonatomic)ComicMainModel  *comicsArrsy;
@property(nonatomic)InfosModel  *inforslist;
@property(nonatomic)EndComicModel  *endComicList;
@property(nonatomic)NSString *tagName;
@property(nonatomic)NSString *VcTitle;
@property(nonatomic)UIView *selectedView;
@property(nonatomic)NSMutableArray *comicsList;





@end

@implementation TRCircleController


#pragma mark -lay


-(NSMutableArray *)comicsList{
    if (!_comicsList) {
        _comicsList=@[].mutableCopy;
        
    }

    return _comicsList;
}
-(EndComicModel *)endComicList{

    if (!_endComicList) {
        _endComicList=[EndComicModel new];
        
    }

    return _endComicList;
}



-(InfosModel *)inforslist{

    if (!_inforslist) {
        _inforslist=[InfosModel new];
        
    }

    return _inforslist;
}

-(ComicMainModel *)comicsArrsy{



    if (!_comicsArrsy) {
        _comicsArrsy=[ComicMainModel new];
        
    }

    return _comicsArrsy;
}
-(UIScrollRollView *)scrollView{

    if (!_scrollView) {
        _scrollView=[UIScrollRollView new];
        
    }
    return _scrollView;
    


}


-(BannersModel *)banner{

    if (!_banner) {
        _banner =[BannersModel new];
        
    }
    return _banner;

}

-(void)RefreshList
{
    MJWeakSelf;
    
        [TRNetManager getBannerListModel:^(BannersModel *model, NSError *error) {
    
            
            self.banner=model;
            [self.tableView reloadData];
            [self setAoutScrollViews];
//
            
        }];
    [TRNetManager getComicListModel:^(ComicMainModel *model, NSError *error) {
 
        
        self.comicsArrsy =model;
        
        
        
  [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView reloadData];

    }];
    
    
    
    

    [TRNetManager getEndComicModel:self.tagName :^(EndComicModel *model, NSError *error) {
          self.endComicList=model;
    }];
    
    

}

- (void)setupRefresh
{
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(RefreshList)];
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    


}


-(void)setCell{


    self.tableView .separatorStyle= UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PopulCell" bundle:nil] forCellReuseIdentifier:@"popCell"];
  [self.tableView registerNib:[UINib nibWithNibName:@"ChartsCell" bundle:nil] forCellReuseIdentifier:@"chartsCell"];
//    
}

-(void)viewDidLoad{

    [super viewDidLoad];
       [self setAoutScrollViews];
    self.view .backgroundColor=[UIColor whiteColor] ;
      [self setupRefresh];
    [self setCell];
    

    
    

    
}

-(void)setAoutScrollViews{
    
    if (self.banner.data.banner_group.count>0) {
     [self.scrollView setupScroollArray:self.banner isAutoRun:YES];
        self.scrollView.size=CGSizeMake(kSCREENW, 230);
        self.scrollView.backgroundColor=[UIColor orangeColor];
        self.tableView.tableHeaderView=self.scrollView;
    }
    
  


}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{


    return 5;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {

        return 2;
        
    }
    
    else if (section==1){
   
    
        return 1;
    }
    else if(section==2){
    
        
        return 2;
        
    }
    
    else if (section==3){

    
        return 3;
    }else if (section==4){
     self.tagName=@"已完结";
        return 1;
        
    }
   
 
    return 6;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row=indexPath.row;
    NSInteger section=indexPath.section;
    
    self.inforslist=self.comicsArrsy.data.infos [section];

    if (indexPath.section==0||section==3) {
        PopulCell * cell=[tableView dequeueReusableCellWithIdentifier:@"popCell"];
    
        if (self.inforslist.topics.count>0) {
                [self.comicsList addObjectsFromArray:self.inforslist.topics];
            cell.comicModel=self.comicsList[indexPath.row];
            self.tableView.rowHeight=100;
           
        }
         return cell;
        }
    else if (section==1){
        ComicScrollView * ScrollViw = [[ComicScrollView alloc] initWithFrame:CGRectMake(10, 7, kSCREENW, 100)];
        [ScrollViw  CreatScrollView:self.inforslist];
        UITableViewCell *cell=[[UITableViewCell alloc]init ];
        [cell.contentView addSubview: ScrollViw];
         cell.selectionStyle= UITableViewCellSelectionStyleNone;
         self.tableView.rowHeight=100;
        return cell;
        
    }    else if (indexPath.section==2){
        
        NSString *urlString=self.inforslist.topics[row].cover_image_url;
            ChartsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"chartsCell"];
            [cell.iconImageView  sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
            self.tableView.rowHeight=170;
     cell.selectionStyle= UITableViewCellSelectionStyleNone;
            return cell;
            
        }
    
    else{
        ComicScrollView * ScrollViw = [[ComicScrollView alloc] initWithFrame:CGRectMake(10, 7, kSCREENW, 100)];
        [ScrollViw setupScrollView:self.endComicList];
        
                UITableViewCell *cell=[[UITableViewCell alloc]init ];
        [cell.contentView addSubview: ScrollViw];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        self.tableView.rowHeight=100;
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    if (section==0) {
        
        return 25;
        
    }
    return 20;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{


    if (section==0||section==1) {
        return 0;
        
    }
    return 10;
   
}



-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

  //自定义View设置
    
    UIButton *btn=[UIButton new];
    btn.frame=CGRectMake(kSCREENW-100, 12,100, 10);
    ;
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 150, 10)];
    lab.textColor=[UIColor grayColor];
    lab.font=[UIFont systemFontOfSize:15];
    lab.textAlignment=NSTextAlignmentLeft;
    UIView *view  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREENW, 30)];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    
    [btn addTarget:self action:@selector(more:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"更多" forState:UIControlStateNormal];
    [view addSubview:lab];
    [view addSubview:btn];
    

    

    if (section==0) {
    lab.text=self.comicsArrsy.data.infos [section].title;
        [btn setTag:10];
        
    
        return view;
     
    }
    else if(section==1){
    
    lab.text=self.comicsArrsy.data.infos [section].title;
  [btn setTag:11];
        return view;
        
    }
    else if (section==2){
  
    lab.text=self.comicsArrsy.data.infos [section].title;
   [btn setTag:12];
        return view;
        
    }
    else if (section==3){

    lab.text=self.comicsArrsy.data.infos [section].title;
         [btn setTag:13];
        return view;
        
    }
    else if (section==4){
        
         [btn setTag:14];
        lab.text=@"已完结";
        return view;
        
    }


    return view;


}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  ComicContentViewController *ContentVC=[ComicContentViewController new];
        ContentVC.bookId=self.comicsArrsy.data.infos[indexPath.section].topics[indexPath.row].id;
  [self.navigationController pushViewController:ContentVC animated:YES];

}

-(void)more:(UIButton*)btn{
    
  
    
    if (btn.tag==10) {
        self.VcTitle=@"人气飙升";
    }else if (btn.tag==11){
        self.VcTitle=@"每周排行榜";
        
    }else if (btn.tag==12){
        self.VcTitle=@"新作出炉";
        
    }
    else if (btn.tag==13){
        self.VcTitle=@"主编力推";
        
    }else if (btn.tag==14){
        self.VcTitle=self.tagName;
        
        
    }

    MoreViewController *moveVc=[MoreViewController new];
    [self.navigationController pushViewController:moveVc animated:YES];
    moveVc.title=self.VcTitle;
}
@end
