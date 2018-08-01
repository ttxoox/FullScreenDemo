//
//  NextViewController.m
//  FullScreenDemo
//
//  Created by zemel on 2018/8/1.
//  Copyright © 2018年 zemel. All rights reserved.
//

#import "NextViewController.h"
#import "AppDelegate.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 280)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, testView.frame.size.height + 10, 64, 30)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"ratation" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRatation = YES;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    ((AppDelegate *)[UIApplication sharedApplication].delegate).allowRatation = NO;
    [self orientation:UIInterfaceOrientationPortrait];
}
- (void)btnClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        [self orientation:UIInterfaceOrientationLandscapeLeft];
    }else{
        [self orientation:UIInterfaceOrientationPortrait];
    }
}
#pragma mark - Ratation
- (void)orientation:(int)ratation
{
    NSNumber * number = [NSNumber numberWithInt:ratation];
    [[UIDevice currentDevice] setValue:number forKey:@"orientation"];
}
/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
*/
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (NSUInteger)supportedInterfaceOrientations
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
#endif
{
    return UIInterfaceOrientationPortrait | UIInterfaceOrientationLandscapeLeft;
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (BOOL)shouldAutorotate
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
