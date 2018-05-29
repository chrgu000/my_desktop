//
//  ViewController.m
//  UIAlertView1
//
//  Created by mzr on 2017/10/18.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self alertView1];
//    [self alertView2];
//    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
//    webview.layer.borderColor = [UIColor redColor].CGColor;
//    webview.layer.borderWidth = 2;
//    [self.view addSubview:webview];
//    1.创建webview
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 20;
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, width, height)];
//    webview.layer.borderColor = [UIColor redColor].CGColor;
//    webview.layer.borderWidth = 2.0;
    
    //2. 创建url
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    //3.创建Request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //4.加载网页
    [webview loadRequest:request];
    
    //.添加到页面中
    [self.view addSubview:webview];
    
    
}


-(void)alertView1{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"alert" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)alertView2{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"alert" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",@"ok1", nil];
    [alertView show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSLog(@"index=%ld", buttonIndex);
}

@end
