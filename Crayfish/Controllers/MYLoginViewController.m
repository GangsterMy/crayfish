//
//  MYLoginViewController.m
//  crayfish
//
//  Created by 赵麦 on 10/12/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYLoginViewController.h"

@interface MYLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *findPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation MYLoginViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    UIButton *clearButton = [self.usernameTextField valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"取消按钮"] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateHighlighted];
    self.usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EventHandler

- (IBAction)loginButtonTouchUp:(id)sender {
}

- (IBAction)findPasswordButtonTouchUp:(id)sender {
}

- (IBAction)registerButtonTouchUp:(id)sender {
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
