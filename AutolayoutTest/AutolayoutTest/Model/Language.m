//
//  Language.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 16.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "Language.h"

@implementation Language

+ (JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id" : @"languageId" ,
                                                       @"language_image" : @"languageImage"
                                                       }];
}

@end
