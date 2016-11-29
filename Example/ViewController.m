//
//  ViewController.m
//  Example
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewController.h"
#import "TestCollectionViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray * dataArray;
@property (nonatomic, retain) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"IdentifierForReusable";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataArray = @[@"在TableView 上的应用", @"在TableView 上的应用"];
    
    [self.view addSubview:self.tableView];
}


// MARK: - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell identifierForReusable] forIndexPath:indexPath];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * controller = nil;
    if (indexPath.row == 0) {
        controller = [[TestTableViewController alloc] init];
    } else {
        controller = [[TestCollectionViewController alloc] init];
    }
    controller.title = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

// MARK: - get
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, AppWidth, AppHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerCellClass:[UITableViewCell class]];
    }
    return _tableView;
}


@end
