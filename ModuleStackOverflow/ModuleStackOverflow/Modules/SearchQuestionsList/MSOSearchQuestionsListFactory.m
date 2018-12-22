//
//  MSOSearchQuestionsListFactory.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListFactory.h"
#import "MSOSearchQuestionsListPresentor.h"
#import "MSOSearchQuestionsListInteractorProtocol.h"
#import "MSOSearchQuestionsListViewController.h"
#import "MSOSearchQuestionsListRouter.h"
#import "MSOSearchQuestionsListInteractorFactory.h"

@implementation MSOSearchQuestionsListFactory

+ (UIViewController *)onlineModule
{
	MSOSearchQuestionsListViewController *viewController = [[MSOSearchQuestionsListViewController alloc] init];
	
	MSOSearchQuestionsListRouter *router = [MSOSearchQuestionsListRouter new];
	id<MSOSearchQuestionsListInteractorProtocol> interactor = [MSOSearchQuestionsListInteractorFactory onlineInteractor];
	MSOSearchQuestionsListPresentor *presentor = [MSOSearchQuestionsListPresentor new];
	
	viewController.router = router;
	viewController.intercator = interactor;
	
	interactor.presentor = presentor;
	
	presentor.view = viewController;
	
	return viewController;
}

+ (UIViewController *)offlineModule
{
	MSOSearchQuestionsListViewController *viewController = [[MSOSearchQuestionsListViewController alloc] init];
	
	MSOSearchQuestionsListRouter *router = [MSOSearchQuestionsListRouter new];
	id<MSOSearchQuestionsListInteractorProtocol> interactor = [MSOSearchQuestionsListInteractorFactory offlineInteractor];
	MSOSearchQuestionsListPresentor *presentor = [MSOSearchQuestionsListPresentor new];
	
	viewController.router = router;
	viewController.intercator = interactor;
	
	interactor.presentor = presentor;
	
	presentor.view = viewController;
	
	return viewController;
}

@end
