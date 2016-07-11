//
//  Person+EmailAddress.m
//  testAssociate
//
//  Created by baiheng on 16/6/5.
//  Copyright © 2016年 baiheng. All rights reserved.
//
#import <objc/runtime.h>

#import "Person+EmailAddress.h"

@implementation Person (EmailAddress)


static char emailAddressKey;

- (NSString *)emailAddress {
    return objc_getAssociatedObject(self, &emailAddressKey);
}
- (void)setEmailAddress:(NSString *)emailAddress {
    objc_setAssociatedObject(self, &emailAddressKey,emailAddress,
                             OBJC_ASSOCIATION_COPY);
                             }

@end
