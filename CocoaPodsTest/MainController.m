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
- (void)setupColorAndBackground;

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
    [self setupColorAndBackground];
}

- (void)setupColorAndBackground {
    CGRect backgroundRect = [[UIScreen mainScreen] bounds];
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:backgroundRect];
    UIImage *backgroundImage = [UIImage imageNamed:@"background"];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568) {
        backgroundImage = [UIImage imageNamed:@"background1136"];
    }
    [backgroundView setImage:backgroundImage];
    [self.view addSubview:backgroundView];
    [self.view sendSubviewToBack:backgroundView];

    
    UIColor *collegeMobileRedColor = [UIColor colorWithRed:1 green:0 blue:0.063 alpha:1.0];
    UIColor *customGrayColor = [UIColor colorWithRed:0.867 green:0.867 blue:0.867 alpha:1.0];
    [_lowerCaseButton setTitleColor:collegeMobileRedColor forState:UIControlStateNormal];
    _lowerCaseButton.backgroundColor = customGrayColor;
    _lowerCaseTextField.layer.masksToBounds = YES;
    _lowerCaseTextField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _lowerCaseTextField.layer.borderWidth = 1.0f;
    
    [_replaceButton setTitleColor:collegeMobileRedColor forState:UIControlStateNormal];
    _replaceButton.backgroundColor = customGrayColor;
    _replaceMatcherTextField.layer.masksToBounds = YES;
    _replaceMatcherTextField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    _replaceMatcherTextField.layer.borderWidth = 1.0f;
}

- (IBAction)lowerCaseButtonTap {
    [self hideKeyboard];
    NSString *title = @"Please enter a string to lower case";
    NSString *message = @"";
    if (_lowerCaseTextField.text.length > 0) {
        message = [NSString stringWithFormat:@"Original: %@", _lowerCaseTextField.text];
        NSString *loweredText = [_stringHelper toLowerWholeString:_lowerCaseTextField.text];
        title = [NSString stringWithFormat:@"Lowered: %@", loweredText];
    }
    [_alertView showWithTitle:title message:message];
}

- (IBAction)replaceButtonTap {
    [self hideKeyboard];
    NSString *title = @"Please enter a string to search for replacements, and a match for replacing";
    NSString *message = @"";
    if (_lowerCaseTextField.text.length > 0 && _replaceMatcherTextField.text.length > 0) {
        message = [NSString stringWithFormat:@"Original: %@", _lowerCaseTextField.text];
        NSString *replacedText = [_stringHelper replaceWithHash:_replaceMatcherTextField.text inString:_lowerCaseTextField.text];
        title = [NSString stringWithFormat:@"Result: %@", replacedText];
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

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
