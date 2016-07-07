//
//  UIFontDescriptor+CYCustomFont.h
//  CYDynamicText
//
//  Created by 高天翔 on 16/6/30.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const CYUIFontTextStyleCaption3;
extern NSString *const CYUIFontTextStyleCaption4;

@interface UIFontDescriptor (CYCustomFont)

+ (UIFontDescriptor *)preferredCYAvenirNextFontDescriptorWithTextStyle:(NSString *)style contentSizeStr:(NSString*)contentSizeStr;

+ (UIFontDescriptor *)preferredCYAvenirNextWithFontDescriptorSymbolicTrait:(UIFontDescriptorSymbolicTraits)trait descriptorWithTextStyle:(NSString *)style contentSizeStr:(NSString*)contentSizeStr;

@end
