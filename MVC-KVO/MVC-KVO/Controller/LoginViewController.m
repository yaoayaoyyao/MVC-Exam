//
//  LoginViewController.m
//  MVC-KVO
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginModel.h"

@interface LoginViewController ()<LoginViewDelegate>

@property LoginView *loginView;
@property LoginModel *loginModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _loginView = [[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
    
    _loginModel = [[LoginModel alloc]init];
    [_loginModel addObserver:self forKeyPath:@"boolStr" options:NSKeyValueObservingOptionNew context:nil];
    
}
#pragma mark -- LoginViewDelegate
- (void)loginpass {
//    [_loginModel checkName:_loginView.userName.text andcheckPassword:_loginView.userPassword.text];
    if ([_loginView.userName.text isEqualToString:@"IOSNB"] && [_loginView.userPassword.text isEqualToString:@"123456789"]) {
        _loginModel.boolStr = @"YES";
    } else {
        _loginModel.boolStr = @"NO";
    }
}
- (void)resighpass {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"抱歉" message:@"未写注册界面！" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
}

#pragma mark -- KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",change);
    if ([change[@"new"] isEqualToString:@"NO"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码错误！" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜" message:@"登录成功！" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
    }
}

#pragma mark -- 回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_loginView.userName resignFirstResponder];
    [_loginView.userPassword resignFirstResponder];
}
- (void)dealloc {
    [_loginModel removeObserver:self forKeyPath:@"boolStr"];
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
