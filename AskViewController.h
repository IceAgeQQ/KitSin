//
//  AskViewController.h
//  Kitchen Sink
//
//  Created by Chao Xu on 13-9-18.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AskViewController;
@protocol  AskViewControllerDelegate<NSObject>
-(void)askViewController:(AskViewController *)sender didAskQuestion:(NSString *)question andGotAnwser:(NSString *)answer;
@end
@interface AskViewController : UIViewController

@property (nonatomic,copy)NSString *question;
@property (nonatomic,copy)NSString *answer;
@property (nonatomic,weak)id<AskViewControllerDelegate> delegate;
@end
