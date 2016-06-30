//
//  MyView.h
//  homework0505
//
//  Created by baiheng on 16/5/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ButtonProtocol <NSObject>

-(void) buttonPressed;


@end


@interface MyView : UIView


@property(nonatomic,weak) id<ButtonProtocol> delegate;



@end
