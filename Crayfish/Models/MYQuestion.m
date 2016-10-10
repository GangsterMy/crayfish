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
@property (copy, nonatomic) NSOrderedSet<MYAnswer *> *answers;

@end

@implementation MYQuestion

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.questionID = [object objectForKey:@"id"];
        self.rightAnswerID = [object objectForKey:@"rightAnswerID"];
        self.sequence = [object objectForKey:@"sequence"];
        self.question = [object objectForKey:@"question"];
        self.answers = [[NSOrderedSet alloc] init];
    }
    return self;
}

@end
