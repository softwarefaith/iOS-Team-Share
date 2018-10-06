//
//  ViewController.m
//  Test
//
//  Created by 蔡杰 on 2018/9/11.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        NSLog(@"1");
    });
    
    [[NSRunLoop currentRunLoop] performBlock:^{
        NSLog(@"2");
        
    }];
    
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"3");
        
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:@"model1"];
    
    [[NSRunLoop currentRunLoop] runMode:@"model1" beforeDate:[NSDate distantFuture]];
    NSLog(@"4");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
