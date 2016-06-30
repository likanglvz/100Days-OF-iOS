//
//  Cell.m
//  collectionLayoutCoding
//
//  Created by baiheng on 16/5/9.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "Cell.h"

@implementation Cell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化imageview，和label
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(8, 100, 100, 21)];
        [self.contentView addSubview:self.label];
        
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, 100, 100)];
        [self.contentView addSubview:self.imageView];
        //单元格背景
        self.contentView.backgroundColor = [UIColor grayColor];
        
    }
    
    return self;
}







@end
