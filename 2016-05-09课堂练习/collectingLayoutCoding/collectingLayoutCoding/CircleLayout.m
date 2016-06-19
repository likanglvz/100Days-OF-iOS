//
//  CircleLayout.m
//  collectingLayoutCoding
//
//  Created by 李康 on 16/5/9.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "CircleLayout.h"

//单元格尺寸
#define ITEM_SIZE 138

@interface CircleLayout()

@property(nonatomic,assign)CGPoint center;
@property(nonatomic,assign)CGFloat redius;


@end




@implementation CircleLayout


//准备更新layout
-(void)prepareLayout{
    
    
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    //中心
    _center = CGPointMake(size.width/2.0, size.height/2.0);
    // 半径
    _redius = MIN(size.width, size.height)/2.5;
    
    
    
    
}

-(CGSize)collectionViewContentSize{
    
    
    return self.collectionView.frame.size;
    
    
}
//为每一项创建属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    //创建 并返回单元格的布局属性
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes  layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);// 单元格的尺寸
    
    //各单元格的中心位置
    attributes.center =CGPointMake(_center.x+_redius*cosf(2*indexPath.item*M_PI/8), _center.y+_redius*sinf(2*indexPath.item*M_PI/8));
    
    return attributes;
    
}

//各单元格布局属性组成的数组
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0; i<8; i++) {
        //根据indexpath 设定各个单元格的布局属性；
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        
    }
    return attributes;
    
    
}










@end
