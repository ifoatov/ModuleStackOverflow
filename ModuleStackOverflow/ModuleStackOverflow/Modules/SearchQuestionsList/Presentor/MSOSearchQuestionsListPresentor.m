//
//  MSOSearchQuestionsListPresentor.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListPresentor.h"
#import "MSOSearchQuestionListViewInputProtocol.h"
#import "MSOQuestionViewModel.h"

@implementation MSOSearchQuestionsListPresentor

@synthesize view;

- (void)addQuestions:(NSArray *)result
{
	NSMutableArray<MSOQuestionViewModel *> *viewModels = [NSMutableArray array];
	for(MSOQuestion *question in result)
	{
		MSOQuestionViewModel *viewModel = [[MSOQuestionViewModel alloc] initWithQuestion:question];
		[viewModels addObject:viewModel];
	}
	[self.view updateWithQuestions:[viewModels copy]];
}

@end
