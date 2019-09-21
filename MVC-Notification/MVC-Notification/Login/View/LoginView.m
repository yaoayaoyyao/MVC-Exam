//
//  LoginView.m
//  MVC-Notification
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    
    _userName = [[UITextField alloc]init];
    [self addSubview:_userName];
    
    _userPassword = [[UITextField alloc]init];
    [self addSubview:_userPassword];
    
    _loginButton = [[UIButton alloc]init];
    [self addSubview:_loginButton];
    
    _resighButton = [[UIButton alloc]init];
    [self addSubview:_resighButton];
    
    return self;
}

- (void)layoutSubviews {
    _userName.frame = CGRectMake(37, 200, 301, 40);
    _userName.placeholder = @"请输入用户名";
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.layer.borderWidth = 1;
    _userName.layer.cornerRadius = 10;
    _userName.layer.masksToBounds = YES;
    _userName.layer.borderColor = [[UIColor blackColor]CGColor];
    
    _userPassword.frame = CGRectMake(37, 300, 301, 40);
    _userPassword.placeholder = @"请输入密码";
    _userPassword.secureTextEntry = YES;
    _userPassword.borderStyle = UITextBorderStyleRoundedRect;
    _userPassword.layer.borderWidth = 1;
    _userPassword.layer.cornerRadius = 10;
    _userPassword.layer.masksToBounds = YES;
    _userPassword.layer.borderColor = [[UIColor blackColor]CGColor];
    
    _loginButton.frame = CGRectMake(62, 400, 100, 40);
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor whiteColor];
    [_loginButton.layer setBorderWidth:1];
    [_loginButton.layer setBorderColor:[UIColor blackColor].CGColor];
    _loginButton.layer.cornerRadius = 10;
    _loginButton.layer.masksToBounds = YES;
    [_loginButton addTarget:self action:@selector(loginclick:) forControlEvents:UIControlEventTouchUpInside];
    
    _resighButton.frame = CGRectMake(213, 400, 100, 40);
    [_resighButton setTitle:@"注册" forState:UIControlStateNormal];
    [_resighButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _resighButton.backgroundColor = [UIColor whiteColor];
    [_resighButton.layer setBorderWidth:1];
    [_resighButton.layer setBorderColor:[UIColor blackColor].CGColor];
    _resighButton.layer.cornerRadius = 10;
    _resighButton.layer.masksToBounds = YES;
    [_resighButton addTarget:self action:@selector(resighclick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loginclick:(UIButton *)btn {
    if ([_delegate respondsToSelector:@selector(loginpass)]) {
        [_delegate loginpass];
    }
}

- (void)resighclick:(UIButton *)btn {
    if ([_delegate respondsToSelector:@selector(resighpass)]) {
        [_delegate resighpass];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
