//
//  LCTableViewController.m
//  MySimpleCode
//
//  Created by Long on 2019/11/27.
//  Copyright © 2019 Long. All rights reserved.
//

#import "LCPlainTableViewController.h"

static NSString *const LCTableViewCellReuseIdentifier = @"LCTableViewCellReuseIdentifier";

@interface LCPlainTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation LCPlainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LCTableViewCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LCTableViewCellReuseIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@:%@-%@", NSStringFromClass(self.class), @(indexPath.section), @(indexPath.row)];
    return cell;
}

#pragma mark - UITableViewDelegate


#pragma mark - Getter/Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        NSMutableArray *section1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
        NSMutableArray *section2 = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F", nil];
        _datas = [NSMutableArray arrayWithObjects:section1,section2, nil];
    }
    return _datas;
}

@end
