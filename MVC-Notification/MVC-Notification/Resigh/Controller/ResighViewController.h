//
//  ResighViewController.h
//  MVC-Notification
//
//  Created by Jaya Shen on 2019/9/21.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol  ResighViewControllerDelegate<NSObject>
- (void)Name:(NSString *)name andPassword:(NSString *)password;

@end
@interface ResighViewController : UIViewController

@property (nonatomic, weak)id<ResighViewControllerDelegate>resighDelegate;
@end

NS_ASSUME_NONNULL_END
