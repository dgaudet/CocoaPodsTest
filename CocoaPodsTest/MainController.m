//
//  ViewController.m
//  CocoaPodsTest
//
//  Created by Dean on 11/13/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import "MainController.h"
#import "DGAlertView.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)lowerCaseButtonTap {
    [_alertView showWithTitle:@"Test"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
