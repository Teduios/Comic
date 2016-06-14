    //
//  TRChapterListController.m
//  Comic
//
//  Created by mj on 16/4/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRChapterListController.h"
#import "ChapterListViewModel.h"
#import "TRIMageListControllerController.h"
#import "TRChpaterListView.h"
#import "BookViewModel.h"
#import "BookItem.h"


@interface TRChapterListController ()
/**章节列表*/
@property(nonatomic) ChapterListViewModel *chapterListVM;

/**选中行*/
@property(nonatomic) NSInteger row;


@property(nonatomic) FMDatabase *db;
@property(nonatomic)NSMutableArray *array;
@property(nonatomic) BookItem *bookItem;
@property(nonatomic) FBDBTools *fmdbToos;
@end
@implementation TRChapterListController

#pragma mark ---懒加载

-(FBDBTools *)fmdbToos{
    
    
    if (!_fmdbToos) {
        _fmdbToos=[FBDBTools new];
        
    }
    return _fmdbToos;
    
}
-(BookItem *)bookItem{

    if (!_bookItem) {
        _bookItem=[BookItem new];
        _bookItem.name=self.title;
        _bookItem.iconNameURL=self.iconName;
        _bookItem.comicDesc=self.comicDesc;
        _bookItem.comicArea=self.comicArea;
        _bookItem.comicType=self.comicType;
        _bookItem.updateTiem=self.updaTime;
        _bookItem.isFinish=self.isFinish;
    }
    return _bookItem;




}
-(ChapterListViewModel *)chapterListVM{
    
    if (!_chapterListVM) {
        _chapterListVM=[ChapterListViewModel new];
        
    }
    return _chapterListVM;
    
}

-(NSMutableArray *)array{


    if (!_array) {
        _array=[NSMutableArray array];
        
    }
    
   return  _array;
}


#pragma mark --生命周期
-(void)viewWillAppear:(BOOL)animated{
    //加载章节列表
    [self.tableView beginHeaderRefresh];
    

    }
    

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=self.comictitle;
    
    /**去掉分割线*/
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;

        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(collect)] ;
    [self changedChapterList];
    [self creatchapterHeadList];

    
}

//收藏
-(void)collect{
    
  [self.fmdbToos creatDataTAble:@"create table if not exists t_comicList (id integer primary key autoincrement, data blob unique,iconName text );"];

    self.bookItem=nil;
    
    
    NSString *str=self.iconName.lastPathComponent;
    NSString   *strs = [str stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    

    [self.array addObject:self.bookItem];
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:self.array];
    BOOL fla = [self.fmdbToos.db executeUpdate:@"insert into t_comicList (data ,iconName) values (?,?)",data,strs];
    if (fla) {
        NSLog(@"success");
    }else{
        NSLog(@"failure");
    }
    self.navigationItem.rightBarButtonItem.enabled= NO;
    
}



#pragma mark 创建头部章节列表
-(void)creatchapterHeadList{
    //从XIB加载自定义的表头视图
   TRChpaterListView   *chpaterView= [[NSBundle mainBundle]loadNibNamed:@"TRChapterListView" owner:self options:nil].firstObject;

    //图片
    [chpaterView.comicIconImageView  sd_setImageWithURL:[NSURL URLWithString:self.iconName]
placeholderImage:[UIImage imageNamed:@"mine_icon_big_nor"]];
    
    
   
      chpaterView.comicIconImageView.contentMode=UIViewContentModeScaleToFill;

    
           //描述
    chpaterView.comicDescLabel.text=self.comicDesc;

    //最近更新时间
    NSString *str=@(self.updaTime).stringValue ;

    NSDateFormatter *fmt=[NSDateFormatter new];
    fmt.dateFormat=@"yyyyMMdd";
    NSDate *date=[fmt dateFromString:str];
    fmt.dateFormat=@"yyyy-MM-dd";
    NSString *strs= [fmt stringFromDate:date];

    chpaterView.comicUpdatetimeLabel.text= strs;
    
    //漫画类型
    chpaterView.comicTypeLabel.text=self.comicType;
    //漫画区域
    chpaterView.comicAreaLabel.text=self.comicArea;
    //添加到表头
    self.tableView.tableHeaderView=chpaterView;
    

}

-(NSInteger)chapterID{
    return [self.chapterListVM chapteridForIndex:self.row];
}




#pragma mark 刷新漫画章节

-(void)changedChapterList
{
    __weak typeof(self) weekSelf=self;
    /**下拉刷新*/
  
        [self.tableView addBackFooterRefresh:^{
            [weekSelf.chapterListVM getChatperListModel:weekSelf.comictitle :^(NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    error? [weekSelf.view showWarning:@"╭(╯3╰)╮网络不通,请连接网络⊙﹏⊙b"]:[weekSelf.tableView reloadData];
                    [weekSelf.tableView endFooterRefresh];
                });
            }];
            
        }];
    /**上啦更多*/
        [self.tableView addHeaderRefresh:^{
            [weekSelf.chapterListVM getChatperListModel:weekSelf.comictitle :^(NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    error? [weekSelf.view showWarning:@"╭(╯3╰)╮网络不通,请连接网络⊙﹏⊙"]:[weekSelf.tableView reloadData];
                    [weekSelf.tableView endHeaderRefresh];
                });
            }];
            
        }];
}


-(void)RefrshList{




}

#pragma mark - Table view data source



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
    


}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==1) {
        return self.chapterListVM.chapterList.count;

    }
    return 1;
    
     }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   static  NSString *reuseID=@"chaptercell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        
 
       NSInteger row = indexPath.row;
        self.row =row;
        if (indexPath.section==1) {
            
            cell.textLabel.text= [self.chapterListVM chapterNameForIndex:indexPath.row];
        }
        else {

            
            [cell setUserInteractionEnabled:NO];
            cell.textLabel.textAlignment=NSTextAlignmentCenter;
             cell.textLabel.text=@"章节列表";
        }
        
        
      

            }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TRIMageListControllerController*imageListVC = [[TRIMageListControllerController alloc] init];
    imageListVC.comictitle=self.comictitle;
    if (indexPath.section==1) {
        imageListVC.chapterID=[self.chapterListVM chapteridForIndex:indexPath.row];
        
    }
    
    
    [self.navigationController pushViewController:imageListVC animated:YES];
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{


    return 30;
    
}
@end
