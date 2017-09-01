//
//  HJTableViewController.m
//  batchDeleteTableView
//
//  Created by MrHuang on 17/9/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJTableViewController.h"
#import "HJTableViewCell.h"

@interface HJTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic,strong)NSMutableArray *sourceArray;

//将要删除的被选中的模型数据
@property (nonatomic,strong)NSMutableArray *deleteArray;

@end

@implementation HJTableViewController

- (NSMutableArray *)deleteArray{

    if (!_deleteArray) {
        _deleteArray = [NSMutableArray array];
    }
    
    return _deleteArray;
}


- (NSMutableArray *)sourceArray{
    
    if (_sourceArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"deals.plist" ofType:nil];
        
        NSArray *file = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *dicArray = [NSMutableArray array];
        
        for (NSDictionary *dic in file) {
            SourceModel *sources = [SourceModel dealWithDict:dic];
            [dicArray addObject:sources];
        }
        
        _sourceArray = dicArray;
    }
    return _sourceArray;
}


// 批量删除数据
- (IBAction)removeSources:(id)sender {
    
    // 从数据数组中删除被选中的模型数组
    [self.sourceArray removeObjectsInArray:self.deleteArray];
    
    [self.tableView reloadData];
    
    //清空将要删除的数组模型,
    [self.deleteArray removeAllObjects];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return self.sourceArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HJTableViewCell *cell = [HJTableViewCell cellWithTableView:tableView];
    cell.sourceModel = self.sourceArray[indexPath.row];
    
    // 模型的打钩属性取反
    cell.checkView.hidden = ![self.deleteArray containsObject:cell.sourceModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 取消选中某一行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SourceModel *sourceModel = self.sourceArray[indexPath.row];
    
    if ([self.deleteArray containsObject:sourceModel]) {//数组中包含了被选中的
       
        
        [self.deleteArray removeObject:sourceModel];
    }else {
        
        [self.deleteArray addObject:sourceModel];
    }
    
    
    [tableView reloadData];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
 }
@end
