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
#import "DGAlertView.h"

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
    [super tearDown];
    
    _controller = nil;
}

- (void)testController_ShouldConnectOutlets {
    [_controller view];
    
    XCTAssertNotNil([_controller titleLabel]);
    XCTAssertNotNil([_controller lowerCaseTextField]);
    XCTAssertNotNil([_controller lowerCaseButton]);
}

- (void)testViewDidLoad_ShouldDisplay_CorrectText {
    [_controller view];
    
    XCTAssertEqualObjects(_controller.titleLabel.text, @"College Mobile Coding Kata");
}

- (void)testLowerCaseButtonTap_ShouldBeInitializedToButton {
    [_controller view];
    
    NSArray *actions = [_controller.lowerCaseButton actionsForTarget:_controller forControlEvent:UIControlEventTouchUpInside];
    XCTAssertEqual([actions count], 1U);
    XCTAssertEqualObjects(actions[0], @"lowerCaseButtonTap");
}

- (void)testLowerCaseButtonTap_ShouldLoadAlertWithCorrectTitle_GivenEmptyTextField {
    [_controller view];
    DGAlertView *mockAlert = mock([DGAlertView class]);
    _controller.alertView = mockAlert;
    
    //execute
    [_controller lowerCaseButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:@"Test"];
}

//verify initilization sets the alert view properly

@end
