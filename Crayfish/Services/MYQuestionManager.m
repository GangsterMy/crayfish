//
//  MYQuestionManager.m
//  crayfish
//
//  Created by 赵麦 on 10/10/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYQuestionManager.h"
#import "MYQuestion.h"

@interface MYQuestionManager ()

@property (copy, nonatomic, readwrite) NSArray *allQuestions;

@end

@implementation MYQuestionManager

+ (MYQuestionManager *)sharedManager {
    static MYQuestionManager *sharedManager;
    static dispatch_once_t token = 0;
    dispatch_once(&token, ^{
        if (!sharedManager) {
            sharedManager = [[MYQuestionManager alloc] init];
        }
    });
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.allQuestions = [self readAllQuestions];
    }
    return self;
}

- (NSArray *)readAllQuestions {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSArray *questionItems = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    for (NSDictionary *questionItem in questionItems) {
        MYQuestion *question = [[MYQuestion alloc] initWithObject:questionItem];
        [questions addObject:question];
    }
    return questions;
}

@end
