//
//  main.m
//  debug_block
//
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <Block.h>

typedef void(^EOCBlock)(void);

//main.m转化为C++的命令： xcrun -sdk macosx10.13 clang -S -rewrite-objc -fobjc-arc  main.m
//工程的搭建参考：http://blog.csdn.net/wotors/article/details/52489464

/*
 1、block有普通变量：block_copy：把block从栈放到堆
 2、block里有__block变量：block_copy，把block从栈放到堆，而且把__block的结构体从栈放到堆，同时forwading的指向改变
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        __block NSButton *btn = [[NSButton alloc] init];
        
        void (^block)(void) =  ^{
            
            NSLog(@"这是自己的block %@", btn);
            
        };
        
        printf("block address: %p", block);  //0x0000000100519630
        block();
        
        
    }
    return 0;
}









