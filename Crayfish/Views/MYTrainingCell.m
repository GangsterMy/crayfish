//
//  MYTrainingCell.m
//  crayfish
//
//  Created by 赵麦 on 10/9/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYTrainingCell.h"

@interface MYTrainingCell ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MYTrainingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureWithQuestion:(MYQuestion *)quesiton {
    self.contentLabel.text = quesiton.question;
}

@end
