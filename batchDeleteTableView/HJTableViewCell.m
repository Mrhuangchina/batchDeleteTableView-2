//
//  HJTableViewCell.m
//  batchDeleteTableView
//
//  Created by MrHuang on 17/9/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJTableViewCell.h"

@interface HJTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *buycountLabel;

@property (weak, nonatomic) IBOutlet UILabel *pricesLabel;

@end

@implementation HJTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString * cellID = @"cellID";
    
    HJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HJTableViewCell class]) owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setSourceModel:(SourceModel *)sourceModel{
    
    _sourceModel = sourceModel;
    
    self.iconView.image = [UIImage imageNamed:sourceModel.icon];
    self.pricesLabel.text = [NSString stringWithFormat:@"￥%@", sourceModel.price];
    self.titleLabel.text = sourceModel.title;
    self.buycountLabel.text = [NSString stringWithFormat:@"%@人已购买", sourceModel.buyCount];

    // 设置打钩控件的显示和隐藏
    self.checkView.hidden = !sourceModel.isChecked;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
