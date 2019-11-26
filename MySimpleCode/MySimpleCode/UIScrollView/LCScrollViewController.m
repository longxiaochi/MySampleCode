//
//  LCScrollViewController.m
//  MySimpleCode
//
//  Created by Long on 2019/11/26.
//  Copyright © 2019 Long. All rights reserved.
//

#import "LCScrollViewController.h"
#import "LCScrollView.h"

@interface LCScrollViewController ()

@end

@implementation LCScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = UIColor.redColor;
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 150, 200)];
    greenView.backgroundColor = UIColor.greenColor;
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = UIColor.blueColor;
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = UIColor.yellowColor;
    
    LCScrollView *scrollView = [[LCScrollView alloc] initWithFrame:self.view.bounds];
    [scrollView addSubview:redView];
    [scrollView addSubview:greenView];
    [scrollView addSubview:blueView];
    [scrollView addSubview:yellowView];
    
    scrollView.contentSize = CGSizeMake(300, 750);
    [self.view addSubview:scrollView];
}

@end
