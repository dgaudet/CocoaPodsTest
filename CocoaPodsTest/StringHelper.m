//
//  StringHelper.m
//  CocoaPodsTest
//
//  Created by Dean on 11/25/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper

//unichar testChar = [myString characterAtIndex:charIndex];

- (NSString *)toLower:(NSString *)original {
    NSDictionary *caseMatchDict = @{@"A": @"a",
                                    @"B": @"b",
                                    @"C": @"C",
                                    @"D": @"d",
                                    @"E": @"e",
                                    @"F": @"f",
                                    @"G": @"g",
                                    @"H": @"h",
                                    };
    
    for (NSString *key in caseMatchDict) {
        if ([original isEqualToString:key]) {
            return [caseMatchDict objectForKey:key];
        }
    }
    return original;
}

@end
