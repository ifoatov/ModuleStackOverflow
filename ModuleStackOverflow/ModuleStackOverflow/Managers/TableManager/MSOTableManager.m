//
//  MSOTableManager.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOTableManager.h"
#import "MSOTableManagerProtocol.h"
#import "MSOTableItemViewModelProtocol.h"
#import "MSOTableManagerCellProtocol.h"


@interface MSOTableManager ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<id<MSOTableItemViewModelProtocol>> *items;

@end


@implementation MSOTableManager

- (instancetype)initWithTableView:(UITableView *)tableView
{
	self = [super init];
	if (self)
	{
		_tableView = tableView;
		_tableView.dataSource = self;
		_tableView.delegate = self;
		_items = [NSMutableArray array];
	}
	return self;
}

- (void)addItems:(NSArray<id<MSOTableItemViewModelProtocol>> *)items
{
	NSInteger count = self.items.count;
	[self.items addObjectsFromArray:items];
	[self.tableView beginUpdates];
	for (NSUInteger i = 0; i<items.count; i++)
	{
		NSIndexPath *path = [NSIndexPath indexPathForRow:(count + i) inSection:0];
		[self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationBottom];
	}
	[self.tableView endUpdates];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *key = [self.items[indexPath.row] tableViewCellReusableKey];
	UITableViewCell<MSOTableManagerCellProtocol> *cell = [self.tableView dequeueReusableCellWithIdentifier:key forIndexPath:indexPath];
	
	[cell configureWithViewModel:self.items[indexPath.row]];
	
	return cell;
}

@end
