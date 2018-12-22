//
//  MSOSearchQuestionsListPresentor.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListPresentor.h"
#import "MSOSearchQuestionListViewInputProtocol.h"

@implementation MSOSearchQuestionsListPresentor

@synthesize view;

- (void)addQuestions:(NSArray *)result
{
	[self.view updateWithQuestions:result];
}

@end
