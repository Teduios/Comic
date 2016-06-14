//
//  TRHomeController.m
//  Comic
//
//  Created by mj on 16/4/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomeController.h"
#import "TRWaterflowLayout.h"
#import "TRIconCollectionCell.h"
#import "BookViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "TRChapterListController.h"
#import "TRScrollView.h"


typedef enum{
    
    /**少年漫画" **/
    boyComic=0,
    /**青年漫画*/
    youngComic,
    /**少女漫画*/
    girlComic,
//    /**耽美漫画*/
//    mangaComic
    
    
} TRcomicType;
@interface TRHomeController ()<TRWaterflowLayoutDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property(nonatomic)BookViewModel * bookVM;
@property(nonatomic) TRcomicType  comicType;
@property(nonatomic)NSString *typename;
@property(nonatomic)NSString *comictitle;

@property(nonatomic)UIImage *iconImage;
@property(nonatomic) NSMutableArray *array;


@end

@implementation TRHomeController
#pragma mark 懒加载
-(BookViewModel *)bookVM{
    if (!_bookVM) {
        _bookVM=[BookViewModel new];
    }
    return _bookVM;
}

-(NSMutableArray *)array{


    if (!_array) {
        _array=[NSMutableArray array];
        
    }
    return _array;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
      // 创建布局
    [self setupLayout];
    //默认类型
    self.typename=@"少女漫画";

    
   [self.collectionView beginHeaderRefresh];
    
    [self changedComicType];
    //创建分栏
    NSArray *segmentArray=[[NSArray alloc]initWithObjects:@"少年漫画",@"青年漫画",@"少女漫画",nil];
    UISegmentedControl *segment=[[UISegmentedControl alloc]initWithItems:segmentArray];
//    segment.tintColor=[UIColor redColor];
    
    segment.tintColor=COLOR(31, 189, 255,1.0);
    
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView=segment;

    
    
}
#pragma mark 改变漫画类型


-(void)changedComicType{
     /**下拉刷新*/
    
    __weak typeof(self) weekSelf=self;
    [self.collectionView addBackFooterRefresh:^{
        [weekSelf.bookVM getBookModel:@"" comicType:weekSelf.typename completionHandler:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                error? [weekSelf.view showWarning:@"╭(╯3╰)╮网络不通,请连接网络⊙﹏⊙"]:[weekSelf.collectionView reloadData];
                [weekSelf.collectionView endFooterRefresh];
            });
        }];
        
    }];
    
    /**上啦更多*/
    [self.collectionView addHeaderRefresh:^{
        [weekSelf.bookVM getBookModel:@"" comicType:weekSelf.typename completionHandler:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                error? [weekSelf.view showWarning:@"╭(╯3╰)╮网络不通,请连接网络⊙﹏⊙"]:[weekSelf.collectionView reloadData];
                [weekSelf.collectionView endHeaderRefresh];
            });
        }];
        
    }];
        
  
}
#pragma mark -tableBarItem Click
-(void)segmentClick:(UISegmentedControl*)segment{
    NSInteger index=segment.selectedSegmentIndex;
    switch (index) {
        case boyComic:
            self.typename=@"少年漫画";
            break;
        case youngComic:
            self.typename=@"青年漫画";
            break;
        case girlComic:
            self.typename=@"少女漫画";
            break;
//        case mangaComic :
//            self.typename=@"耽美漫画";
//            break;
            
        default:
            break;
    }
    [self.collectionView beginHeaderRefresh];
    [self changedComicType];
}


static NSString * const iconCellId = @"cellid";
-(void)setupLayout{
    // 创建布局
    TRWaterflowLayout *layout = [[TRWaterflowLayout alloc] init];
    layout.delegate = self;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate=self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:@"TRIconCollectionCell" bundle:nil]
    forCellWithReuseIdentifier:iconCellId];
    self.collectionView = collectionView;


}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.bookVM.bookList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TRIconCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iconCellId forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    /**封面图片*/
    NSString *imagePath=[self.bookVM iconNameForIndex:row];
   __weak typeof(self) weekSelf=self;
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:[UIImage imageNamed:@"mine_icon_big_nor"]  options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [weekSelf.array addObject:image];
        
        
    }];
    

    
    
    cell.layer.cornerRadius=4.0;
    cell.layer.borderWidth=0.6;
//    cell.layer.borderColor=[UIColor grayColor].CGColor;
    cell.layer.borderColor=COLOR(31, 189, 255,1.0).CGColor;
    
    cell.iconImageView.contentMode=UIViewContentModeScaleToFill;
    /**漫画名字*/
    cell.comicNameLabel.text=[self.bookVM nameForIndex:row];
    

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //选中传值
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
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark - <TRWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(TRWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    //随机宽高
    
    
   CGFloat w=arc4random_uniform(80)+110;
   CGFloat  h=arc4random_uniform(100)+110;

    return itemWidth*h/w;
}

- (CGFloat)rowMarginInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout
{
    return 20;
}

- (CGFloat)columnCountInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout
{
    if (self.bookVM.bookList.count <= 50) return 2;
    return 3;
}

- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(TRWaterflowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(0, 20, 300, 15);
}


@end
