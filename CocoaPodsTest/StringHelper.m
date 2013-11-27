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
    NSDictionary *alphabetDict = @{@"A": @"a",
                                    @"B": @"b",
                                    @"C": @"C",
                                    @"D": @"d",
                                    @"E": @"e",
                                    @"F": @"f",
                                    @"G": @"g",
                                    @"H": @"h",
                                    @"I": @"i",
                                    @"J": @"j",
                                    @"K": @"k",
                                    @"L": @"l",
                                    @"M": @"m",
                                    @"N": @"n",
                                    @"O": @"o",
                                    @"P": @"p",
                                    @"Q": @"q",
                                    @"R": @"r",
                                    @"S": @"s",
                                    @"T": @"t",
                                    @"U": @"u",
                                    @"V": @"v",
                                    @"W": @"w",
                                    @"X": @"x",
                                    @"Y": @"y",
                                    @"Z": @"z",
                                    };
    
    for (NSString *key in alphabetDict) {
        if ([original isEqualToString:key]) {
            return [alphabetDict objectForKey:key];
        }
    }
    return original;
}

- (NSString *)toLowerWholeString:(NSString *)original {
    NSString *loweredString = @"";
    for (int i = 0; i < [original length]; i++) {
        loweredString = [NSString stringWithFormat: @"%@%@", loweredString, [self toLower:[original substringWithRange:(NSRange){i,1}]]];
    }
    
//    loweredString = [NSString stringWithFormat: @"%@%@", loweredString, [self toLower:[original substringFromIndex:[original length] - 1]]];
    
//    loweredString = [NSString stringWithFormat: @"%@%@", loweredString, [self toLower:[original substringWithRange:(NSRange){1,1}]]];
    return loweredString;
}

- (NSString *)replaceWithHash:(NSString *)replace inString:(NSString *)string {
    NSString *token = @"#";
    NSString *finalString = string;
    NSRange match = [finalString rangeOfString:replace options:NSCaseInsensitiveSearch];

    while(match.location != NSNotFound) {
        NSString *beforeMatch = [finalString substringWithRange:(NSRange){0, match.location}];
        NSString *tempString = [beforeMatch stringByAppendingString:token];
        
        NSString *afterMatch = [finalString substringFromIndex:match.location + match.length];
        finalString = [tempString stringByAppendingString:afterMatch];
        
        match = [finalString rangeOfString:replace options:NSCaseInsensitiveSearch];
    }
    return finalString;
}

@end
