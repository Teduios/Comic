//
//  TRBookShelfController.m
//  NovelApp
//
//  Created by mj on 16/4/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRBookShelfController.h"
#import "TRChapterListController.h"
#import "BookItem.h"
@interface TRBookShelfController ()
@property(nonatomic)BookViewModel * bookVM;
@property(nonatomic) NSIndexPath *indexPath;
@property(nonatomic,strong) BookItem *bookItem;
@property(nonatomic)FMDatabase *db;
@property(nonatomic)NSMutableArray *arr;
@property(nonatomic) FBDBTools *fmdbToos;
@property(nonatomic) NSMutableArray *nameArr;

@end

@implementation TRBookShelfController

#pragma mark ----懒加载
-(FBDBTools *)fmdbToos{


    if (!_fmdbToos) {
        _fmdbToos=[FBDBTools new];
        
    }
    return _fmdbToos;
    
}

-(NSMutableArray *)arr{

    if (!_arr) {
        _arr=[NSMutableArray array];
        
    }
    return _arr;
    

}
-(NSMutableArray *)nameArr{

    if (!_nameArr) {
        _nameArr=[NSMutableArray array];
        
    }
    return _nameArr;

}


-(BookItem *)bookItem{

    if (!_bookItem) {
        _bookItem=[BookItem new];
        
    }
    return _bookItem;
    

}
#pragma mark ----生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
self.tableView .separatorStyle= UITableViewCellSeparatorStyleNone;
    [self.tableView setSeparatorColor:[UIColor grayColor]];
  
    
    [self.tableView registerNib:[UINib
                                 nibWithNibName:@"TRComicImageCell" bundle:nil]
         forCellReuseIdentifier:@"ComicCell"];

    [self setExtraCellLineHidden:self.tableView];
    
    
   }


- (void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
 
    
}


#pragma mark -tableBarItem Click
-(void)viewWillAppear:(BOOL)animated{
    
   FMResultSet *result = [self.fmdbToos executeQuery:@"select * from t_comicList"];

        // 从结果集里面往下找
    NSMutableArray *arrs=[NSMutableArray array];
   arrs=nil;
    
  [self.arr removeAllObjects];
    while ([result next]) {
        NSData *data=[result dataForColumn:@"data"];
        NSString *iconName=[result stringForColumn:@"iconName"];
        [self.nameArr addObject:iconName];
        
        arrs=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self.arr addObjectsFromArray:arrs];
            }
    [self.tableView reloadData];
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return self.arr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRComicImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicCell" forIndexPath:indexPath];
    
    /**封面图片*/
 
    NSString *url=[self.arr[indexPath.row]iconNameURL];
    
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:url
                                            ]
                          placeholderImage:[UIImage imageNamed:@"mine_icon_big_nor"]];

    cell.iconImageView.contentMode=   UIViewContentModeRedraw;
    cell.iconImageView .layer. masksToBounds=YES;
    
    cell.iconImageView.layer.cornerRadius=10;
    cell.iconImageView.layer.borderWidth=1;
    cell.iconImageView.layer.borderColor=[UIColor grayColor].CGColor;

    /**漫画名字*/
    cell.nameLabel.text=[self.arr[indexPath.row] name];
    NSString *str=@([self.arr[indexPath.row]updateTiem]).stringValue;

 
    //    cell.lastUpdateLable.text=@"2qewd";
    
    NSDateFormatter *fmt=[NSDateFormatter new];
    fmt.dateFormat=@"yyyyMMdd";
    NSDate *date=[fmt dateFromString:str];
    fmt.dateFormat=@"yyyy-MM-dd";
  NSString *strs= [fmt stringFromDate:date];
    
       cell.lastUpdateLable.text=strs;
    
    
   BOOL isfin=[self.arr[indexPath.row] isFinish];
    
    cell.isFinishLabel.text=isfin?@"完结":@"连载中";
    
    

   
    

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120 ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    [self creatNextVc:indexPath];
    
}
-(void)creatNextVc:(NSIndexPath*)indexPath{
    TRChapterListController*chapterListVC = [[TRChapterListController alloc] init];
    chapterListVC.comictitle=[self.arr[indexPath.row] name];
    chapterListVC.iconName=[self.arr[indexPath.row] iconNameURL];
    chapterListVC.comicDesc=[self.arr[indexPath.row]comicDesc];
    chapterListVC.updaTime=[self.arr[indexPath.row] updateTiem];
    chapterListVC.comicType=[self.arr[indexPath.row] comicType];
    chapterListVC.comicArea=[self.arr[indexPath.row] comicArea];
    chapterListVC.isFinish=[self.arr[indexPath.row] isFinish];

    
    [self.navigationController pushViewController:chapterListVC animated:YES];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
     __weak typeof(self) weekSelf=self;
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        
        NSString *str=weekSelf.nameArr[indexPath.row];
      NSString   *strs = [str.lastPathComponent stringByReplacingOccurrencesOfString:@"\"" withString:@""];

        NSString *sql=[NSString stringWithFormat:@"delete from t_comicList where iconName='%@';",strs];
        
      [weekSelf.fmdbToos exexuteUpdate:sql];
       
        [weekSelf .nameArr removeObjectAtIndex:indexPath.row];
        
      [weekSelf.arr removeObjectAtIndex:indexPath.row];
        [weekSelf.tableView reloadData];
        
         
        
        
    }];
    
    return @[action];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}






@end
