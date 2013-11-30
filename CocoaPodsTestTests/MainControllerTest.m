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
    XCTAssertNotNil([_controller lowerCaseLabel]);
    XCTAssertNotNil([_controller lowerCaseTextField]);
    XCTAssertNotNil([_controller lowerCaseButton]);
    XCTAssertNotNil([_controller replaceLabel]);
    XCTAssertNotNil([_controller replaceButton]);
    XCTAssertNotNil([_controller replaceMatcherTextField]);
}

- (void)testController_ShouldBeInitializeProperly {
    XCTAssertTrue([_controller.alertView isKindOfClass:[DGAlertView class]]);
    XCTAssertTrue([_controller.stringHelper isKindOfClass:[StringHelper class]]);
}

- (void)testViewDidLoad_ShouldDisplayCorrectTextForLabelsAndButtons {
    XCTAssertEqualObjects(_controller.titleLabel.text, @"CollegeMobile Coding Kata");
    XCTAssertEqualObjects(_controller.lowerCaseLabel.text, @"Enter text here:");
    XCTAssertEqualObjects(_controller.lowerCaseButton.titleLabel.text, @"Tap to lower case the above text");
    XCTAssertEqualObjects(_controller.replaceLabel.text, @"Enter text to be replaced:");
    XCTAssertEqualObjects(_controller.replaceButton.titleLabel.text, @"Tap to replace any item in the first text that matches replacement text by hash");
    
    XCTAssertEqualObjects(_controller.lowerCaseTextField.text, @"");
    XCTAssertEqualObjects(_controller.replaceMatcherTextField.text, @"b");
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
    NSString *stringToLower = @"LOWERme";
    _controller.lowerCaseTextField.text = stringToLower;
    
    NSString *expectedMessage = [NSString stringWithFormat:@"Original: %@", stringToLower];
    NSString *loweredText = @"lowered";
    [given([mockHelper toLowerWholeString:stringToLower]) willReturn:loweredText];
    NSString *expectedTitle = [NSString stringWithFormat:@"Lowered: %@", loweredText];
    
    //execute
    [_controller lowerCaseButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:expectedTitle message:expectedMessage];
}

//enter should invoke the correct method

- (void)testReplaceButtonTap_ShouldBeInitializedToButton {
    NSArray *actions = [_controller.replaceButton actionsForTarget:_controller forControlEvent:UIControlEventTouchUpInside];
    
    XCTAssertEqual([actions count], 1U);
    XCTAssertEqualObjects(actions[0], @"replaceButtonTap");
}

- (void)testReplaceButtonTap_ShouldLoadAlertWithCorrectTitleAndMessage_GivenEmptyLowerCaseTextField {
    DGAlertView *mockAlert = mock([DGAlertView class]);
    _controller.alertView = mockAlert;
    
    //execute
    [_controller replaceButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:@"Please enter a string to search for replacements, and a match for replacing" message:@""];
}

- (void)testReplaceButtonTap_ShouldLoadAlertWithCorrectTitleAndMessage_GivenEmptyReplaceMatcherTextField {
    DGAlertView *mockAlert = mock([DGAlertView class]);
    _controller.alertView = mockAlert;
    NSString *stringToBeReplaced = @"LOWERme";
    _controller.lowerCaseTextField.text = stringToBeReplaced;
    _controller.replaceMatcherTextField.text = @"";
    
    //execute
    [_controller replaceButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:@"Please enter a string to search for replacements, and a match for replacing" message:@""];
}

- (void)testReplaceButtonTap_ShouldLoadAlertWithCorrectTitleAndMessage_GivenEmptyLowerCaseAndReplaceMatcherTextFields {
    DGAlertView *mockAlert = mock([DGAlertView class]);
    _controller.alertView = mockAlert;
    _controller.lowerCaseTextField.text = @"";
    _controller.replaceMatcherTextField.text = @"";
    
    //execute
    [_controller replaceButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:@"Please enter a string to search for replacements, and a match for replacing" message:@""];
}

- (void)testReplaceButtonTap_ShouldLoadAlertWithCorrectTitleAndMessage_GivenValidInputTextField {
    DGAlertView *mockAlert = mock([DGAlertView class]);
    StringHelper *mockHelper = mock([StringHelper class]);
    _controller.alertView = mockAlert;
    _controller.stringHelper = mockHelper;
    NSString *stringToBeReplaced = @"LOWERme";
    _controller.lowerCaseTextField.text = stringToBeReplaced;
    NSString *stringMatcher = @"f";
    _controller.replaceMatcherTextField.text = stringMatcher;
    
    NSString *expectedMessage = [NSString stringWithFormat:@"Original: %@", stringToBeReplaced];
    NSString *replacedString = @"replaced string";
    
    [given([mockHelper replaceWithHash:stringMatcher inString:stringToBeReplaced]) willReturn:replacedString];
    NSString *expectedTitle = [NSString stringWithFormat:@"Result: %@", replacedString];
    
    //execute
    [_controller replaceButtonTap];
    
    //assert
    [verify(mockAlert) showWithTitle:expectedTitle message:expectedMessage];
}

- (void)testLowerCaseButtonTap_ShouldHideKeyboard {
    UITextField *mockLowerCaseTextField = mock([UITextField class]);
    _controller.lowerCaseTextField = mockLowerCaseTextField;
    UITextField *mockReplaceTextField = mock([UITextField class]);
    _controller.replaceMatcherTextField = mockReplaceTextField;
    
    //execute
    [_controller lowerCaseButtonTap];
    
    //assert
    [verify(mockLowerCaseTextField) resignFirstResponder];
    [verify(mockReplaceTextField) resignFirstResponder];
}

- (void)testReplaceButtonTap_ShouldHideKeyboard {
    UITextField *mockLowerCaseTextField = mock([UITextField class]);
    _controller.lowerCaseTextField = mockLowerCaseTextField;
    UITextField *mockReplaceTextField = mock([UITextField class]);
    _controller.replaceMatcherTextField = mockReplaceTextField;
    
    //execute
    [_controller replaceButtonTap];
    
    //assert
    [verify(mockLowerCaseTextField) resignFirstResponder];
    [verify(mockReplaceTextField) resignFirstResponder];
}

@end
