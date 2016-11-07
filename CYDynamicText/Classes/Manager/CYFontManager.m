//
//  CYFontManager.m
//  DynamicTextTest
//
//  Created by 高天翔 on 16/6/16.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import "CYFontManager.h"

@implementation CYFontManager

NSString *const CYFontDidChangeNotification = @"CYFontDidChangeNotification";
NSString *const CYFontSizeCategoryNewValueKey = @"CYFontSizeCategoryNewValueKey";
NSString *const CYDynamicFontUserDefaultKey = @"CYDynamicFontUserDefaultKey";

@synthesize contentSizeStr = _contentSizeStr;

static CYFontManager* defaultManager = nil;

- (NSString*)contentSizeStr
{
    return _contentSizeStr ? : [self getUserDefaultDynamicFontSizeStr];
}

+ (CYFontManager*)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        defaultManager = [[self alloc] init];
        [defaultManager registerFontNotification];
    });
    
    return defaultManager;
}

- (void)registerFontNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferrChangeFontSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)preferrChangeFontSize:(NSNotification*)note
{
    if (_recieveSystemNotification) {
        NSDictionary* dict = note.userInfo;
        [self postCYFontNotificaiton:dict[UIContentSizeCategoryNewValueKey]];
    }
}

- (void)postCYFontNotificaiton:(NSString*)contentSizeStr
{
    [[NSNotificationCenter defaultCenter] postNotificationName:CYFontDidChangeNotification object:nil userInfo:@{CYFontSizeCategoryNewValueKey:contentSizeStr}];
}

- (void)saveDynamicFontSizeToUserDefault:(NSString*)dynamicFontSizeStr
{
    if (![dynamicFontSizeStr isKindOfClass:[NSString class]] || dynamicFontSizeStr == nil || [dynamicFontSizeStr isEqualToString:@""]) {
        
        return;
    }
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    [info setObject:dynamicFontSizeStr forKey:CYDynamicFontUserDefaultKey];
    [info synchronize];
    _contentSizeStr = dynamicFontSizeStr;
}

- (NSString*)getUserDefaultDynamicFontSizeStr
{
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    return [info objectForKey:CYDynamicFontUserDefaultKey];
}

@end
