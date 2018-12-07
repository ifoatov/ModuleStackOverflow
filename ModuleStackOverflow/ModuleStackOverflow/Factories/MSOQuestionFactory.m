//
//  MSOQuestionFactory.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOQuestionFactory.h"
#import "MSOQuestion+Private.h"

@implementation MSOQuestionFactory

+ (nonnull NSArray<MSOQuestion *> *)questionsWithJson:(NSArray * _Nonnull )json
{
	NSMutableArray *result = [NSMutableArray array];
	
	for (NSDictionary<NSString *, id> *object in json)
	{
		MSOQuestion *question = [self questionWithDictionary:object];
		if (question)
		{
			[result addObject:question];
		}
	}
	
	return [result copy];
}

+ (nullable MSOQuestion *)questionWithDictionary:(NSDictionary<NSString *, id> *)dict
{
	NSNumber *question_id = dict[@"question_id"];
	if (!question_id)
	{
		return nil;
	}
	
	MSOQuestion *question = [MSOQuestion new];
	
	[question setQuestion_id:[question_id unsignedIntegerValue]];
	
	return question;
}

@end
