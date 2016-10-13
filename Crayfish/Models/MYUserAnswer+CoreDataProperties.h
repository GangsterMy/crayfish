//
//  MYUserAnswer+CoreDataProperties.h
//  crayfish
//
//  Created by 赵麦 on 10/13/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYUserAnswer+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MYUserAnswer (CoreDataProperties)

+ (NSFetchRequest<MYUserAnswer *> *)fetchRequest;

@property (nonatomic) int64_t answerID;
@property (nonatomic) BOOL isRight;
@property (nonatomic) int64_t questionID;
@property (nonatomic) int64_t selection;
@property (nullable, nonatomic, retain) MYUser *user;

@end

NS_ASSUME_NONNULL_END
