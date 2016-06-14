//
//  MoreViewController.m
//  Comic
//
//  Created by 孟军 on 16/6/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MoreViewController.h"
#import "ComicMainModel.h"
#import "PopulCell.h"
#import "ComicContentViewController.h"
@interface MoreViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic)ComicMainModel  *comicsArrsy;
@property(nonatomic)InfosModel  *inforslist;
@property(nonatomic)NSInteger index;
@property(nonatomic)EndComicModel  *endComicList;
@property(nonatomic)NSString *tagName;
@property(nonatomic)BOOL isEndComicModel;
@property (retain, nonatomic)UIPanGestureRecognizer *panGesture;
@property(nonatomic) UIView *overLay;
@property(nonatomic) BOOL isHidden;

@end

@implementation MoreViewController

#pragma mark lay
-(EndComicModel *)endComicList{
    
    if (!_endComicList) {
        _endComicList=[EndComicModel new];
        
    }
    
    return _endComicList;
}
-(ComicMainModel *)comicsArrsy{
    
    
    
    if (!_comicsArrsy) {
        _comicsArrsy=[ComicMainModel new];
        
    }
    
    return _comicsArrsy;
}


-(InfosModel *)inforslist{
    
    if (!_inforslist) {
        _inforslist=[InfosModel new];
        
    }
    
    return _inforslist;
}



-(void)followRollingScrollView{


    self.panGesture = [[UIPanGestureRecognizer alloc] init];
    self.panGesture.delegate=self;
    self.panGesture.minimumNumberOfTouches = 1;
    [self.panGesture addTarget:self action:@selector(handlePanGesture:)];
    [self.tableView addGestureRecognizer:self.panGesture];
    self.overLay = [[UIView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    self.overLay.alpha=0;
    self.overLay.backgroundColor=self.navigationController.navigationBar.barTintColor;
    [self.navigationController.navigationBar addSubview:self.overLay];
    [self.navigationController.navigationBar bringSubviewToFront:self.overLay];

}

#pragma mark - 手势调用函数
-(void)handlePanGesture:(UIPanGestureRecognizer *)panGesture
{
    CGPoint translation = [panGesture translationInView:[self.tableView superview]];
    
   

    //显示
    if (translation.y >= 5) {
        if (self.isHidden) {
            
            self.overLay.alpha=0;
            CGRect navBarFrame=self.navigationController.navigationBar.frame;
            CGRect scrollViewFrame=self.tableView.frame;
            navBarFrame.origin.y = 20;
            scrollViewFrame.origin.y += 44;
            scrollViewFrame.size.height -= 44;
            
            [UIView animateWithDuration:0.2 animations:^{
                self.navigationController.navigationBar.frame = navBarFrame;
                self.tableView.frame=scrollViewFrame;
                
            }];
            self.isHidden= NO;
        }
    }
    
    //隐藏
    if (translation.y <= -20) {
        if (!self.isHidden) {
            CGRect frame =self.navigationController.navigationBar.frame;
            CGRect scrollViewFrame=self.tableView.frame;
            frame.origin.y = -24;
            scrollViewFrame.origin.y -= 44;
            scrollViewFrame.size.height += 44;
            
            [UIView animateWithDuration:0.2 animations:^{
                self.navigationController.navigationBar.frame = frame;
                self.tableView.frame=scrollViewFrame;
                
                self.overLay.alpha=1;
            }];
            self.isHidden=YES;
        }
    }
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self swich];
    [self RefreshList];    
    
    self.tableView .separatorStyle= UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PopulCell" bundle:nil] forCellReuseIdentifier:@"popCell"];
    
    }


-(void)swich{

    if ([self.title isEqualToString:@"人气飙升"]) {
         _isEndComicModel=NO;
        self.index=0;
        
        
        
    }else if ([self.title isEqualToString:@"每周排行榜"]){
                 _isEndComicModel=NO;
    
        self.index=1;
        
    }else if ([self.title isEqualToString:@"新作出炉"]){
                 _isEndComicModel=NO;
        
        self.index=2;
        
    }else if ([self.title isEqualToString:@"主编力推"]){
                 _isEndComicModel=NO;
        
        self.index=3;
        
    }else{
    
        _isEndComicModel=YES;
        self.tagName=self.title;

        
    }

}

-(void)RefreshList
{
    MJWeakSelf;
    
    
        [TRNetManager getComicListModel:^(ComicMainModel *model, NSError *error) {
            
            
            self.comicsArrsy =model;
            
            
            [weakSelf.tableView reloadData];
            
        }];
        

    if (_isEndComicModel) {
        [TRNetManager getEndComicModel:self.tagName :^(EndComicModel *model, NSError *error) {
            self.endComicList=model;
            [weakSelf.tableView reloadData];
        }];
    }
    
    
   

    
    
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isEndComicModel) {
            return self.endComicList.data.topics.count;
    }
       return self.comicsArrsy.data.infos[self.index].topics.count;

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     self.tableView.rowHeight=100;
    if (_isEndComicModel) {
       
        PopulCell * cell=[tableView dequeueReusableCellWithIdentifier:@"popCell"];
        cell.endComicModel=self.endComicList.data.topics[indexPath.row];
                return cell;
        
           }
        self.inforslist=self.comicsArrsy.data.infos [self.index];
        PopulCell * cell=[tableView dequeueReusableCellWithIdentifier:@"popCell"];
    cell.comicModel=self.inforslist.topics[indexPath.row];
    
return cell;


}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
            ComicContentViewController *ContentVC=[ComicContentViewController new];
    
    if (_isEndComicModel) {

        ContentVC.bookId=self.endComicList.data.topics[indexPath.row].id;

        
    }else{
    
    
        ContentVC.bookId=self.inforslist.topics[indexPath.row].id;
        
    }
  [self.navigationController pushViewController:ContentVC animated:YES];



}

@end
