//
//  NSObject+Ncweak.m
//  nc_weak
//
//  Created by zengzoe on 02/07/2018.
//  Copyright © 2018 zyuaaaa. All rights reserved.
//

#import "NSObject+Ncweak.h"
#import <objc/runtime.h>

@implementation NSObject (Ncweak)

- (void)setObj:(NSObject *)obj {
    NSObject * __weak _obj = obj;
    id(^block)(void) =^ {
        return _obj;
    };
    
    objc_setAssociatedObject(self, @selector(obj), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

-(NSObject *)obj {
    id(^block)(void) = objc_getAssociatedObject(self, @selector(obj));
    
    
    
    return block ? block() :nil;
}

@end
