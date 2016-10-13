//
//  XCAddViewController.h
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCContact,XCAddViewController;
//声明代理
@protocol XCAddViewControllerDelegate <NSObject>
@optional
-(void)XCAddViewController:(XCAddViewController *)addVC didClickAddButtonWithContact:(XCContact *)contact;
@end
//声明block
typedef void(^XCAddViewControllerBlock)(XCContact *);

@interface XCAddViewController : UIViewController
/** 代理*/
@property(nonatomic,weak)id<XCAddViewControllerDelegate> delegate ;
/** block传递联系人 */
@property(nonatomic,copy)XCAddViewControllerBlock addBlock ;

@end
