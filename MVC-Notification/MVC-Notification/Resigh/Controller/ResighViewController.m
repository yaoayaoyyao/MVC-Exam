//
//  ResighViewController.m
//  MVC-Notification
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "ResighViewController.h"

@interface ResighViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *userName;
@property (nonatomic, strong)UITextField *userPassword;
@property (nonatomic, strong)UIButton *loginButton;

@end

@implementation ResighViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(87, 100, 201, 40)];
    [self.view addSubview:_userName];
    _userName.placeholder = @"请输入用户名";
    _userName.delegate = self;
    _userName.borderStyle = UITextBorderStyleBezel;
    
    _userPassword = [[UITextField alloc]initWithFrame:CGRectMake(87, 160, 201, 40)];
    [self.view addSubview:_userPassword];
    _userPassword.placeholder = @"请输入密码";
    _userPassword.delegate = self;
    _userPassword.borderStyle = UITextBorderStyleBezel;
    _userPassword.secureTextEntry = YES;
    
    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(137, 210, 101, 40)];
    [_loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loginClick {
    if ([_resighDelegate respondsToSelector:@selector(Name:andPassword:)]) {
        [_resighDelegate Name:_userName.text andPassword:_userPassword.text];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userName resignFirstResponder];
    [_userPassword resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_userName resignFirstResponder];
    [_userPassword resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
