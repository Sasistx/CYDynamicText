//
//  ViewController.m
//  CYDynamicText
//
//  Created by 高天翔 on 16/6/30.
//  Copyright © 2016年 CYGTX. All rights reserved.
//

#import "ViewController.h"
#import "SlideViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingView:)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)settingView:(id)sender
{
    SlideViewController* controller = [[SlideViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
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
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellid = @"cellid";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    //UIFontDescriptor
    if (indexPath.row == 0) {
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    }else if (indexPath.row == 1)
    {
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }else if (indexPath.row == 2)
    {
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    }else if (indexPath.row == 3){
        
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    }else if (indexPath.row == 4)
    {
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    }
    
    cell.textLabel.text = @"这是一个测试text";
    
    
    return cell;
}

- (void)preferrChangeFontSize:(NSNotification*)note
{
    //NSDictionary* dict = note.userInfo;
}


@end