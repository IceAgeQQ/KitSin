//
//  AskViewController.m
//  Kitchen Sink
//
//  Created by Chao Xu on 13-9-18.
//  Copyright (c) 2013年 Chao Xu. All rights reserved.
//

#import "AskViewController.h"

@interface AskViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

@property (strong, nonatomic) IBOutlet UITextField *answerTextField;
@end

@implementation AskViewController
@synthesize question = _question;
@synthesize answer = _answer;
@synthesize delegate=_delegate;

-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.answer = textField.text;
    if (![textField.text length]) {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:Nil];
    }else{
        // need to communicate!
        [self.delegate askViewController:self didAskQuestion:self.question andGotAnwser:self.answer];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField.text length]) {
        [textField resignFirstResponder];
        return YES;
    }else{
        return NO;
    }
}
-(void)setQuestion:(NSString *)question{
    _question = question;
    self.questionLabel.text = question ;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear :animated];
    [self.answerTextField becomeFirstResponder];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.answerTextField.delegate = self;
    self.questionLabel.text = self.question;
    self.answerTextField.placeholder = self.answer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
