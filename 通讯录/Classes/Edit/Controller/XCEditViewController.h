//
//  XCEditViewController.h
//  通讯录
//
//  Created by liuxingchen on 16/10/12.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XCEditViewControllerBlock)();
@class XCContact;
@interface XCEditViewController : UIViewController
/** 模型 */
@property(nonatomic,strong)XCContact * contact ;
/** block */
@property(nonatomic,copy)XCEditViewControllerBlock editBlock ;

@end
