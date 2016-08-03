//
//  CYFontSliderControl.h
//  CYDynamicText
//
//  Created by 高天翔 on 16/8/2.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CYFontSliderValueDidChanged)(NSInteger index);

@interface CYFontSliderControl : UIView

@property (nonatomic) NSInteger currentIndex;   //default is 0;
@property (nonatomic, strong) UIImage* thumbImage;

+ (instancetype)fontSliderControlWithFrame:(CGRect)frame titles:(NSArray*)titles valueDidChanged:(CYFontSliderValueDidChanged)changeBlock;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray*)titles valueDidChanged:(CYFontSliderValueDidChanged)changeBlock;

@end
