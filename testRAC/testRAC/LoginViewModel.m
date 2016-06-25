//
//  LoginViewModel.m
//  testRAC
//
//  Created by Imanol on 16/6/21.
//  Copyright © 2016年 imanol. All rights reserved.
//

#import "LoginViewModel.h"
#import "SVProgressHUD.h"

@implementation LoginViewModel

-(instancetype)init{
    
    if(self = [super init]){
        [self setup];
    
    }
    
    return self;
}

-(void)setup{
    //处理登陆点击的信号
    _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self, userName),RACObserve(self, pwd)] reduce:^id(NSString *username, NSString *password){
        return @(username.length && password.length);
    }];
    
    //处理登陆点击的命令
    _loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        //block : 执行命令就会调用
        //block作用：事件处理
        //发送登陆请求
        NSLog(@"发送登陆请求");
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@"请求登陆的数据"];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];
    
    //处理登陆请求返回的结果
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@-----",x);
    }];
    
    //处理登陆执行的过程
    [[_loginCommand.executing skip:1] subscribeNext:^(id x) {
        if([x boolValue] == YES){
            //正在执行
            NSLog(@"正在执行");
            //显示蒙版
            [SVProgressHUD showInfoWithStatus:@"loading...." maskType:SVProgressHUDMaskTypeBlack];
        }else{
            //执行完成
            //隐藏蒙版
            NSLog(@"执行完成");
            [SVProgressHUD dismiss];
        }
    }];
}

@end
