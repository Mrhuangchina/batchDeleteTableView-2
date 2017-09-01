//
//  HJTableViewCell.h
//  batchDeleteTableView
//
//  Created by MrHuang on 17/9/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SourceModel.h"
@interface HJTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *checkView;

@property (nonatomic,strong) SourceModel *sourceModel;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
