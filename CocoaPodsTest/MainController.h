//
//  ViewController.h
//  CocoaPodsTest
//
//  Created by Dean on 11/13/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *lowerCaseTextField;
@property (weak, nonatomic) IBOutlet UIButton *lowerCaseButton;

- (IBAction)lowerCaseButtonTap;

@end
