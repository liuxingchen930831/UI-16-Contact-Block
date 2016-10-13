# UI-16-Contact-Block
```
//声明block,传递的值根据需求定
typedef void(^XCAddViewControllerBlock)(XCContact *);

@interface XCAddViewController : UIViewController
/** block传递联系人 */
@property(nonatomic,copy)XCAddViewControllerBlock addBlock ;

//把传递的值包装成一个模型
    XCContact *c = [XCContact contactWithName:self.nameTextField.text phone:self.phoneTextField.text];
    if (self.addBlock!=nil) {
        self.addBlock(c);
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

```