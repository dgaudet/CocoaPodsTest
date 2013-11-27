//
//  DGAlertView.m
//  CocoaPodsTest
//
//  Created by Dean on 11/26/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import "DGAlertView.h"

@implementation DGAlertView

- (void)showWithTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:Nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
}

@end
