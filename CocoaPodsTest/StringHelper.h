//
//  StringHelper.h
//  CocoaPodsTest
//
//  Created by Dean on 11/25/2013.
//  Copyright (c) 2013 DeanGaudet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringHelper : NSObject

- (NSString *)toLower:(NSString *)original;
- (NSString *)toLowerWholeString:(NSString *)original;
- (NSString *)replaceWithHash:(NSString *)replace inString:(NSString *)string;

@end
