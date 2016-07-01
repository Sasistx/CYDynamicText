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

static CYFontManager* defaultManager = nil;

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


@end
