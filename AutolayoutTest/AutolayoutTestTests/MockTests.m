//
//  MockTests.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 27.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ClassA.h"
#import "ClassB.h"
#import <OCMock/OCMock.h>

@interface MockTests : XCTestCase

@end

@implementation MockTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReal {
    
    ClassA *a = [ClassA new];
    ClassB *b = [ClassB new];
    
    a.peer = b;
    NSString *dataSent = @"Pedal";
    NSString *dataExpected = @"Pedal - Pedal";
    NSString *result = [a sendDataAndReceiveResponse:dataSent];
    
    XCTAssert([dataExpected isEqualToString:result], "Data is doubled.");
}

- (void)testMock {
    
    ClassA *a = [ClassA new];
    
    id mockB = OCMClassMock([ClassB class]);
    
    a.peer = mockB;
    NSString *dataSent = @"Pedal";
    NSString *dataExpected = @"Gej";
    OCMStub([mockB respondToMessage:[OCMArg any]]).andReturn(dataExpected);
    
    NSString *result = [a sendDataAndReceiveResponse:dataSent];
    
    XCTAssert([dataExpected isEqualToString:result], "Data is doubled.");
}

- (void)testVerify {
    
    ClassA *a = [ClassA new];
    
    id mockB = OCMClassMock([ClassB class]);
    
    a.peer = mockB;
    NSString *dataSent = @"Pedal";
    NSString *dataSent2 = [NSString stringWithFormat:@"%@%@",@"Ped",@"al"];
    
   [a sendDataAndReceiveResponse:dataSent];
    
    OCMVerify([mockB respondToMessage:dataSent2]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
