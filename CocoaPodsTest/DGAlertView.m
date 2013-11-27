//
//  DGAlertView.m
//  CocoaPodsTest
//
//  Created by Dean on 11/26/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import "DGAlertView.h"

@implementation DGAlertView

- (id)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:Nil cancelButtonTitle:nil otherButtonTitles:nil];
    }
    return self;
}

- (void)show {
    [_alert show];
}

@end
