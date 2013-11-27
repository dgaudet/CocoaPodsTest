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

#import "MainController.h"

@interface MainControllerTest : XCTestCase

@end

@implementation MainControllerTest {
    MainController *_controller;
}

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _controller = [storyboard instantiateViewControllerWithIdentifier:@"main"];
    [_controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testController_ShouldConnectOutlets {
    [_controller view];
    
    assertThat([_controller titleLabel], is(notNilValue()));
    XCTAssertNotNil([_controller titleLabel]);
}

- (void)testViewDidLoad_ShouldDisplay_CorrectText {
    [_controller view];
    
    XCTAssertEqualObjects(_controller.titleLabel.text, @"College Mobile Coding Kata");
}

- (void)testMockExample
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
