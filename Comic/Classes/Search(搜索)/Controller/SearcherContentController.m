//
//  SearcherContentController.m
//  Comic
//
//  Created by 孟军 on 16/6/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SearcherContentController.h"
#import "TRChapterListController.h"
@interface SearcherContentController ()
@property(nonatomic)BookViewModel * bookVM;
@end

@implementation SearcherContentController
#pragma mark 懒加载
-(BookViewModel *)bookVM{
    if (!_bookVM) {
        _bookVM=[BookViewModel new];
    }
    return _bookVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
        self.tableView .separatorStyle= UITableViewCellSeparatorStyleNone;
        [self.tableView registerNib:[UINib
        nibWithNibName:@"TRComicImageCell" bundle:nil]
             forCellReuseIdentifier:@"ComicCell"];
self.title=@"搜索结果";
    
    [self RefreshList];
    
}

-(void)RefreshList
{
    
    [self.bookVM getBookModel:self.comicName comicType:@"" completionHandler:^(NSError *error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        error? [self.view showWarning:@"找不到漫画╮(╯▽╰)╭,打开方式不对！"]:[self.tableView reloadData];
                        [self.tableView endFooterRefresh];
                        
                        
                        if(self.bookVM.bookList.count==0){
                        
                            [self.view showWarning:@"找不到漫画╮(╯▽╰)╭,打开方式不对！"];
                            
                        
                        }
                    });
                }];
        
            [self.tableView reloadData];
            

    
}

#pragma mark - Table view data source



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.bookVM.bookList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TRComicImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    /**封面图片*/
    NSString *imagePath=[self.bookVM iconNameForIndex:row];

    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:imagePath]
                          placeholderImage:[UIImage imageNamed:@"mine_icon_big_nor"]];
    cell.iconImageView.contentMode=UIViewContentModeScaleToFill;
    /**漫画名字*/
    cell.nameLabel.text=[self.bookVM nameForIndex:row];

    NSString *str=@([self.bookVM lastUpdateForIndex:row]).stringValue;


    NSDateFormatter *fmt=[NSDateFormatter new];
    fmt.dateFormat=@"yyyyMMdd";
    NSDate *date=[fmt dateFromString:str];
    fmt.dateFormat=@"yyyy-MM-dd";
    NSString *strs= [fmt stringFromDate:date];

    cell.lastUpdateLable.text=strs;


    /**漫画是否完结*/
    cell.isFinishLabel.text=[self.bookVM finishForIndex:row]?@"已完结":@"连载中";
    cell.layer.cornerRadius=4.0;
    cell.layer.borderWidth=0.3;
    cell.layer.borderColor=[UIColor grayColor].CGColor;


    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TRChapterListController*chapterListVC = [[TRChapterListController alloc] init];
    chapterListVC.comictitle=[self.bookVM nameForIndex:indexPath.row];
    chapterListVC.iconName=[self.bookVM iconNameForIndex:indexPath.row ];
    chapterListVC.comicDesc=[self.bookVM descForIndex:indexPath.row];
    chapterListVC.updaTime=[self.bookVM lastUpdateForIndex:indexPath.row];
    chapterListVC.comicType=[self.bookVM typeForIndex:indexPath.row];
    chapterListVC.comicArea=[self.bookVM areaForIndex:indexPath.row];
    chapterListVC.isFinish=[self.bookVM finishForIndex:indexPath.row];
    [self.navigationController pushViewController:chapterListVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 100;

}


@end
