//
//  MYTrainingViewController.m
//  crayfish
//
//  Created by 赵麦 on 10/9/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYTrainingViewController.h"
#import "MYTrainingCell.h"

typedef NS_ENUM(NSUInteger, MYTrainingViewControllerType)
{
    MYTrainingViewControllerTypeTraining,
    MYTrainingViewControllerTypeMistakes
};

@interface MYTrainingViewController ()

@property (assign, nonatomic) MYTrainingViewControllerType type;
@property (strong, nonatomic) NSArray *questions;

@end

@implementation MYTrainingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.questions.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MYTrainingCell *trainingCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYTrainingCell" forIndexPath:indexPath];
    return trainingCell;
}

@end
