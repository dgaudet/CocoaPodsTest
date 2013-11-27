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
    
    XCTAssertEqualObjects([_helper toLower:aChar], @"a");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenB
{
    NSString *aChar = @"B";
    
    XCTAssertEqualObjects([_helper toLower:aChar], @"b");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenLowerCaseLetter
{
    NSString *aChar = @"b";
    
    XCTAssertEqualObjects([_helper toLower:aChar], @"b");
}

- (void)testToLower_ShouldReturnSameItem_GivenNonAlphabetCharacter
{
    NSString *aChar = @"1";
    
    XCTAssertEqualObjects([_helper toLower:aChar], @"1");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenM
{
    NSString *aChar = @"H";

    XCTAssertEqualObjects([_helper toLower:aChar], @"h");
}

- (void)testToLower_ShouldReturnLowerCaseLetter_GivenZ
{
    NSString *aChar = @"Z";
    
    XCTAssertEqualObjects([_helper toLower:aChar], @"z");
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
    
    XCTAssertEqualObjects([_helper toLowerWholeString:aChar], @"a");
}

- (void)testToLowerWholeString_ShouldReturnLowerCaseString_GivenTwoLetters
{
    NSString *aChar = @"AB";
    
    XCTAssertEqualObjects([_helper toLowerWholeString:aChar], @"ab");
}

//- (void)testToLowerWholeString_ShouldReturnLowerCaseString_GivenThreeLetters
//{
//    NSString *aChar = @"ABC";
//    
//    XCTAssertEqualObjects([_helper toLowerWholeString:aChar], @"abc");
//}

//empty string

#pragma mark - replaceWithHash Tests

- (void)testReplaceWithHash_ShouldNotChangeString_GivenNoMatches
{
    NSString *string = @"abcd";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"F" inString:string], string);
}

- (void)testReplaceWithHash_ShouldReplaceMatchWithHash_GivenOneCharacterAndOneMatch
{
    NSString *string = @"a";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"a" inString:string], @"#");
}

- (void)testReplaceWithHash_ShouldReplaceMatchWithHash_GivenMultipleCharactersAndOneMatch
{
    NSString *string = @"abcd";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"c" inString:string], @"ab#d");
}

- (void)testReplaceWithHash_ShouldReplaceMatchWithHash_GivenMultipleCharactersAndOneMatchAtBegining
{
    NSString *string = @"abcd";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"a" inString:string], @"#bcd");
}

- (void)testReplaceWithHash_ShouldReplaceMatchWithHash_GivenMultipleCharactersAndOneMatchAtTheEnd
{
    NSString *string = @"abcd";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"d" inString:string], @"abc#");
}

- (void)testReplaceWithHash_ShouldReplaceMatchWithHash_GivenMultipleCharactersAnTwoMatches
{
    NSString *string = @"abcbd";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"b" inString:string], @"a#c#d");
}

- (void)testReplaceWithHash_ShouldReplaceMatchWithHash_GivenMultipleCharactersAndThreeMatches
{
    NSString *string = @"abcbdefbd";
    
    XCTAssertEqualObjects([_helper replaceWithHash:@"b" inString:string], @"a#c#def#d");
}


//should ignore case when searching
//empty string
//empty replacement
//both empty

@end
