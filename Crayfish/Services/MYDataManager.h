//
//  MYDataManager.h
//  crayfish
//
//  Created by 赵麦 on 10/10/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MYDataManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (MYDataManager *)sharedManager;

- (void)saveContext;

@end
