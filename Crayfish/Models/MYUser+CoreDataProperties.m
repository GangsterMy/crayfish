//
//  MYUser+CoreDataProperties.m
//  crayfish
//
//  Created by 赵麦 on 10/13/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYUser+CoreDataProperties.h"

@implementation MYUser (CoreDataProperties)

+ (NSFetchRequest<MYUser *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MYUser"];
}

@dynamic currentQuestionID;
@dynamic userID;
@dynamic token;
@dynamic username;
@dynamic isActive;
@dynamic answers;

@end
