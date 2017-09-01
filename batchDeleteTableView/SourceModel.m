//
//  SourceModel.m
//  batchDeleteTableView
//
//  Created by MrHuang on 17/9/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "SourceModel.h"

@implementation SourceModel

+(instancetype)dealWithDict:(NSDictionary *)dict{
    
    SourceModel *sourceModel = [[self alloc]init];
    
    [sourceModel setValuesForKeysWithDictionary:dict];
 
    return sourceModel;
}



@end
