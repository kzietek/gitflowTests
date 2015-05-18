//
//  LangzeeAPI.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 16.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "LangzeeAPI.h"

@interface LangzeeAPI ()

@property (strong,nonatomic) AFHTTPRequestOperationManager *manager;

@end

@implementation LangzeeAPI

+ (instancetype)sharedInstance {
    static LangzeeAPI *api;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        api = [LangzeeAPI new];
    });
    return api;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

+ (void)getCountriesWithSuccess:(void(^)(AFHTTPRequestOperation*, id))success failure:(void(^)(AFHTTPRequestOperation*, NSError*))failure {
    
    NSURL *url = [NSURL URLWithString:@"http://langzee.jojomob.vot.pl/"];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"api/language/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

@end
