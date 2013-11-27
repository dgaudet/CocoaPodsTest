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
    NSString *finalString = @"";
    NSRange firstRange = [string rangeOfString:replace];

    if (firstRange.location != NSNotFound) {
        if (firstRange.location == 0 && firstRange.length == 1 && string.length == 1) {
            finalString = token;
        } else {
            NSString *beforeMatch = [string substringWithRange:(NSRange){0, firstRange.location}];
            finalString = [beforeMatch stringByAppendingString:token];
            
            NSString *afterMatch = [string substringFromIndex:firstRange.location + firstRange.length];
            NSRange secondRange = [afterMatch rangeOfString:replace];
            if (secondRange.location == NSNotFound) {
                finalString = [finalString stringByAppendingString:afterMatch];
            } else {
                NSString *beforeMatch2 = [afterMatch substringWithRange:(NSRange){0, secondRange.location}];
                finalString = [finalString stringByAppendingFormat:@"%@%@", beforeMatch2, token];
                NSString *afterMatch2 = [afterMatch substringFromIndex:secondRange.location + secondRange.length];
                
                NSRange thirdRange = [afterMatch2 rangeOfString:replace];
                if (thirdRange.location == NSNotFound) {
                    finalString = [finalString stringByAppendingString:afterMatch2];
                } else {
                    NSString *beforeMatch3 = [afterMatch2 substringWithRange:(NSRange){0, thirdRange.location}];
                    finalString = [finalString stringByAppendingFormat:@"%@%@", beforeMatch3, token];
                    NSString *afterMatch3 = [afterMatch2 substringFromIndex:thirdRange.location + thirdRange.length];
                    finalString = [finalString stringByAppendingString:afterMatch3];
                }
            }
        }
    } else {
        finalString = string;
    }
    return finalString;
}

@end
