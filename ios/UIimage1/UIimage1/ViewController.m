//
//  ViewController.m
//  UIimage1
//
//  Created by mzr on 2017/10/16.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //把图片放到数组里面
    NSMutableArray *imageArr = [[NSMutableArray alloc]init];
    
    for (int i=1; i<=2; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArr addObject:image];
        
    }
    
    //定义imageview
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 200,100)];
    imageview.animationDuration = 4;//周期
    imageview.animationImages = imageArr;//图片
    imageview.animationRepeatCount = 2;//重复的次数
    imageview.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageview];
    
    [imageview startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
