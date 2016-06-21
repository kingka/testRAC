//
//  LoginViewModel.m
//  testRAC
//
//  Created by Imanol on 16/6/21.
//  Copyright © 2016年 imanol. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

-(instancetype)init{
    
    if(self = [super init]){
        [self setup];
    
    }
    
    return self;
}

-(void)setup{
    _loginEnableSignal = rac
}

@end
