//
//  MSODataBase.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 14/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSODataBase.h"
#import <CoreData/CoreData.h>


@interface MSODataBase ()

@property (nonatomic, strong) NSManagedObjectModel *model;
@property (nonatomic, strong) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, strong) NSURL *modelUrl;
@property (nonatomic, strong) NSManagedObjectContext *readContext;
@property (nonatomic, strong) NSManagedObjectContext *writeContext;

@end


@implementation MSODataBase

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_writeContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
		[_writeContext setPersistentStoreCoordinator:self.coordinator];
		
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
			NSFileManager *fileManager = [NSFileManager defaultManager];
			
			NSString *moduleFolder = @"DataBase";
			NSURL *documentsUrl = [[[fileManager URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask] firstObject] URLByAppendingPathComponent:moduleFolder ];
			
			NSError *error = nil;
			if (![fileManager fileExistsAtPath:documentsUrl.path])
			{
				if (![fileManager createDirectoryAtURL:documentsUrl withIntermediateDirectories:YES attributes:nil error:&error])
				{
					NSLog(@"Error while init database %@", error);
					abort();
				}
				
				if (![documentsUrl setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:&error])
				{
					NSLog(@"Error while init database %@", error);
					abort();
				}
			}
			
			NSURL *storeURL = [documentsUrl URLByAppendingPathComponent:@"DataModel.sqlite"];
			
			
			NSPersistentStore *persistentStore = [self.coordinator addPersistentStoreWithType:NSSQLiteStoreType
																				configuration:nil
																						  URL:storeURL
																					  options:nil
																						error:&error];
			if (error
				|| !persistentStore)
			{
				NSLog(@"Error while init database %@", error);
				abort();
			}
		});
		
		_readContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
		_readContext.parentContext = _writeContext;
	}
	return self;
}

- (NSURL *)modelUrl
{
	if (!_modelUrl)
	{
		static NSString *const modelFileName = @"Model";
		static NSString *const modelFileExtension = @"momd";
		_modelUrl = [[NSBundle mainBundle] URLForResource:modelFileName withExtension:modelFileExtension];
		NSAssert(_modelUrl, @"Failed to load momd file");
	}
	return _modelUrl;
}

- (NSManagedObjectModel *)model
{
	if (!_model)
	{
		_model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelUrl];
		NSAssert(_model, @"Failed to load Managed Model from url %@", self.modelUrl);
	}
	return _model;
}

- (NSPersistentStoreCoordinator *)coordinator
{
	if (!_coordinator)
	{
		_coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
	}
	return _coordinator;
}

- (void)getAnswers:(dataBaseGetCompletionBlock)completion
{
	if (completion)
	{
		return;
	}
	
}

@end


