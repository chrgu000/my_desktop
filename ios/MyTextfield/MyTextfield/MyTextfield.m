//
//  MyTextfield.m
//  MyTextfield
//
//  Created by mzr on 2017/10/18.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "MyTextfield.h"

@implementation MyTextfield

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        self.borderStyle = UITextBorderStyleRoundedRect;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 1.0;
        self.delegate = self;
        
    }
    return self;
    
}

//开始编辑的时候样式
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.layer.borderColor = [UIColor blueColor].CGColor;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    NSString *text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];//去掉空格
    
    if([text isEqualToString:@""] || text==nil){
        
        self.layer.borderColor = [UIColor redColor].CGColor;
    } else {
        
        self.layer.borderColor = [UIColor greenColor].CGColor;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
