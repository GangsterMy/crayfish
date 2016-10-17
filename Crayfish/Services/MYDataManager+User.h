//
//  MYDataManager+User.h
//  crayfish
//
//  Created by 赵麦 on 10/13/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYDataManager.h"

@class MYUser;

@interface MYDataManager (User)

- (MYUser *)currentUser;
- (MYUser *)setCurrentUserWithID:(int64_t)userID;
- (MYUser *)userByID:(int64_t)userID;
- (MYUser *)insertOrUpdateUserWithID:(int64_t)userID username:(NSString *)username token:(NSString *)token;

@end
