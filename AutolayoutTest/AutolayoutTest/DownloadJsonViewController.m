//
//  DownloadJsonViewController.m
//  AutolayoutTest
//
//  Created by Kamil Zietek on 16.05.2015.
//  Copyright (c) 2015 Kamil Zietek. All rights reserved.
//

#import "DownloadJsonViewController.h"
#import "LangzeeAPI.h"
#import "Language.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DownloadJsonViewController ()

@end

@implementation DownloadJsonViewController

#pragma mark - Actions

- (IBAction)actionDownloadAndShow:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    
    [LangzeeAPI getCountriesWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSArray *langs = [Language arrayOfModelsFromDictionaries:responseObject error:&error];
        
        if (error) {
            NSString *msg = [NSString stringWithFormat:@"Failure during JSON conversion.\nError: %@", error.description];
            [weakSelf failure:msg];
            return;
        }
        
        Language *firstLang = [langs firstObject];
        NSString *baseURL = @"http://langzee.jojomob.vot.pl/media/";
        NSURL *imageUrl = [NSURL URLWithString:[baseURL stringByAppendingPathComponent:firstLang.languageImage]];
        [weakSelf.vImage sd_setImageWithURL:imageUrl];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf failure:@"Network error."];
    }];
}

- (IBAction)actionShowFromCache:(UIButton *)sender {
    
}

- (IBAction)actionDoYourBest:(UIButton *)sender {
    
}

- (IBAction)actionClearCache:(UIButton *)sender {
    self.vImage.image = nil;
}

#pragma mark - Display

- (void)failure:(NSString*)displayText {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Failure" message:displayText preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
