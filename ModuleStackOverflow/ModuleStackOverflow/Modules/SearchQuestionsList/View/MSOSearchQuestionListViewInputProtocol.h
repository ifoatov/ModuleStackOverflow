//
//  MSOSearchQuestionListViewInputProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//


@protocol MSOSearchQuestionsListInteractorProtocol;
@protocol MSOSearchQuestionsListRouterProtocol;
@class MSOQuestion;


@protocol MSOSearchQuestionListViewInputProtocol

@property (nonatomic, strong) id<MSOSearchQuestionsListInteractorProtocol> intercator;
@property (nonatomic, strong) id<MSOSearchQuestionsListRouterProtocol> router;

- (void)updateWithQuestions:(NSArray<MSOQuestion *> *)questions;

@end
