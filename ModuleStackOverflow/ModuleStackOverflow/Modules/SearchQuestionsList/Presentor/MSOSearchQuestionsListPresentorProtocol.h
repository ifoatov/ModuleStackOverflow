//
//  MSOSearchQuestionsListPresentorProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

@protocol MSOSearchQuestionListViewInputProtocol;


@protocol MSOSearchQuestionsListPresentorProtocol

@property (nonatomic, weak) id<MSOSearchQuestionListViewInputProtocol> view;

- (void)addQuestions:(NSArray *)result;

@end
