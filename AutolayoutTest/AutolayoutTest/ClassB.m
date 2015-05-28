//
//  ClassB.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 27.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB

- (NSString*)respondToMessage:(NSString*)message {
    return [NSString stringWithFormat:@"%@ - %@",message,message];
}

@end
