//
//  ViewController.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "ViewController.h"
#import "MSOQuestion.h"
#import "MSOOnlineProvider.h"
#import "MSOServiceLocator.h"
#import "MSOServiceLocatorProtocol.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, copy) NSArray<MSOQuestion *> *items;

@end


@implementation ViewController

- (void)viewDidLoad {
	self.items = [NSArray array];
	[super viewDidLoad];
	UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	table.dataSource = self;
	[self.view addSubview:table];
	self.tableView = table;
	
	id<MSOServiceLocatorProtocol> serviceLocator = [MSOServiceLocator shared];
	id<MSOOnlineProviderProtocol> onlineProvider = serviceLocator.onlineProvider;
	[onlineProvider getQuestionsWithTag:@"android"
							 complition:^(NSString * _Nonnull tag, NSArray<MSOQuestion *> * _Nullable questions, NSError * _Nullable error) {
																	  dispatch_async(dispatch_get_main_queue(), ^{
																		  self.items = questions;
																		  [self.tableView reloadData];
																	  });
																  }];

}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.textLabel.text = [NSString stringWithFormat:@"%li", self.items[indexPath.row].question_id];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.items count];
}

@end

