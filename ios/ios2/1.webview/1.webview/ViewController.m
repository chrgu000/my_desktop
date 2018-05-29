//
//  ViewController.m
//  1.webview
//
//  Created by mzr on 2017/10/31.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

-(void)loadView{
    
    self.webview = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.webview;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"index.html" withExtension:nil];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
    
    self.webview.delegate = self;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *str = [self.webview stringByEvaluatingJavaScriptFromString:@"ios()"];
    
    NSLog(@"str=%@", str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
