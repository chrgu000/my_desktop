//
//  ViewController.m
//  1.url
//
//  Created by mzr on 2017/10/30.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/wx/v16/userInformation"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if(!connectionError){
            
            NSString *str= [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"str=%@", str);
            
            [self.webview loadHTMLString:str baseURL:nil];
        } else {
            
            NSLog(@"连接错误%@", connectionError);
            NSLog(@"%d", 1);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
