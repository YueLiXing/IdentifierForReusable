//
//  TestTableViewController.m
//  Example
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "TestTableViewController.h"
#import "RedTableViewCell.h"
#import "GreenTableViewCell.h"
#import "SectionHeaderView.h"
#import "SectionFooterView.h"

#pragma mark - ListModel

@interface ListModel : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) BOOL isRed;

@end
@implementation ListModel

@end


#pragma mark - TestTableViewController

@interface TestTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray<ListModel *> * dataArray;

@property (nonatomic, retain) UITableView * tableView;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    NSArray * titles = @[
                         @"一直在盼望着一段美丽的爱",
                         @"所以我毫不犹疑地将你舍弃",
                         @"流浪的途中我不断寻觅",
                         @"却没料到回首之时",
                         @"年轻的你从未稍离",
                         @"从未稍离的你在我心中",
                         @"春天来时便反复地吟唱",
                         @"那滨江路上的灰沙炎曰",
                         @"那丽水街前的一地月光",
                         @"那清晨园中为谁摘下的茉莉",
                         @"那渡船头上风里翻飞的裙裳",
                         @"在风里翻飞然后纷纷坠落",
                         @"岁月深埋在土中便成琥珀",
                         @"在灰色的黎明前我怅然回顾",
                         @"亲爱的朋友啊",
                         @"难道鸟必要自焚才能成为凤凰",
                         @"难道青春必要愚昧",
                         @"爱必得忧伤"];
    for (int i = 0; i < titles.count; i++) {
        ListModel * model = [ListModel new];
        model.isRed = arc4random()%2==0;
        model.title = [titles objectAtIndex:i];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}


// MARK: - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListModel * model = self.dataArray[indexPath.row];
    if (model.isRed) {
        RedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[RedTableViewCell identifierForReusable] forIndexPath:indexPath];
        cell.string = model.title;
        return cell;
    } else {
        GreenTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[GreenTableViewCell identifierForReusable] forIndexPath:indexPath];
        cell.string = model.title;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListModel * model = self.dataArray[indexPath.row];
    return model.isRed ? 40 : 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [SectionHeaderView height];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SectionHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[SectionHeaderView identifierForReusable]];
    headerView.title = @"《回首》  席慕容";
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    SectionFooterView * footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[SectionFooterView identifierForReusable]];
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ListModel * model = self.dataArray[indexPath.row];
    NSLog(@"%@", model.title);
}

// MARK: - get
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, AppWidth, AppHeight-64) style:UITableViewStylePlain];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 40, 0, 20);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerCellClass:[RedTableViewCell class]];
        [_tableView registerCellClass:[GreenTableViewCell class]];
        [_tableView registerHeaderFooterClass:[SectionHeaderView class]];
        [_tableView registerHeaderFooterClass:[SectionFooterView class]];
    }
    return _tableView;
}
@end
