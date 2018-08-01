//
//  ViewController.m
//  FullScreenDemo
//
//  Created by zemel on 2018/8/1.
//  Copyright © 2018年 zemel. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)nextHandle:(UIButton *)sender {
    NextViewController * nvc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nvc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
