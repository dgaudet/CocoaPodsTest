//
//  CocoaPodsTestTests.m
//  CocoaPodsTestTests
//
//  Created by Dean on 11/13/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <XCTest/XCTest.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

@interface CocoaPodsTestTests : XCTestCase

@end

@implementation CocoaPodsTestTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    // mock creation
    NSMutableArray *mockArray = mock([NSMutableArray class]);
    
    // using mock object
    [mockArray addObject:@"one"];
    [mockArray removeAllObjects];
    
    // verification
    [verify(mockArray) addObject:@"one"];
    [verify(mockArray) removeAllObjects];
}

@end
