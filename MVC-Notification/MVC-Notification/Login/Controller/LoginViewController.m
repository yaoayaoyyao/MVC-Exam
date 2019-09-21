//
//  LoginViewController.m
//  MVC-Notification
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "LoginViewController.h"
#import "SucceedViewController.h"
#import "ResighViewController.h"
#import "LoginView.h"
#import "LoginModel.h"

@interface LoginViewController ()<LoginViewDelegate,ResighViewControllerDelegate>

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSucceed) name:@"Right" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginFail) name:@"False" object:nil];
}
#pragma mark -- LoginViewDelegate
- (void)loginpass {
    [_loginModel checkName:_loginView.userName.text andcheckPassword:_loginView.userPassword.text];
}
- (void)resighpass {
    ResighViewController *resighViewController = [[ResighViewController alloc]init];
    resighViewController.resighDelegate = self;
    [self presentViewController:resighViewController animated:YES completion:nil];
}

#pragma mark -- NSNotificationCenter
- (void)loginSucceed {
    SucceedViewController *succeedViewController = [[SucceedViewController alloc]init];
    succeedViewController.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:succeedViewController animated:YES completion:nil];
}
- (void)loginFail {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码错误！" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark -- 回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_loginView.userName resignFirstResponder];
    [_loginView.userPassword resignFirstResponder];
}

#pragma mark -- ResighViewControllerDelegate
- (void)Name:(NSString *)name andPassword:(NSString *)password {
    _loginModel.InitNameStr = name;
    _loginModel.InitPasswordStr = password;
    
    _loginView.userName.text = name;
    _loginView.userPassword.text = password;
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
