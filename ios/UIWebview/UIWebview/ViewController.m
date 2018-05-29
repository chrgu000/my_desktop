//
//  ViewController.m
//  UIWebview
//
//  Created by mzr on 2017/10/24.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];
    
    webview.layer.borderColor = [UIColor redColor].CGColor;
    webview.layer.borderWidth = 2;
    webview.delegate = self;
    NSURL *url = [NSURL URLWithString:@"https://cvd.xiaoduoai.com/c/?src=1346&key=c3f796f882d66c75245038e11de20c78e8d1b935311e4a37a7948b935ce1fb01&channel_id=1374"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.view addSubview:webview];
    [webview loadRequest:request];
    
    [webview stringByEvaluatingJavaScriptFromString:@"alert('hello world!')"];

    
 
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSURL *url = request.URL;
    
    NSLog(@"url=%@", url);
    
    return true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
