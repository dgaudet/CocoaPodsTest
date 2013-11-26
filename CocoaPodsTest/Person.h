//
//  Person.h
//  CocoaPodsTest
//
//  Created by Dean on 11/23/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic) NSInteger age;

- (Person *)initWithName:(NSString *)name age:(NSInteger)age;
- (BOOL)canGoToBar;

@end
