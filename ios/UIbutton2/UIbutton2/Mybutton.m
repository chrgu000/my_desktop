//
//  Mybutton.m
//  UIbutton2
//
//  Created by mzr on 2017/10/18.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "Mybutton.h"

@implementation Mybutton
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
//        1.设置边框
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 3.0;
//        2.设置image
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"plus-selected"] forState:UIControlStateHighlighted];
//        3.设置title
        self.titleLabel.contentMode = NSTextAlignmentCenter;
        [self setTitle:@"选中" forState:UIControlStateHighlighted];
        [self setTitle:@"未选中" forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        
    }
    return self;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat w = contentRect.size.height/2;
    CGFloat h = w;
    CGFloat x = 15;
    CGFloat y = (contentRect.size.height - h)/2;
    return CGRectMake(x, y, w, h);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat h = contentRect.size.height/2;
    CGFloat w = contentRect.size.width - h -15;
    CGFloat x = 5 + h +40;
    CGFloat y = (contentRect.size.height - h)/2;
    
    return CGRectMake(x, y, w, h);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
