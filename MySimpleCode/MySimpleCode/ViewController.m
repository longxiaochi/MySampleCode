//
//  ViewController.m
//  MySimpleCode
//
//  Created by Long on 2019/11/26.
//  Copyright © 2019 Long. All rights reserved.
//

#import "ViewController.h"
#import "LCCollectionViewController.h"
#import "LCPlainTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 50);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonEvent:(UIButton *)sender {
//    LCTableViewController *VC = [[LCTableViewController alloc] init];
//    LCCollectionViewController *VC = [[LCCollectionViewController alloc] init];
    LCPlainTableViewController *VC = [[LCPlainTableViewController alloc] init];
    VC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:VC animated:NO completion:nil];
}

@end
