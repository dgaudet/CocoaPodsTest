//
//  StringHelperTest.m
//  CocoaPodsTest
//
//  Created by Dean on 11/25/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StringHelper.h"

@interface StringHelperTest : XCTestCase

@end

@implementation StringHelperTest {
    StringHelper *_helper;
}

- (void)setUp
{
    [super setUp];
    _helper = [[StringHelper alloc] init];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#pragma mark - ToLower Tests

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenA
{
    NSString *aChar = @"A";
    
    XCTAssertEqualObjects([_helper toLower:(aChar)], @"a");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenB
{
    NSString *aChar = @"B";
    
    XCTAssertEqualObjects([_helper toLower:(aChar)], @"b");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenLowerCaseLetter
{
    NSString *aChar = @"b";
    
    XCTAssertEqualObjects([_helper toLower:(aChar)], @"b");
}

- (void)testToLower_ShouldReturnSameItem_GivenNonAlphabetCharacter
{
    NSString *aChar = @"1";
    
    XCTAssertEqualObjects([_helper toLower:(aChar)], @"1");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenM
{
    NSString *aChar = @"H";

    XCTAssertEqualObjects([_helper toLower:(aChar)], @"h");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenZ
{
    NSString *aChar = @"Z";
    
    XCTAssertEqualObjects([_helper toLower:(aChar)], @"z");
}

- (void)testToLower_ShouldReturnEmptyString_GivenEmptyString
{
    NSString *noChar = @"";
    
    XCTAssertEqualObjects([_helper toLower:(noChar)], @"");
}

//throw if string is larger than one length

#pragma mark - ToLowerWholeString Tests

- (void)testToLowerWholeString_ShouldReturnLowerCaseLetter_GivenA
{
    NSString *aChar = @"A";
    
    XCTAssertEqualObjects([_helper toLowerWholeString:(aChar)], @"a");
}

- (void)testToLowerWholeString_ShouldReturnLowerCaseString_GivenTwoLetters
{
    NSString *aChar = @"AB";
    
    XCTAssertEqualObjects([_helper toLowerWholeString:(aChar)], @"ab");
}

- (void)testToLowerWholeString_ShouldReturnLowerCaseString_GivenThreeLetters
{
    NSString *aChar = @"ABC";
    
    XCTAssertEqualObjects([_helper toLowerWholeString:(aChar)], @"abc");
}

- (void)testToLowerWholeString_ShouldReturnLowerCaseString_GivenLettersAndOtherCharacters
{
    NSString *aChar = @"Gr3@t3st";
    
    XCTAssertEqualObjects([_helper toLowerWholeString:(aChar)], @"gr3@t3st");
}

- (void)testToLowerWholeString_ShouldReturnEmptyString_GivenEmptyString
{
    NSString *aChar = @"";
    
    XCTAssertEqualObjects([_helper toLowerWholeString:(aChar)], @"");
}

@end
