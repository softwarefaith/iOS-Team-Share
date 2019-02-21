//
//  RuntimeKit.h
//  objc-test
//
//  Created by 蔡杰 on 2019/1/16.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/objc.h>

NS_ASSUME_NONNULL_BEGIN

struct MySelector{
    void *sel_id;
    const char *sel_types;
};

@interface RuntimeKit : NSObject

//1.根据类名获取类
+ (Class)fetchClass:(NSString *)clsName;

//2.根据类获取类名
+ (NSString *)fetchClassName:(Class)cls;
 
//3.获取成员变量
+ (NSArray *)fetchIvarList:(Class)cls;

//4.获取成员属性
+ (NSArray *)fetchPropertyList:(Class)cls;

//5.获取类的方法
+ (NSArray *)fetchMethodList:(Class)cls;

@end

NS_ASSUME_NONNULL_END
