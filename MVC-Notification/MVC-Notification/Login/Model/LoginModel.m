//
//  LoginModel.m
//  MVC-Notification
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

- (void)checkName:(NSString *)nameStr andcheckPassword:(NSString *)passwordStr {
    if (([nameStr isEqualToString:@"IOSNB"] && [passwordStr isEqualToString:@"123456789"]) || ([nameStr isEqualToString:_InitNameStr] && [passwordStr isEqualToString:_InitPasswordStr])) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Right" object:self];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"False" object:self];
    }
}

@end
