//
//  LoginModel.h
//  MVC-Notification
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginModel : NSObject

@property NSString *InitNameStr;
@property NSString *InitPasswordStr;
- (void)checkName:(NSString *)nameStr andcheckPassword:(NSString *)passwordStr;

@end

NS_ASSUME_NONNULL_END
