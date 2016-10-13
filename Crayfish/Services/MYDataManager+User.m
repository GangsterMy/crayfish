//
//  MYDataManager+User.m
//  crayfish
//
//  Created by 赵麦 on 10/13/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYDataManager+User.h"
#import "MYUser+CoreDataProperties.h"

@implementation MYDataManager (User)

static NSString *const ENTITY_NAME = @"MYUser";

- (MYUser *)currentUser
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ENTITY_NAME];
    fetchRequest.fetchLimit = 1;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"isActive = %@", @(YES)];
    
    __block NSError *error;
    __block MYUser *resultUser;
    [self.managedObjectContext performBlockAndWait:^{
        NSArray *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if (!error && fetchResult && fetchResult.count) {
            MYUser *existUser = [fetchResult firstObject];
            resultUser = existUser;
        }
    }];
    return resultUser;
}

- (MYUser *)insertOrUpdateUserWithObject:(id)userObject active:(BOOL)active token:(NSString *)token {
    int64_t userID = [[userObject objectForKey:@"userID"] intValue];
    int64_t currentQuestionID = [[userObject objectForKey:@"currentQuestionID"] intValue];
    NSString *username = [userObject objectForKey:@"username"];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ENTITY_NAME];
    fetchRequest.fetchLimit = 1;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"userID = %lu", userID];

    __block NSError *error;
    __block MYUser *resultUser;
    [self.managedObjectContext performBlockAndWait:^{
        NSArray *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if (!error && fetchResult && fetchResult.count) {
            MYUser *existUser = [fetchResult firstObject];
            existUser.username = username;
            existUser.currentQuestionID = currentQuestionID;
            existUser.token = token;
            existUser.isActive = @(active);
            resultUser = existUser;
        } else {
            [self.managedObjectContext performBlockAndWait:^{
                MYUser *user = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_NAME inManagedObjectContext:self.managedObjectContext];
                user.userID = userID;
                user.username = username;
                user.currentQuestionID = currentQuestionID;
                user.token = token;
                user.isActive = @(active);
                resultUser = user;
            }];
        }
    }];
    return resultUser;
}

@end
