//
//  ViewController.m
//  06-Block思考题
//
//  Created by 蔡杰 on 2018/6/12.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import "ViewController.h"

@interface MyBlockObj : NSObject


@property(nonatomic, strong) dispatch_queue_t queue;

- (void)asyn;

@end

@implementation MyBlockObj {
    int _age;
}
- (void)asyn {
    self.queue = dispatch_queue_create("com.mljr.Block", DISPATCH_QUEUE_CONCURRENT);
    _age = 20;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
         sleep(2);
        NSLog(@"my name is queue -%d",_age);
    });
}
-(void)dealloc {
    
    NSLog(@"MyBlockObj dealloc");
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    MyBlockObj *obj = [[MyBlockObj alloc] init];
    

    [obj asyn];
        
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"person ----- %@",obj);
//        });
   
    NSLog(@"touchBegin----------End");
    
}

- (void)test {
    
    MyBlockObj *obj = [[MyBlockObj alloc] init];
    
    __weak MyBlockObj *weako = obj;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"weakP ----- %@",weako);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"person ----- %@",obj);
        });
    });
    NSLog(@"touchBegin----------End");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
