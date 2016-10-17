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
    [self.context performBlockAndWait:^{
        NSArray *fetchResult = [self.context executeFetchRequest:fetchRequest error:&error];
        if (!error && fetchResult && fetchResult.count) {
            MYUser *existUser = [fetchResult firstObject];
            resultUser = existUser;
        }
    }];
    return resultUser;
}

- (MYUser *)setCurrentUserWithID:(int64_t)userID {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ENTITY_NAME];
    
    __block NSError *error;
    __block MYUser *resultUser;
    [self.context performBlockAndWait:^{
        NSArray *fetchResult = [self.context executeFetchRequest:fetchRequest error:&error];
        if (!error && fetchResult && fetchResult.count) {
            for (MYUser *user in fetchResult) {
                user.isActive = NO;
                if (user.userID == userID) {
                    user.isActive = YES;
                    resultUser = user;
                }
            }
        }
    }];
    return resultUser;
}

- (MYUser *)userByID:(int64_t)userID
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ENTITY_NAME];
    fetchRequest.fetchLimit = 1;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"userID = %ld", userID];
    
    __block NSError *error;
    __block MYUser *resultUser;
    [self.context performBlockAndWait:^{
        NSArray *fetchResult = [self.context executeFetchRequest:fetchRequest error:&error];
        if (!error && fetchResult && fetchResult.count) {
            resultUser = [fetchResult firstObject];
        }
    }];
    return resultUser;
}

- (MYUser *)insertOrUpdateUserWithID:(int64_t)userID username:(NSString *)username token:(NSString *)token {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ENTITY_NAME];
    fetchRequest.fetchLimit = 1;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"userID = %lu", userID];

    __block NSError *error;
    __block MYUser *resultUser;
    [self.context performBlockAndWait:^{
        NSArray *fetchResult = [self.context executeFetchRequest:fetchRequest error:&error];
        if (!error && fetchResult && fetchResult.count) {
            MYUser *existUser = [fetchResult firstObject];
            existUser.username = username;
            existUser.token = token;
            resultUser = existUser;
        } else {
            [self.context performBlockAndWait:^{
                MYUser *user = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_NAME inManagedObjectContext:self.context];
                user.userID = userID;
                user.username = username;
                user.token = token;
                resultUser = user;
            }];
        }
    }];
    return resultUser;
}

@end
