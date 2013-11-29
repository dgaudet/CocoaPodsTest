//
//  ViewController.m
//  CocoaPodsTest
//
//  Created by Dean on 11/13/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import "MainController.h"
#import "DGAlertView.h"
#import "StringHelper.h"

@interface MainController ()

- (void)hideKeyboard;
- (void)setupColors;

@end

@implementation MainController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _alertView = [[DGAlertView alloc] init];
        _stringHelper = [[StringHelper alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupColors];
}

- (void)setupColors{
    UIColor *collegeMobileRed = [UIColor colorWithRed:1 green:0 blue:0.063 alpha:1.0];
    _lowerCaseButton.backgroundColor = collegeMobileRed;
    _replaceButton.backgroundColor = collegeMobileRed;
}

- (IBAction)lowerCaseButtonTap {
    [self hideKeyboard];
    NSString *title = @"Please enter a string to lower case";
    NSString *message = @"";
    if (_lowerCaseTextField.text.length > 0) {
        title = [NSString stringWithFormat:@"Original: %@", _lowerCaseTextField.text];
        message = [_stringHelper toLowerWholeString:_lowerCaseTextField.text];
    }
    [_alertView showWithTitle:title message:message];
}

- (IBAction)replaceButtonTap {
    [self hideKeyboard];
    NSString *title = @"Please enter a string to search for replacements, and a match for replacing";
    NSString *message = @"";
    if (_lowerCaseTextField.text.length > 0 && _replaceMatcherTextField.text.length > 0) {
        title = [NSString stringWithFormat:@"Original: %@", _lowerCaseTextField.text];
        message = [_stringHelper replaceWithHash:_replaceMatcherTextField.text inString:_lowerCaseTextField.text];
    }
    [_alertView showWithTitle:title message:message];
}

- (void)hideKeyboard {
    [_lowerCaseTextField resignFirstResponder];
    [_replaceMatcherTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
