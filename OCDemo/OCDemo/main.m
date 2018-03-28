//
//  main.m
//  OCDemo
//
//  Created by 蔡杰 on 2018/3/24.
//  Copyright © 2018年 mljr. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <objc/objc-runtime.h>

//协议
@interface Person :NSObject <NSCopying>{
 @public
    int  _age; //实例变量
}
@property (nonatomic, assign) int sex; //属性

@property (nonatomic, assign, class) int personCount; //属性


- (void)personInstanceMethod; //实例方法
+ (void)personClassMethod; //类方法
@end

@implementation Person
- (void)personInstanceMethod {}
+ (void)personClassMethod {}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /*
            实例独享
         */
        NSObject *obj1 = [[NSObject alloc] init];
        NSObject *obj2 = [[NSObject alloc] init];
    
        NSLog(@"obj1 -- %p; obj2 --- %p",obj1 ,obj2);


    }
    return 0;
}
