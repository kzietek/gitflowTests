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

@interface DownloadJsonViewController ()

@property(nonatomic,weak) IBOutlet UIImageView *vImage;

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
        
        ;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf failure:@"Network error."];
    }];
}

- (IBAction)actionShowFromCache:(UIButton *)sender {
    
}

- (IBAction)actionDoYourBest:(UIButton *)sender {
    
}

- (IBAction)actionClearCache:(UIButton *)sender {
    
}

#pragma mark - Display

- (void)failure:(NSString*)displayText {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Failure" message:displayText preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
