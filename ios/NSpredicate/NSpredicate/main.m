//
//  main.m
//  NSpredicate
//
//  Created by mzr on 2017/10/10.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        //一、初始化数组
//        NSArray *arr1 = [[NSArray alloc]initWithObjects:@"ios",@"android",@"wp", nil];
//        //定义谓词(1.创建谓词对象，2.指定谓词条件，3.将谓词用到对象上面去)
//        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF == 'android'"];//这个地方的android必须是字符串
//        //将谓词用到对象上面去
//        NSLog(@"arr1=%@", arr1);
//        NSArray *arr2 = [arr1 filteredArrayUsingPredicate:pre];
//        
//        for (NSString *item in arr2) {
//            
//            NSLog(@"item=%@", item);
//        }
        
        
        
        //二、谓词的使用(判断数组中是否包含某个元素)
//        NSArray *arr1 = [[NSArray alloc]initWithObjects:@"ios",@"android",@"wp", nil];
//        
//        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF == 'ios'"];//这里必须是两个等于号
//        
//        NSArray *arr2 = [arr1 filteredArrayUsingPredicate:pre];
//        
//        for (NSString *item in arr2) {
//            NSLog(@"item=%@", item);
//        }
        
//        NSString *num1 = [NSString stringWithFormat:@"%d", 11];//字符串的初始化
//        NSLog(@"num1=%@", num1);
        //将字符串转成数字
//        if(num1.intValue > 10){
//            
//            NSLog(@"大于10啊");
//        }
        
        //三、使用谓词(将数组里面大于10的数据过滤出来)
//        NSString *num1 = [NSString stringWithFormat:@"%d", 2];
//        NSString *num2 = [NSString stringWithFormat:@"%d", 15];
//        NSArray *arr1 = [[NSArray alloc] initWithObjects:num1,num2, nil];
//        
////        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF.intValue < 10"];
//        
//        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF.intValue > 10"];
//
//        NSArray * arr2 = [arr1 filteredArrayUsingPredicate:pre];
//        for (NSString *item in arr2) {
//            NSLog(@"item=%@", item);
//        }
        //四、谓词(通过关键词判断数组里面是否包含某个元素)
//        NSArray *arr1 = [[NSArray alloc]initWithObjects:@"ab",@"cde", nil];
//        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", @"cde"];
//        NSArray *arr2 = [arr1 filteredArrayUsingPredicate:pre];
//        
//        for (NSString *item in arr2) {
//            NSLog(@"item=%@", item);
//        }
        
       //谓词(谓词在对象中的使用，过滤对象的数据)
       
        Person *p1 = [[Person alloc]init];
        p1.age = 5;
        Person *p2 = [[Person alloc]init];
        p2.age = 10;
        NSLog(@"%p %p", p1, p2);//打印出p1和p2的内存位置
        
        NSMutableArray *arr1 = [[NSMutableArray alloc]init];
        [arr1 addObject:p1];
        [arr1 addObject:p2];
//        NSLog(@"arr1=%@", arr1);
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"age == 10"];
        NSArray *arr2 = [arr1 filteredArrayUsingPredicate:pre];
        
//        NSLog(@"arr2=%@", arr2);
        for (Person *p in arr2) {
            
            NSLog(@"%p", p);
        }
    }
    return 0;
}



























