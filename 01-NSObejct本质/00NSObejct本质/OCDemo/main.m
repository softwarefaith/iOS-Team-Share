//
//  main.m
//  OCDemo
//
//  Created by 蔡杰 on 2018/3/24.
//  Copyright © 2018年 mljr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int a = 10;
       NSObject *o = [[NSObject alloc] init];
       
        NSLog(@"a address = %p; o address = %p",&a,&o);
//sizeof  malloc 申请的空间的大小  16 * n
        NSLog(@"%zd -- %zd",class_getInstanceSize([o class]), malloc_size((__bridge void *)o));
    }
    return 0;
}
