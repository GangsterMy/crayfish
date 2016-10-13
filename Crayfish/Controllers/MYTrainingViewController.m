//
//  MYTrainingViewController.m
//  crayfish
//
//  Created by 赵麦 on 10/9/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYTrainingViewController.h"
#import "MYTrainingCell.h"
#import "MYQuestionManager.h"

typedef NS_ENUM(NSUInteger, MYTrainingViewControllerType)
{
    MYTrainingViewControllerTypeTraining,
    MYTrainingViewControllerTypeMistakes
};

@interface MYTrainingViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (assign, nonatomic) MYTrainingViewControllerType type;
@property (strong, nonatomic) NSArray *questions;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation MYTrainingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questions = [MYQuestionManager sharedManager].allQuestions;
    [self.collectionView registerNib:[UINib nibWithNibName:@"MYTrainingCell" bundle:nil] forCellWithReuseIdentifier:@"MYTrainingCell"];
//    [self performSelectorOnMainThread:@selector(collectionView:willDisplayCell:forItemAtIndexPath:) withObject:nil waitUntilDone:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.questions.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MYQuestion *question = [self.questions objectAtIndex:indexPath.row];
    MYTrainingCell *trainingCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYTrainingCell" forIndexPath:indexPath];
    [trainingCell configureWithQuestion:question];
    return trainingCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.progressView.progress = (indexPath.row + 1) / (float)self.questions.count;
}

@end
