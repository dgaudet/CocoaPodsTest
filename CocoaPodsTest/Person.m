//
//  Person.m
//  CocoaPodsTest
//
//  Created by Dean on 11/23/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import "Person.h"

@implementation Person

- (Person *)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    self.name = name;
    self.age = age;
    return self;
}

- (BOOL)canGoToBar {
    if (self.age < 19) {
        return NO;
    }
    return YES;
}

@end
