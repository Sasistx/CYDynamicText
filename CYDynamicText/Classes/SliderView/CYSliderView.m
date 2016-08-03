//
//  CYSliderView.m
//  CYDynamicText
//
//  Created by 高天翔 on 16/8/2.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import "CYSliderView.h"

@interface CYSliderView ()
@property (nonatomic, strong) UIImageView* thumbImageView;
@property (nonatomic) NSInteger count;
@property (nonatomic) CGFloat originX;
@property (nonatomic) CGFloat originY;
@end

@implementation CYSliderView

#pragma mark - initialize

- (instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _originX = 40;
        _originY = frame.size.height / 2 - 10;
        _count = count;
        _currentIndex = 0;
        self.backgroundColor = [UIColor clearColor];
        [self createThumbImageView];
        [self updateThumbImagePositionWithIndex:0];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 1);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:215 / 255.0 green:226 / 255.0 blue:232 / 255.0 alpha:1].CGColor);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, _originX, _originY);
    CGContextAddLineToPoint(context, rect.size.width - _originX, _originY);
    CGContextStrokePath(context);
    
    for (NSInteger i = 0; i < _count + 1; i++) {
        
        CGPoint indexPoint = [self getIndexPointWithIndex:i frame:rect];
        CGContextMoveToPoint(context, indexPoint.x, indexPoint.y - 5);
        CGContextAddLineToPoint(context, indexPoint.x, indexPoint.y + 5);
        CGContextStrokePath(context);
    }
}

- (void)createThumbImageView
{
    _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_thumbImageView setImage:[UIImage imageNamed:@"CY_thumbImage"]];
    [self addSubview:_thumbImageView];
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    if (_currentIndex != currentIndex) {
        
        _currentIndex = currentIndex;
        
        [self updateThumbImagePositionWithIndex:_currentIndex];
    }
}

- (void)setThumbImage:(UIImage *)thumbImage
{
    if (_thumbImage != thumbImage) {
        
        if (thumbImage) {
            _thumbImage = thumbImage;
        }else {
            _thumbImage = [UIImage imageNamed:@"CY_thumbImage"];
        }
        
        [_thumbImageView setImage:_thumbImage];
    }
}

- (void)updateThumbImagePositionWithIndex:(NSInteger)index
{
    [_thumbImageView setCenter:[self getIndexPointWithIndex:index frame:self.frame]];
}

- (CGPoint)getIndexPointWithIndex:(NSInteger)index frame:(CGRect)frame
{
    CGFloat divWidth = (frame.size.width - 2 * _originX) / (_count - 1);
    return CGPointMake(_originX + index * divWidth, _originY);
}

@end
