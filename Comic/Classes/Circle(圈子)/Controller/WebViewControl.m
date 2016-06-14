//
//  WebViewControl.m
//  Comic
//
//  Created by 孟军 on 16/6/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WebViewControl.h"

@interface WebViewControl ()<UIWebViewDelegate>
@property(nonatomic) UIWebView *webView;


@end

@implementation WebViewControl

-(UIWebView *)webView{
    
    
    
    if (!_webView) {
        _webView=[UIWebView new];
        
    }
    
    return _webView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.webView.frame=self.view.frame;
    [self loadRemoteHTML];
    [self.view addSubview:self.webView];
    
    
}

#pragma mark 加载远程的HTML页面
- (void)loadRemoteHTML {
    
    NSURL *url = [NSURL URLWithString:self.urlStirng];
    
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view showBusyHUD];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view hideBusyHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view showWarning:@"╭(╯3╰)╮网络不通,请连接网络⊙﹏⊙"];
}


@end
