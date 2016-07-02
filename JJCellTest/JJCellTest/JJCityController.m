//
//  JJCityController.m
//  JJCellTest
//
//  Created by GM on 16/5/30.
//  Copyright © 2016年 zhuoran. All rights reserved.
//

#import "JJCityController.h"
#import "JJGoodViewCell.h"
#import "JJMyGoodViewCell.h"

@interface JJCityController ()

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation JJCityController

- (NSMutableArray *)arr {
    if(_arr == nil) {
        _arr = [NSMutableArray arrayWithObjects:@"添加商品", nil];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addCell:(id)sender {
    
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //2.2将新增加的数据加载到构建的最后一行的indexPath中
    [self.tableView insertRowsAtIndexPaths:@[lastIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    JJGoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.arr[indexPath.row];
    cell.goodNameLabel.text = nil;
    cell.goodImageview.image = nil;
    return cell;
    


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.arr.count -1) {
    
        [self.arr insertObject:@"此过程需要一个瑜伽垫, 200*100*5" atIndex:indexPath.row];
        //2.2将新增加的数据加载到构建的最后一行的indexPath中
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

        NSLog(@"增加了一行");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}




@end
