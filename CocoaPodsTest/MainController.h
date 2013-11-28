//
//  ViewController.h
//  CocoaPodsTest
//
//  Created by Dean on 11/13/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DGAlertView;
@class StringHelper;

@interface MainController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *lowerCaseTextField;
@property (weak, nonatomic) IBOutlet UIButton *lowerCaseButton;
@property (strong, nonatomic) DGAlertView *alertView;
@property (strong, nonatomic) StringHelper *stringHelper;

- (IBAction)lowerCaseButtonTap;

@end
