//
//  MSOSearchQuestionsListInteractorFactory.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListInteractorFactory.h"
#import "MSOSearchQuestionsListOnlineInteractor.h"
#import "MSOSearchQuestionsListOfflineInteractor.h"
#import "MSOServiceLocator.h"


@implementation MSOSearchQuestionsListInteractorFactory

+ (id<MSOSearchQuestionsListInteractorProtocol>)onlineInteractor
{
	id<MSOServiceLocatorProtocol> serviceLocator = [MSOServiceLocator shared];
	MSOSearchQuestionsListOnlineInteractor *interactor = [[MSOSearchQuestionsListOnlineInteractor alloc] initWithProvider:serviceLocator.onlineProvider];
	
	return interactor;
}

+ (id<MSOSearchQuestionsListInteractorProtocol>)offlineInteractor
{
	// TODO create real object
	return [MSOSearchQuestionsListOfflineInteractor new];
}

@end
