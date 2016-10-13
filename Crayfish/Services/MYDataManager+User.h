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
- (MYUser *)insertOrUpdateUserWithObject:(id)userObject active:(BOOL)active token:(NSString *)token;

@end
