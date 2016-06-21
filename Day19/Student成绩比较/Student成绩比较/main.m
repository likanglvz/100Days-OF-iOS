//
//  main.m
//  Student成绩比较
//
//  Created by 李康 on 16/3/18.
//  Copyright © 2016年 李康. All rights reserved.
//






#import <Foundation/Foundation.h>

@interface Stu : NSObject
{
    @public
    char * _name;
    int _score;
}
-(int)compareScoreWithOther:(Stu*)other;
@end

@implementation Stu

-(int)compareScoreWithOther:(Stu*)other
{
    return _score-other->_score;
}
@end
int main(int argc, const char * argv[]) {
    Stu *s1 = [Stu new];
    s1->_score = 89;
    s1->_name = "二狗";
    
    Stu *s2 = [Stu new];
    s2->_score = 78;
    s2->_name = "大马猴";
    
    int sub = [s1 compareScoreWithOther:s2];
    
    NSLog(@"s1与s2成绩之差为%d",sub);
    
    
    return 0;
}
