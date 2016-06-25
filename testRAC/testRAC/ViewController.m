//
//  ViewController.m
//  testRAC
//
//  Created by Imanol on 16/6/21.
//  Copyright © 2016年 imanol. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


-(LoginViewModel *)loginVM{
    if(_loginVM == nil){
        _loginVM = [[LoginViewModel alloc]init];
    }
    return _loginVM;
}


// MVVM:
// VM:视图模型,处理界面上所有业务逻辑

// 每一个控制器对应一个VM模型
// VM:最好不要包括视图V


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self loginEvent];
    // Do any additional setup after loading the view, typically from a nib.
    
}

// 绑定viewModel
-(void)bindViewModel{
    
    // 1.给视图模型的账号和密码绑定信号
    RAC(self.loginVM,userName) = _userNameTextField.rac_textSignal;
    RAC(self.loginVM,pwd) = _pwdTextField.rac_textSignal;
    
}

-(void)loginEvent{
    
    // 1.处理文本框业务逻辑
    // 设置按钮能否点击
    RAC(_loginBtn,enabled) = self.loginVM.loginEnableSignal;
    
    // 2.监听登录按钮点击
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //处理登陆事件
        [self.loginVM.loginCommand execute:nil];
    }];
}

@end
