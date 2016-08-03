//
//  CYFontSliderControl.m
//  CYDynamicText
//
//  Created by 高天翔 on 16/8/2.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import "CYFontSliderControl.h"
#import "CYSliderView.h"

@interface CYFontSliderControl ()
@property (nonatomic) NSInteger count;
@property (nonatomic) CGFloat originX;
@property (nonatomic, strong) CYSliderView* sliderView;
@property (nonatomic, strong) NSArray* titles;
@property (nonatomic, copy) CYFontSliderValueDidChanged changeBlock;
@end

@implementation CYFontSliderControl

+ (instancetype)fontSliderControlWithFrame:(CGRect)frame titles:(NSArray*)titles valueDidChanged:(CYFontSliderValueDidChanged)changeBlock
{
    CYFontSliderControl* sliderControl = [[CYFontSliderControl alloc] initWithFrame:frame titles:titles valueDidChanged:changeBlock];
    return sliderControl;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray*)titles valueDidChanged:(CYFontSliderValueDidChanged)changeBlock
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _count = [titles count];
        _titles = [titles copy];
        _currentIndex = 0;
        _changeBlock = changeBlock;
        CGRect viewFrame = CGRectMake(0, frame.size.height / 2, frame.size.width, frame.size.height / 2);
        [self createSliderViewWithFrame:viewFrame];
        [self createTitleWithFrame:viewFrame];
    }
    
    return self;
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    if (_currentIndex != currentIndex) {
        
        _currentIndex = currentIndex;
        
        _sliderView.currentIndex = _currentIndex;
    }
}

- (void)setThumbImage:(UIImage *)thumbImage
{
    if (_thumbImage != thumbImage) {
        
        _thumbImage = nil;
        _thumbImage = thumbImage;
        
        _sliderView.thumbImage = _thumbImage;
    }
}

- (void)createSliderViewWithFrame:(CGRect)frame
{
    _sliderView = [[CYSliderView alloc] initWithFrame:frame count:_count];
    [self addSubview:_sliderView];
}

- (void)createTitleWithFrame:(CGRect)frame
{
    CGFloat titleCenterY = frame.size.height / 2;
    
    for (NSInteger i = 0; i < _count; i++) {
        
        NSString* title = _titles[i];
        UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textColor = [UIColor colorWithRed:50 / 255.0 green:50 / 255.0 blue:50 / 255.0 alpha:1];
        [titleLabel sizeToFit];
        [self addSubview:titleLabel];
        CGPoint titleLabelCenter = [_sliderView getIndexPointWithIndex:i frame:frame];
        [titleLabel setCenter:CGPointMake(titleLabelCenter.x, titleCenterY)];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = touches.anyObject;
    CGPoint touchPoint = [touch locationInView:self];
    [self updateSliderWithIndex:[self checkPointToIndex:touchPoint]];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = touches.anyObject;
    CGPoint touchPoint = [touch locationInView:self];
    [self updateSliderWithIndex:[self checkPointToIndex:touchPoint]];
}

- (NSInteger)checkPointToIndex:(CGPoint)point
{
    NSInteger pointX = point.x - _originX;
    
    NSInteger sliderWidth = self.frame.size.width - 2 * _originX;
    
    NSInteger divWidth = sliderWidth / (_count - 1);
    
    NSInteger index = pointX / divWidth;
    
    NSInteger div = pointX % divWidth;
    
    if (div > divWidth / 2) {
        //+1
        index += 1;
    }
    
    //越界处理
    if (index < 0) {
        
        index = 0;
    }
    
    if (index > _count) {
        
        index = _count;
    }
    
    return index;
    
}

- (void)updateSliderWithIndex:(NSInteger)index
{
    if (index != _currentIndex) {
        
        _currentIndex = index;
        [_sliderView setCurrentIndex:index];
        if (_changeBlock) {
            _changeBlock(index);
        }
    }
}

@end
