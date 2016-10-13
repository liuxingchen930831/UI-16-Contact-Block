//
//  XCContactViewController.m
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCContactViewController.h"
#import "XCAddViewController.h"
#import "XCContact.h"
#import "XCEditViewController.h"
@interface XCContactViewController ()<XCAddViewControllerDelegate>
/** 数据源 */
@property(nonatomic,strong)NSMutableArray * contacts ;

@end

@implementation XCContactViewController

-(NSMutableArray *)contacts
{
    if (_contacts ==nil) {
        _contacts = [NSMutableArray arrayWithCapacity:0];
    }
    return _contacts;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //取消tableView分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //tableView有护具的时候才需分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
}
//跳转前调用
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //设置目标控制器
    XCAddViewController *addVC = segue.destinationViewController;
    addVC.addBlock = ^(XCContact *contact){
        //把联系人模型添加到数组中
        [self.contacts addObject:contact];
        //刷新表格
        [self.tableView reloadData];
    };
    
}

- (IBAction)zhuxiao:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定注销吗" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contacts.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    XCContact *c = self.contacts[indexPath.row];
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //加载sb
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //加载编辑控制器
    XCEditViewController *editVC = [sb instantiateViewControllerWithIdentifier:@"edit"];
    editVC.contact = self.contacts[indexPath.row];
    editVC.editBlock = ^(){
        [self.tableView reloadData];
    };
    
    [self.navigationController pushViewController:editVC animated:YES];
    
}
@end
