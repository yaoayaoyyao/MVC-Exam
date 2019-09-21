//
//  LoginView.h
//  MVC-KVO
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginViewDelegate <NSObject>
- (void)loginpass;
- (void)resighpass;
@end

@interface LoginView : UIView

@property (nonatomic, strong)UITextField *userName;
@property (nonatomic, strong)UITextField *userPassword;
@property (nonatomic, strong)UIButton *loginButton;
@property (nonatomic, strong)UIButton *resighButton;
@property id<LoginViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
