//
//  TableViewController.m
//  LZTabBarController
//
//  Created by Ray on 2018/6/4.
//  Copyright © 2018年 Ray. All rights reserved.
//

#import "TableViewController.h"
#import "TabBarController.h"
#import "LZTabBarHeader.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"默认样式cell";
        }
            break;
        case 1: {
            cell.textLabel.text = @"显示page cell";
        }
            break;
        case 2: {
            cell.textLabel.text = @"自定义cell（皮肤）";
        }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TabBarController *tabVC = [[TabBarController alloc] init];
    [tabVC loadSubViewController:indexPath.row];
    
    tabVC.tabBarHeight = IS_IPHONE_X ? (49.0+34.0) : 49.0;
    
    
    switch (indexPath.row) {
        case 0: {
            tabVC.normalTitleColor = [UIColor greenColor];
            tabVC.selectedTitleColor = [UIColor whiteColor];
            tabVC.backgroundImgColor = [UIColor blackColor];
        }
            break;
        case 1: {
            tabVC.selectedTitleColor = [UIColor whiteColor];
            tabVC.backgroundImgColor = [UIColor blackColor];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [tabVC showPageView];
            });
            
//            [tabVC showPageView];
            
        }
            break;
        case 2: {
            tabVC.isCustom = YES;
            tabVC.normalTitleColor = [UIColor blackColor];
            tabVC.tabBarBackgroundImg = [UIImage imageNamed:@"icn_btm_bg"];
            [tabVC showTabBarBackgroudView:YES];
        }
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:tabVC animated:YES];
    
}

@end
