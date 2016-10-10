//
//  MYQuestion.m
//  crayfish
//
//  Created by 赵麦 on 10/10/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYQuestion.h"
#import "MYAnswer.h"

@interface MYQuestion ()

@property (strong, nonatomic) NSNumber *questionID;
@property (strong, nonatomic) NSNumber *rightAnswerID;
@property (strong, nonatomic) NSNumber *sequence;
@property (copy, nonatomic) NSString *question;
@property (copy, nonatomic) NSArray *answers;

@end

@implementation MYQuestion

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.questionID = [object objectForKey:@"id"];
        self.rightAnswerID = [object objectForKey:@"rightAnswerID"];
        self.sequence = [object objectForKey:@"sequence"];
        self.question = [object objectForKey:@"question"];
        NSArray *answerItems = [object objectForKey:@"answers"];
        NSMutableArray *answers = [[NSMutableArray alloc] init];
        for (NSDictionary *answerItem in answerItems) {
            MYAnswer *answer = [[MYAnswer alloc] initWithObject:answerItem];
            [answers addObject:answer];
        }
        self.answers = answers;
    }
    return self;
}

@end
