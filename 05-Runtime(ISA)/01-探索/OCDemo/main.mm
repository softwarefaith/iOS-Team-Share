//
//  main.m
//  OCDemo
//
//  Created by 蔡杰 on 2018/3/24.
//  Copyright © 2018年 mljr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>

#import "CJClassInfo.h"


@interface Person :NSObject {
 @public
    int  _age; //实例变量
}

@end

@implementation Person


@end






int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       
        Person *person = [[Person alloc] init];

        
        //Class
        cj_objc_class *personClass = (__bridge cj_objc_class *)[person class];
        
        NSLog(@"bits - %lx",personClass->bits);
        
        NSLog(@"main pass");
    }
    return 0;
}
