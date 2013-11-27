//
//  DGAlertView.h
//  CocoaPodsTest
//
//  Created by Dean on 11/26/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGAlertView : UIView {
    UIAlertView *_alert;
}

- (id)initWithTitle:(NSString *)title;
- (void)show;

@end
