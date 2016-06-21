//
//  LoginViewModel.h
//  testRAC
//
//  Created by Imanol on 16/6/21.
//  Copyright © 2016年 imanol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalHeader.h"

@interface LoginViewModel : NSObject

@property (nonatomic , strong , readonly) RACSignal *loginEnableSignal;
@property (nonatomic , strong) NSString *userName;
@property (nonatomic , strong) NSString *pwd;
@end
