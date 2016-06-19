//
//  Cell.m
//  collectingLayoutCoding
//
//  Created by 李康 on 16/5/9.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //初始化imageView 和label
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(8, 100, 120, 21)];
        [self.contentView addSubview:self.label];
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 8, 120, 90)];
        [self.contentView addSubview:self.imageView];
        //单元格背景
        self.contentView.backgroundColor = [UIColor grayColor];
        
        
        
        
        
        
    }
    
    
    
    return self;
}


@end
