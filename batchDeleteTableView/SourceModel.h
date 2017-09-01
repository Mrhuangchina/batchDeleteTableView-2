//
//  SourceModel.h
//  batchDeleteTableView
//
//  Created by MrHuang on 17/9/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SourceModel : NSObject

@property (strong, nonatomic) NSString *buyCount;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *icon;

/** 状态量标识有无被打钩 */
@property (assign, nonatomic, getter=isChecked) BOOL checked;

+ (instancetype)dealWithDict:(NSDictionary *)dict;


@end
