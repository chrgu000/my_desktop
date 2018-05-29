//
//  MyAlertView.m
//  UIAlertView2
//
//  Created by mzr on 2017/10/19.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.5;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
        [label setText:@"Alert"];
        [label setTextColor:[UIColor whiteColor]];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        UIButton *bt_cancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 60    , frame.size.width/2, 40)];
        [bt_cancel setTitle:@"cancel" forState:UIControlStateNormal];
        bt_cancel.layer.borderColor = [UIColor blueColor].CGColor;
        bt_cancel.layer.borderWidth = 1.0;
        bt_cancel.tag = 200;
        [bt_cancel addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_cancel];
        
        UIButton *bt_ok = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2, 60, frame.size.width/2, 40)];
        [bt_ok setTitle:@"ok" forState:UIControlStateNormal];
        bt_ok.layer.borderWidth = 1.0;
        bt_ok.layer.borderColor = [UIColor blueColor].CGColor;
        bt_ok.tag = 201;
        [bt_ok addTarget:self action:@selector(alertAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_ok];
        
        
    }
    
    return self;
}

-(void)alertAction:(UIButton *)btn{
    
    NSLog(@"btn=%ld", (long)btn.tag);
    int tag = btn.tag;
    
    if(tag == 200){
        NSLog(@"取消按钮");
    }
    if(tag == 201){
        NSLog(@"ok按钮");
    }
    
    self.alpha = 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
