//
//  ClassA.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 27.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "ClassA.h"
#import "ClassB.h"

@implementation ClassA

- (NSString*)sendDataAndReceiveResponse:(NSString*)dataToSend {
    return [self.peer respondToMessage:dataToSend];
}

@end
