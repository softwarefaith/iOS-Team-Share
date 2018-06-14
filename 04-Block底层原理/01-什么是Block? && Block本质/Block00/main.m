//
//  main.m
//  Block00
//
//  Created by 蔡杰 on 2018/6/7.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef  void (^Block)(void);

typedef  void (^BlockPara)(int,int);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        int a = 10;
        Block block = ^(){
            
            NSLog(@"I am block- %d",a);
        };
        
        block();
        

    }
    return 0;
}
