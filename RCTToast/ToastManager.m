//
//  RCTToast.m
//  RCTToast
//
//  Created by hello on 2017/8/12.
//  Copyright © 2017年 hello. All rights reserved.
//

#import "ToastManager.h"
#import "UIView+Toast.h"
#import <React/RCTUIManager.h>

@implementation ToastManager

RCT_EXPORT_MODULE();

- (NSDictionary *)constantsToExport
{
    return @{
             @"SHORT": @"SHORT",
             @"LONG": @"LONG",
             @"TOP": (NSString *)CSToastPositionTop,
             @"CENTER": (NSString *)CSToastPositionCenter,
             @"BOTTOM": (NSString *)CSToastPositionBottom
             };
}

RCT_EXPORT_METHOD(show:(NSString *)message duration: (NSString *)duration resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    UIViewController *currentController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    UIView *view = [currentController view];
    
    if (view == nil || view == NULL) {
        NSError *error = [NSError errorWithDomain:@"EmptyView" code:200 userInfo: nil];
        
        reject(@"error", @"empty view", error);
        return;
    }
    
    NSTimeInterval time = 3.0;
    
    if (duration == nil || [duration isEqualToString:@""]) {
        time = 3.0;
    }
    
    if ([duration isEqualToString:@"SHORT"]) {
        
    }
    
    if ([duration isEqualToString:@"LONG"]) {
        time = 5.0;
    }
    
    if ([NSThread isMainThread]) {
        [view makeToast: message
               duration: time
               position: CSToastPositionTop];
        resolve(@"");
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [view makeToast: message
               duration: time
               position: CSToastPositionTop];
        resolve(@"");
    });
    
}

RCT_EXPORT_METHOD(showWithGravity:(NSString *)message duration: (NSString *)duration gravity: (NSString *)gravity resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    UIViewController *currentController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    UIView *view = [currentController view];
    
    if (view == nil || view == NULL) {
        NSError *error = [NSError errorWithDomain:@"EmptyView" code:200 userInfo: nil];
        
        reject(@"error", @"empty view", error);
        return;
    }
    
    NSTimeInterval time = 3.0;
    
    if (duration == nil || [duration isEqualToString:@""]) {
        time = 3.0;
    }
    
    if ([duration isEqualToString:@"SHORT"]) {
        
    }
    
    if ([duration isEqualToString:@"LONG"]) {
        time = 5.0;
    }
    
    if (gravity == nil || [gravity isEqualToString:@""]) {
        gravity = (NSString *)CSToastPositionTop;
    }
    
    if ([NSThread isMainThread]) {
        [view makeToast: message
               duration: time
               position:gravity];
        resolve(@"");
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [view makeToast: message
               duration: time
               position:gravity];
        resolve(@"");
    });
    
}

@end
