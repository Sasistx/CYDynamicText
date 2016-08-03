//
//  CYSliderView.h
//  CYDynamicText
//
//  Created by 高天翔 on 16/8/2.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYSliderView : UIView

@property (nonatomic) NSInteger currentIndex;   //default is 0;
@property (nonatomic, strong) UIImage* thumbImage; 

- (instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count;

- (CGPoint)getIndexPointWithIndex:(NSInteger)index frame:(CGRect)frame;

@end
