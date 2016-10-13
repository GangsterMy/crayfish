//
//  MYUserAnswer+CoreDataProperties.m
//  crayfish
//
//  Created by 赵麦 on 10/13/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYUserAnswer+CoreDataProperties.h"

@implementation MYUserAnswer (CoreDataProperties)

+ (NSFetchRequest<MYUserAnswer *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MYUserAnswer"];
}

@dynamic answerID;
@dynamic isRight;
@dynamic questionID;
@dynamic selection;
@dynamic user;

@end
