//
//  SlideViewController.m
//  DynamicTextTest
//
//  Created by 高天翔 on 16/6/16.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import "SlideViewController.h"
#import "CYFontManager.h"

@interface SlideViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel* textLabel;
@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [CYFontManager defaultManager];
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 100)];
    [_textLabel setText:@"这是一行测试文字"];
    [_textLabel setTextAlignment:NSTextAlignmentCenter];
    [_textLabel setBackgroundColor:[UIColor whiteColor]];
    
    UIFontDescriptor* descpripter = [UIFontDescriptor preferredCYAvenirNextFontDescriptorWithTextStyle:UIFontTextStyleBody contentSizeStr:UIContentSizeCategoryExtraExtraLarge];
    _textLabel.font = [UIFont fontWithDescriptor:descpripter size:0.0];
    [self.view addSubview:_textLabel];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 144, self.view.frame.size.width, self.view.frame.size.height - 100 - 44)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferrChangeFontSize:) name:CYFontDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}


//UIContentSizeCategoryExtraExtraExtraLarge: @23,
//UIContentSizeCategoryExtraExtraLarge: @22,
//UIContentSizeCategoryExtraLarge: @21,
//UIContentSizeCategoryLarge: @20,
//UIContentSizeCategoryMedium: @19,
//UIContentSizeCategorySmall: @18,
//UIContentSizeCategoryExtraSmall: @17,},

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellid = @"cellid";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    //UIFontDescriptor
    if (indexPath.row == 0) {
        cell.textLabel.text = @"ExtraSmall";
    }else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Small";
    }else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"Medium";
    }else if (indexPath.row == 3){
        
        cell.textLabel.text = @"Large";
    }else if (indexPath.row == 4)
    {
        cell.textLabel.text = @"ExtraLarge";
    }else if (indexPath.row == 5)
    {
        cell.textLabel.text = @"ExtraExtraLarge";
    }else if (indexPath.row == 6)
    {
        cell.textLabel.text = @"ExtraExtraExtraLarge";
    }else {
        cell.textLabel.text = @"";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString* contentStr = @"";
    if (indexPath.row == 0) {
        
        contentStr = UIContentSizeCategoryExtraSmall;
    }else if (indexPath.row == 1)
    {
        contentStr = UIContentSizeCategorySmall;
    }else if (indexPath.row == 2)
    {
        contentStr = UIContentSizeCategoryMedium;
    }else if (indexPath.row == 3){
        
        contentStr = UIContentSizeCategoryLarge;
    }else if (indexPath.row == 4)
    {
        contentStr = UIContentSizeCategoryExtraLarge;
    }else if (indexPath.row == 5)
    {
        contentStr = UIContentSizeCategoryExtraExtraLarge;
    }else if (indexPath.row == 6)
    {
        contentStr = UIContentSizeCategoryExtraExtraExtraLarge;
    }else {
        contentStr = UIContentSizeCategoryExtraExtraExtraLarge;
    }
    
    [[CYFontManager defaultManager] postCYFontNotificaiton:contentStr];
}

- (void)preferrChangeFontSize:(NSNotification*)note
{
    NSDictionary* info = note.userInfo;
    NSString* contentSizeStr = info[CYFontSizeCategoryNewValueKey];
    UIFontDescriptor* descpripter = [UIFontDescriptor preferredCYAvenirNextFontDescriptorWithTextStyle:UIFontTextStyleBody contentSizeStr:contentSizeStr];
    _textLabel.font = [UIFont fontWithDescriptor:descpripter size:0.0];
}

@end
