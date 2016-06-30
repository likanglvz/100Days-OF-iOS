//
//  calculatorDemoTests.m
//  calculatorDemoTests
//
//  Created by baiheng on 16/5/6.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MyModel.h"


@interface calculatorDemoTests : XCTestCase
@property(strong,nonatomic) MyModel *mymodel;

@end

@implementation calculatorDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.mymodel = [[MyModel alloc]init];
    
    
    
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.mymodel = nil;
}

-(void)testMyModelIsTure{
    
    BOOL result = [self.mymodel isTure];
    
    XCTAssertTrue(result,@"Expected myModel to be Ture,got %d",result);
    
    
}

-(void)testmyModelIsFalse{
    
    BOOL result = [self.mymodel isFalse];
    XCTAssertFalse(result,@"Expected myModel to be False,got %d",result);
    
}

-(void)testmyModelHelloWorld{
    
    NSString *result = [self.mymodel helloWorld];
    
    XCTAssertEqualObjects(result, @"Hello World!");
}

-(void)testMymodelSetModel{
    
    [self.mymodel setModel:'C'];
    
    XCTAssertEqual([[self.mymodel valueForKey:@"accumulator"]doubleValue],0.0);
    
    XCTAssertEqual([[self.mymodel valueForKey:@"opr"]doubleValue], 0.0);
    
    
    
}








- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
