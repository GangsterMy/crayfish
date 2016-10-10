//
//  MYQuestion.h
//  crayfish
//
//  Created by 赵麦 on 10/10/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYQuestion : NSObject

@property (strong, nonatomic, readonly) NSNumber *questionID;
@property (strong, nonatomic, readonly) NSNumber *rightAnswerID;
@property (strong, nonatomic, readonly) NSNumber *sequence;
@property (copy, nonatomic, readonly) NSString *question;
@property (copy, nonatomic, readonly) NSArray *answers;

- (instancetype)initWithObject:(id)object;

@end
