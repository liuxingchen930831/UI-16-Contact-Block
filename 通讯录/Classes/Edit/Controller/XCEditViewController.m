//
//  XCEditViewController.m
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCEditViewController.h"
#import "XCContact.h"
#import "XCContactViewController.h"
@interface XCEditViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@end

@implementation XCEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.text = self.contact.name;
    self.phoneTextField.text = self.contact.phone;
    self.title = @"修改联系人";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItem:)];
}
-(void)rightBarButtonItem:(UIBarButtonItem *)item
{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"编辑"]) {
        self.navigationItem.rightBarButtonItem.title = @"取消";
        self.saveButton.hidden = NO;
        self.nameTextField.enabled = YES;
        self.phoneTextField.enabled = YES;
    }else if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"取消"]){
        self.saveButton.hidden = YES;
        self.nameTextField.enabled = NO;
        self.phoneTextField.enabled = NO;
    }
}
- (IBAction)saveAction:(id)sender
{
    self.contact.name = self.nameTextField.text ;
    self.contact.phone = self.phoneTextField.text;
    if (self.editBlock!=nil) {
        self.editBlock();
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
