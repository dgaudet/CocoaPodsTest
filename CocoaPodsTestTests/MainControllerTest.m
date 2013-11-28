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
#import "StringHelper.h"

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
    [_controller view];
}

- (void)tearDown
{
    [super tearDown];
    
    _controller = nil;
}

- (void)testController_ShouldConnectOutlets {
    XCTAssertNotNil([_controller titleLabel]);
    XCTAssertNotNil([_controller lowerCaseTextField]);
    XCTAssertNotNil([_controller lowerCaseButton]);
}

- (void)testController_ShouldBeInitializeProperly {
    XCTAssertTrue([_controller.alertView isKindOfClass:[DGAlertView class]]);
    XCTAssertTrue([_controller.stringHelper isKindOfClass:[StringHelper class]]);
}

- (void)testViewDidLoad_ShouldDisplay_CorrectText {
    XCTAssertEqualObjects(_controller.titleLabel.text, @"College Mobile Coding Kata");
}

- (void)testLowerCaseButtonTap_ShouldBeInitializedToButton {
    NSArray *actions = [_controller.lowerCaseButton actionsForTarget:_controller forControlEvent:UIControlEventTouchUpInside];
    
    XCTAssertEqual([actions count], 1U);
    XCTAssertEqualObjects(actions[0], @"lowerCaseButtonTap");
}

- (void)testLowerCaseButtonTap_ShouldLoadAlertWithCorrectTitleAndMessage_GivenEmptyTextField {
    DGAlertView *mockAlert = mock([DGAlertView class]);
    _controller.alertView = mockAlert;
    
    //execute
    [_controller lowerCaseButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:@"Please enter a string to lower case" message:@""];
}

- (void)testLowerCaseButtonTap_ShouldLoadAlertWithCorrectTitleAndMessage_GivenTextFieldWithString {
    DGAlertView *mockAlert = mock([DGAlertView class]);
    StringHelper *mockHelper = mock([StringHelper class]);
    _controller.alertView = mockAlert;
    _controller.stringHelper = mockHelper;
    NSString *test = @"LOWERme";
    _controller.lowerCaseTextField.text = test;
    
    NSString *expectedTitle = [NSString stringWithFormat:@"Original: %@", test];
    NSString *expectedMessage = @"lowered";
    [given([mockHelper toLowerWholeString:test]) willReturn:expectedMessage];
    
    //execute
    [_controller lowerCaseButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:expectedTitle message:expectedMessage];
}

//enter should invoke the correct method

@end
