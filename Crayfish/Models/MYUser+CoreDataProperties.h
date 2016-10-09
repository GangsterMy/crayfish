//
//  MYUser+CoreDataProperties.h
//  crayfish
//
//  Created by 赵麦 on 10/8/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MYUser (CoreDataProperties)

+ (NSFetchRequest<MYUser *> *)fetchRequest;

@property (nonatomic) int64_t currentQuestionID;
@property (nonatomic) int64_t id;
@property (nullable, nonatomic, copy) NSString *token;
@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, retain) NSOrderedSet<MYUserAnswer *> *answers;

@end

@interface MYUser (CoreDataGeneratedAccessors)

- (void)insertObject:(MYUserAnswer *)value inAnswersAtIndex:(NSUInteger)idx;
- (void)removeObjectFromAnswersAtIndex:(NSUInteger)idx;
- (void)insertAnswers:(NSArray<MYUserAnswer *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeAnswersAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInAnswersAtIndex:(NSUInteger)idx withObject:(MYUserAnswer *)value;
- (void)replaceAnswersAtIndexes:(NSIndexSet *)indexes withAnswers:(NSArray<MYUserAnswer *> *)values;
- (void)addAnswersObject:(MYUserAnswer *)value;
- (void)removeAnswersObject:(MYUserAnswer *)value;
- (void)addAnswers:(NSOrderedSet<MYUserAnswer *> *)values;
- (void)removeAnswers:(NSOrderedSet<MYUserAnswer *> *)values;

@end

NS_ASSUME_NONNULL_END
