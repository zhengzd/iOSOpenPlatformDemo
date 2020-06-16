//
//  TableViewController.m
//  OpenPlatformApp
//
//  Created by nd on 2020/5/18.
//  Copyright © 2020 nd. All rights reserved.
//

#import "TableViewController.h"

static NSString* const CellIdentifier = @"CellIdentifier";

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"OpenPlatformApp";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"打开第三方应用";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"打开第三方应用传参";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [self openThirdApp];
            break;
        }
        case 1:
        {
            [self openThirdAppWithParam];
            break;
        }
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private

- (void)openThirdApp {
    NSURL *url = [NSURL URLWithString:@"thirdappdemo://"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        
    }];
}

- (void)openThirdAppWithParam {
    NSURL *url = [NSURL URLWithString:@"thirdappdemo://com.nd.sdp.openplatform.ThirdAppDemo/localpath?pageName=ViewController&token=123"];
    url = [NSURL URLWithString:@"comndsdpcomponentdebug2elearfmnzr3://com.nd.sdp.component.debug2.elear_fmnzr3/localpath?pageName=ViewController&token=123"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
