//
//  TRSearchController.m
//  NovelApp
//
//  Created by mj on 16/4/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRSearchController.h"
#import "TRSearchBar.h"
#import "TRChapterListController.h"
#import "TRComicImageCell.h"
#import "DBSphereView.h"
#import "SearcherContentController.h"
@interface TRSearchController ()<UITextFieldDelegate>
@property(nonatomic)NSString *comicName;
@property(nonatomic) TRSearchBar *searchBar;

@property(nonatomic)NSString *currentName;
@property(nonatomic)NSArray *searchNameArray;
@end

@implementation TRSearchController

- (void)gatData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SearchNamePlist" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *string = dict[@"online_params"][@"KeyWord"];
    _searchNameArray = [string componentsSeparatedByString:@","];
    [self setSpherView];
}
#pragma mark 设置3D旋转文字
-(void)setSpherView{
    DBSphereView *sphereView = [[DBSphereView alloc] initWithFrame:CGRectMake(0, 100, kSCREENW, 500)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:100];
    NSInteger nameCount=100;
    
    for (NSInteger i = 0; i <nameCount; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:self.searchNameArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        btn.frame = CGRectMake(0, 0, 100, 20);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [sphereView addSubview:btn];
    }
  [sphereView setCloudTags:array];
    [self.view addSubview:sphereView];
    
    
}

-(void)btnClick:(UIButton*)sender{
    self.currentName=sender.currentTitle;
      self.searchBar.text=sender.currentTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self gatData];
    self.view .backgroundColor=[UIColor whiteColor];
    
    

    
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(Search)] ;
     self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)] ;
//    设置导航栏的标题视图
    
    TRSearchBar *searchBar=  [TRSearchBar SeacherBar];
    searchBar.width=300 ;
    searchBar.height=30;
    searchBar.delegate=self;
    searchBar.keyboardType=UIKeyboardAppearanceDefault;
    searchBar.returnKeyType=UIReturnKeyGoogle;
    
    
    self.searchBar=searchBar;
    self.navigationItem.titleView=searchBar;
    

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


[self.searchBar resignFirstResponder];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{


    [self Search];
    [self.searchBar resignFirstResponder];

    return YES;
    
}

-(void)back{
//返回
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)Search{
    
    SearcherContentController *searchContVc=[SearcherContentController new];
    searchContVc.comicName= self.currentName;
    
    [self.navigationController pushViewController:searchContVc animated:YES];

}



@end
