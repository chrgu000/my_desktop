//
//  main.m
//  NSNotication1
//
//  Created by mzr on 2017/10/11.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bclass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        广播通知：带参数的实现
        Bclass *b = [[Bclass alloc]init];
        [b testNotication];
    }
    return 0;
}
