//
//  ViewController.m
//  2.url
//
//  Created by mzr on 2017/11/1.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/wx/v16/userInformation"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError) {
            NSLog(@"服务器连接错误%@", connectionError);
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if(httpResponse.statusCode ==200 || httpResponse.statusCode==304) {
            
            //解析数据
            NSError *error;
            
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if(error) {
                
                NSLog(@"json解析错误%@",error);
            }
            
            NSLog(@"----%@", json);
        } else {
            NSLog(@"服务器内部错误");
            
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
