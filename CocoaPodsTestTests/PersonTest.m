//
//  PersonTest.m
//  CocoaPodsTest
//
//  Created by Dean on 11/23/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTest : XCTestCase

@end

@implementation PersonTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testInitWithNameAge_ShouldSetName {
    NSString *name = @"test";
    Person *person = [[Person alloc] initWithName:name age:22];
    
    XCTAssertNotNil(person);
    XCTAssertNotNil(person.name);
    XCTAssertEqualObjects(person.name, name);
}

- (void)testInitWithNameAge_ShouldSetAge {
    NSInteger age = 10;
    Person *person = [[Person alloc] initWithName:@"name" age:age];
    
    XCTAssertNotNil(person);
    XCTAssertEqual(person.age, age);
}

- (void)testCanGoToBar_ShouldReturnFalseGivenAgeUnder19 {
    NSInteger age = 18;
    Person *person = [[Person alloc] initWithName:@"name" age:age];
    
    XCTAssertNotNil(person);
    XCTAssertFalse(person.canGoToBar);
}

- (void)testCanGoToBar_ShouldReturnTrueGivenAgeOver19 {
    NSInteger age = 20;
    Person *person = [[Person alloc] initWithName:@"name" age:age];
    
    XCTAssertNotNil(person);
    XCTAssertTrue(person.canGoToBar);
}

- (void)testCanGoToBar_ShouldReturnTrueGivenAgeIs19 {
    NSInteger age = 19;
    Person *person = [[Person alloc] initWithName:@"name" age:age];
    
    XCTAssertNotNil(person);
    XCTAssertTrue(person.canGoToBar);
}

@end
