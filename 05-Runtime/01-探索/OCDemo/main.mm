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

struct MyNSObejctStruct {
    void  *isa;
   
};


@interface NSObject(Private)

-(void)objc_debug_isa_class_mask ;

@end


@implementation NSObject(Private)
-(void)objc_debug_isa_class_mask {
    
   struct MyNSObejctStruct *p = (__bridge MyNSObejctStruct *)self;
    NSLog(@"%lld",((long long)(p->isa)) & ISA_MASK);
}
@end




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
       
        
        //判断是否是TagPoint指针
        NSNumber *number = [NSNumber numberWithInt:1];
        //#   define _OBJC_TAG_MASK 1UL
        NSLog(@"number = %p,",number);
        
//        Person *person = [[Person alloc] init];
//
//
//        //Class
//        cj_objc_class *personClass = (__bridge cj_objc_class *)[person class];
//
//        NSLog(@"bits - %lx",personClass->bits);
//
//        NSLog(@"main pass");
    }
    return 0;
}
