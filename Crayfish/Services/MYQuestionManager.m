//
//  MYQuestionManager.m
//  crayfish
//
//  Created by 赵麦 on 10/10/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYQuestionManager.h"

@interface MYQuestionManager ()

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

- (void)getQuestionData {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSArray *allQuestions = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

@end
