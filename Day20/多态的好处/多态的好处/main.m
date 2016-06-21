//
//  main.m
//  多态的好处
//
//  Created by 李康 on 16/3/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
void show(Person *p)
{
   [p say];
}
Person* show1(NSString *c)
{
    if ([c isEqualToString:@"person"]) {
        return [Person new];
    }else{
        return [Teacher new];
    }
}
int main(int argc, const char * argv[]) {
    Teacher *t = [Teacher new];
    t.age = 23;
    t.name = @"老师";
//    [t setName:@"老师"];
    t.salary = 100;
//    NSLog(@"t的salary为%f",[t salary]);
    double s = t.salary;
    //NSLog(@"t的salary为%f",s);
   // show(t);
#if 0
    Person *p = [Person new];
    show(p);
    
    Person *p1 = show1(@"ssss");
    [p1 say];
#endif
    
    return 0;
}
