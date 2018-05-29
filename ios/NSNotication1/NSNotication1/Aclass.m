//
//  Aclass.m
//  NSNotication1
//
//  Created by mzr on 2017/10/11.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "Aclass.h"

@implementation Aclass
-(id)init{
    self = [super init];
    
    if(self) {
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        
        [dic setValue:@"123" forKey:@"abc"];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"TEST" object:[NSNumber numberWithInt:5] userInfo:dic];
    }
    return self;
}
@end
