//
//  Person.h
//  objc-test
//
//  Created by 蔡杰 on 2019/1/16.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Test : NSObject


@end

@protocol Person <NSObject>

@property(nonatomic,copy) NSString *name;

@end

@interface Person : NSObject {
    
@public
    int publicA;
@protected
    NSString *publicB;
@private
    char publicC;
}

@property(nonatomic,assign) int iXXX;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy,nonnull) NSString *ID;

- (void)testOne:(int)i;
- (void)testTWO;


@end

NS_ASSUME_NONNULL_END
