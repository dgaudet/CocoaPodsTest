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
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)lowerCaseButtonTap {
    NSString *title = @"Please enter a string to lower case";
    NSString *message = @"";
    if (_lowerCaseTextField.text.length > 1) {
        title = [NSString stringWithFormat:@"Original: %@", _lowerCaseTextField.text];
        message = [_stringHelper toLowerWholeString:_lowerCaseTextField.text];
    }
    [_alertView showWithTitle:title message:message];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
