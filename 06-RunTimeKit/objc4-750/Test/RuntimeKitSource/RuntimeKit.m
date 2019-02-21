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
/*
 *4.获取成员属性
 class_rw_t结构体中有propertys，遍历获取property_t，objc_property_t是property_t的别名
 property_getName：prop->name
 property_getAttributes：prop->attributes
 struct property_t {
 const char *name;       //属性名
 const char *attributes;         //属性内容：strong、weak、编码等
 };
 */
+(NSArray *)fetchPropertyList:(Class)cls {
    
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(cls, &outCount);
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:outCount];
    
    for (unsigned int i = 0; i < outCount; i ++) {
        
        objc_property_t property = propertyList[i];
        const char *propertyName = property_getName(property);
        const char *propertyType =  property_getAttributes(property);
        NSDictionary *properytDic = @{@"propertyName":[NSString stringWithUTF8String:propertyName],@"propertyType":[NSString stringWithUTF8String:propertyType]};
        
        [mutableArray addObject:properytDic];

    }
    free(propertyList);

    return [mutableArray copy];
}
/*
 *5.获取类的方法
 遍历class_rw_t中的method_array_t获取Method
 struct method_t {
 SEL name;       //方法名
 const char *types;      //方法类型
 }
 method_getName：method->name
 method_getTypeEncoding：method->types
 */

+ (NSArray *)fetchMethodList:(Class)cls {
    
    unsigned int outCount = 0;
    Method *methodList =  class_copyMethodList(cls, &outCount);
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:outCount];

    for (unsigned int i = 0; i < outCount; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        const char *methodype = method_getTypeEncoding(method);
        NSDictionary *methodDic = @{@"methodName":NSStringFromSelector(methodName),@"methodype":[NSString stringWithUTF8String:methodype]};
        [mutableArray addObject:methodDic];
    }
    free(methodList);
    return [mutableArray copy];
}

@end
