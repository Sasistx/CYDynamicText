//
//  CYFontManager.h
//  DynamicTextTest
//
//  Created by 高天翔 on 16/6/16.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const CYFontDidChangeNotification;
extern NSString *const CYFontSizeCategoryNewValueKey;

@interface CYFontManager : NSObject

@property (nonatomic, copy) NSString* contentSizeStr;
@property (nonatomic) BOOL recieveSystemNotification;       //default is NO

+ (CYFontManager*)defaultManager;
- (void)postCYFontNotificaiton:(NSString*)contentSizeStr;

@end
