//
//  CircleLayout.m
//  collectionLayoutCoding
//
//  Created by baiheng on 16/5/9.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "CircleLayout.h"

//单元尺寸
#define ITEM_SIZE 118

@interface CircleLayout()

@property(nonatomic,assign) CGPoint center;
@property(nonatomic,assign) CGFloat radius;



@end


@implementation CircleLayout

//准备更新layout
-(void) prepareLayout
{
    [super prepareLayout];
    
    
    
    CGSize size = self.collectionView.frame.size;
    
    //中心
    _center = CGPointMake(size.width/2.0, size.height/2.0);
    //半径
    _radius = MIN(size.width, size.height)/2.5;
    
    
    
}


-(CGSize) collectionViewContentSize
{
    return self.collectionView.frame.size;
    
}




//为每一项创建布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建并返回单元格的布局属性
    UICollectionViewLayoutAttributes * attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //单元格的尺寸
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    
    //各单元格的中心位置
    attributes.center = CGPointMake(_center.x + _radius*cosf(2*M_PI*indexPath.item/8), _center.y + _radius*sinf(2*M_PI*indexPath.item/8));
    
    return attributes;
    
}

//各单元格布局属性组成的数组
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * attributes = [NSMutableArray array];
    
    for (NSInteger i=0; i<8; i++) {
        
        //根据indexpath，设定各个单元格的布局属性
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        
        
    }
    
    return attributes;
    
    
}





@end













