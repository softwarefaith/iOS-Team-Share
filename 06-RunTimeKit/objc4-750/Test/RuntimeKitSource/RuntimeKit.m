//
//  RuntimeKit.m
//  objc-test
//
//  Created by 蔡杰 on 2019/1/16.
//

#import "RuntimeKit.h"

@implementation RuntimeKit

/*
 *1.根据类名获取类
 gdb_objc_realized_classes类表中获取key，与传入类名作比较，返回对应的vlaue
 类表中有一系列MapPair，包含有key，value
 typedef struct _MapPair {
 const void    *key;
 const void    *value;
 } MapPair;
 
 */
+ (Class)fetchClass:(NSString *)clsName
{
    const char *name = [clsName UTF8String];
    return objc_getClass(name);
}

/*
 *2.根据类获取类名
 class_rw_t结构体中有demangledName，这个就是类名
 */
+ (NSString *)fetchClassName:(Class)cls
{
    const char * name = class_getName(cls);
    return [NSString stringWithUTF8String:name];
}

/*
 *3.获取成员变量
 class_ro_t结构体有ivar_list_t，遍历获取Ivar
 ivar_getName：ivar->name
 ivar_getTypeEncoding：ivar->type
 struct ivar_t {
 const char *name;       //变量名
 const char *type;           //变量类型
 };
 */

+ (NSArray *)fetchIvarList:(Class)cls {
    
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList(cls, &outCount);
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:3];
    for ( unsigned int i = 0 ; i < outCount; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        const char *ivarType = ivar_getTypeEncoding(ivar);
        NSDictionary *ivarDic = @{@"ivarName":[NSString stringWithUTF8String:ivarName],@"ivarType":[NSString stringWithUTF8String:ivarType]};
        [mutableArray addObject:ivarDic];
    }
    free(ivarList);
    return mutableArray.copy;
}

@end
