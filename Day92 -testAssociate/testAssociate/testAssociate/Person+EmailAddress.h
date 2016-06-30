//
//  Person+EmailAddress.h
//  testAssociate
//
//  Created by baiheng on 16/6/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "Person.h"


@interface Person (EmailAddress)

@property (nonatomic, copy,readwrite) NSString *emailAddress;


@end
