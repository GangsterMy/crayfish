//
//  MYTrainingCell.h
//  crayfish
//
//  Created by 赵麦 on 10/9/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYQuestion.h"

@interface MYTrainingCell : UICollectionViewCell

- (void)configureWithQuestion:(MYQuestion *)quesiton;

@end
