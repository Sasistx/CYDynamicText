# CYDynamicText
A Dynamic Font Manger

##使用方法：

###CYFontManager
保存所选字体
```objc
    if (![[CYFontManager defaultManager].contentSizeStr isNonEmpty]) {
        
        [[CYFontManager defaultManager] saveDynamicFontSizeToUserDefault:UIContentSizeCategoryExtraLarge];
    }
```

赋值
```objc
        UIFontDescriptor* descpripter = [UIFontDescriptor preferredCYAvenirNextFontDescriptorWithTextStyle:CYUIFontTextStyleCaption3 contentSizeStr:[CYFontManager defaultManager].contentSizeStr];
        timeLabel.font = [UIFont fontWithDescriptor:descpripter size:0.0];
        timeLabel.textAlignment = NSTextAlignmentCenter;
```
###CYFontSliderControl
```objc
    CYFontSliderControl* sliderControl = [CYFontSliderControl fontSliderControlWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100) titles:@[@"正常", @"大", @"超大", @"特大"] valueDidChanged:^(NSInteger index) {
        
        NSLog(@"index:%zi", index);
    }];
    sliderControl.currentIndex = 1;
    [self.view addSubview:sliderControl];
```


