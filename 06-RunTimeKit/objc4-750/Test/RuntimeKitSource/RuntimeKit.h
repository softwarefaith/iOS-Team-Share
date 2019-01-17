//
//  RuntimeKit.h
//  objc-test
//
//  Created by 蔡杰 on 2019/1/16.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeKit : NSObject

//1.根据类名获取类
+ (Class)fetchClass:(NSString *)clsName;

//2.根据类获取类名
+ (NSString *)fetchClassName:(Class)cls;

//3.获取成员变量
+ (NSArray *)fetchIvarList:(Class)cls;

@end

NS_ASSUME_NONNULL_END
