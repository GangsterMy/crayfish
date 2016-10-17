//
//  MYMainViewController.m
//  crayfish
//
//  Created by 赵麦 on 10/8/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYMainViewController.h"
#import "MYQuestionManager.h"
#import "MYDataManager+User.h"
#import "MYUser+CoreDataProperties.h"

typedef NS_ENUM(NSUInteger, MYMainViewControllerType)
{
    MYMainViewControllerTypeTraining,
    MYMainViewControllerTypeMistakes
};

@interface MYMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (assign, nonatomic) MYMainViewControllerType type;
@property (strong, nonatomic) NSArray *questions;

@end

@implementation MYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateInterface];
    
    if (![MYDataManager sharedManager].currentUser) {
        self.questions = [MYQuestionManager sharedManager].allQuestions;
    } else {
    }
    
    self.questions = [MYQuestionManager sharedManager].allQuestions;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateInterface {
    switch (self.type) {
        case MYMainViewControllerTypeTraining:
            self.statusLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.questions.count];
            self.startButton.titleLabel.text = @"开始答题";
            break;
            
        case MYMainViewControllerTypeMistakes:
            self.statusLabel.text = @"69";
            self.startButton.titleLabel.text = @"开始练习";
            break;
            
        default:
            break;
    }
}

#pragma mark - EventHandler

- (IBAction)safariButtonTouchUp:(id)sender {
}

- (IBAction)segmentTabTouchUp:(id)sender {
    UISegmentedControl *segmetedControl = sender;
    switch (segmetedControl.selectedSegmentIndex) {
        case 0:
            self.type = MYMainViewControllerTypeTraining;
            [self updateInterface];
            break;
            
        case 1:
            self.type = MYMainViewControllerTypeMistakes;
            [self updateInterface];
            break;
            
        default:
            break;
    }
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
