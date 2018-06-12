//
//  main.m
//  Block00
//
//  Created by 蔡杰 on 2018/6/7.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef  void (^Block)(void);



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        int a = 3;
        
        NSLog(@"类型：------%@",[^(void){
            
            NSLog(@"I am Block");
        } class]);
        
        NSLog(@"类型：------%@",[^(void){
            NSLog(@"I am Block -- %d",a);
        } class]);
        
        NSLog(@"类型：------%@",[[^(void){
            
            NSLog(@"I am Block -- %d",a);
        } copy] class]);
        
        
        // MAC 与ARC  下对比
        Block  block = ^(void){
            NSLog(@"I am Block -- %d",a);
        };
        NSLog(@"Block 类型：------%@",[block class]);
        

    }
    return 0;
}
