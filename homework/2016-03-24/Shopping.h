//
//  Shopping.h
//  0324作业
//
//  Created by AppleUser on 16/3/25.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shopping : NSObject{
    @public
    NSString *_instrument;
}
+(NSString *)support:(NSString *)instrument;
-(void)setinstrument:(NSString *)instrument;
@end
