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

@protocol PersonDelegate
- (void)hello;
@end
//协议
@interface Person :NSObject <PersonDelegate>{
 @public
    int  _age; //实例变量
}
@property (nonatomic, assign) int sex; //属性

@property (nonatomic, weak) id<PersonDelegate> personDelegate;
- (void)personInstanceMethod; //实例方法
+ (void)personClassMethod; //类方法
@end

@implementation Person
- (void)personInstanceMethod {}
+ (void)personClassMethod {}

- (void)hello {}

@end

@protocol ManDelegate
- (void)helloMan;
@end
//协议
@interface Man  :Person <ManDelegate>{
@public
    int  _mage; //实例变量
}
@property (nonatomic, assign) int msex; //属性

@property (nonatomic, weak) id<ManDelegate> manDelegate;
- (void)ManInstanceMethod; //实例方法
+ (void)ManClassMethod; //类方法
@end

@implementation Man
- (void)ManInstanceMethod {}
+ (void)ManClassMethod {}
//覆盖
- (void)personInstanceMethod {}

- (void)helloMan {};

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       
//        NSObject *object = [[NSObject alloc] init];
        Person *person = [[Person alloc] init];
     //   Man *man = [[Man alloc] init];
//
//        /*
//           class
//
//         */
//        cj_objc_class *objectClass = (__bridge cj_objc_class *)[object class];
        cj_objc_class *personClass = (__bridge cj_objc_class *)[person class];
//        cj_objc_class *manClass = (__bridge cj_objc_class *)[man class];
//
//        /*
//
//           meta class
//         */
//        cj_objc_class *objectMetaClass = objectClass->metaClass();
//        cj_objc_class *personMetaClass = personClass->metaClass();
//        cj_objc_class *manMetaClass = manClass->metaClass();
//
//
//        /*
//          class  内存信息
//         */
//        class_rw_t *objectClassData = objectClass->data();
        class_rw_t *personClassData = personClass->data();
        
        //NSLog(@"demangledName === %@",[NSString stringWithCString:personClassData->demangledName encoding:NSUTF8StringEncoding]);
//        class_rw_t *manClassData = manClass->data();
//        /*
//           meta class  内存信息
//         */
//        class_rw_t *objectMetaClassData = objectMetaClass->data();
//        class_rw_t *personMetaClassData = personMetaClass->data();
//        class_rw_t *manMetaClassData = manMetaClass->data();
//
//        //arm64  define ISA_MASK        0x0000000ffffffff8
//        //x86 0x00007ffffffffff8
//        NSLog(@"%p %p %p %p %p %p",  objectClassData, personClassData, manClassData,
//              objectMetaClassData, personMetaClassData, manMetaClassData);
//
//        return 0;
        
        /*
            实例
         */
        NSObject *obj1 = [[NSObject alloc] init];
        NSObject *obj2 = [[NSObject alloc] init];
      //  NSLog(@"obj1 -- %p; obj2 --- %p",obj1 ,obj2);
        
        /*
            class 对象
         */
        Class objClass1 = [obj1 class];
        Class objClass2 = [obj2 class];
        Class objClass3 = [NSObject class];
        Class objClass4 = object_getClass(obj1);
        Class objClass5 = object_getClass(obj2);
        NSLog(@"obj1 address = %p \n,obj2 address = %p \n,obj3 address = %p \n,obj4 address = %p \n,obj54 address = %p \n", objClass1,objClass2,objClass3,objClass4,objClass5);
        /*
        meta  class 对象
         */
        //Class objMetaClass1 = object_getClass([obj1 class]);;
       // Class objMetaClass2 =  object_getClass([obj2 class]);;
       // Class objMetaClass3 = object_getClass([NSObject class]);;
       
       // NSLog(@"obj1 address = %p \n,obj2 address = %p \n,obj3 address = %p \n", objMetaClass1,objMetaClass2,objMetaClass3);
    }
    return 0;
}
