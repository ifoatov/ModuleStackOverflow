//
//  MSOSearchQuestionListViewController.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 08/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOSearchQuestionsListViewController.h"
#import "MSOSearchQuestionsListRouterProtocol.h"
#import "MSOSearchQuestionsListInteractorProtocol.h"
#import "MSOQuestionTableViewCell.h"


static CGFloat textFieldHeight = 30;
//static CGFloat favoritesViewHeight = 80;
static NSString * const tableViewReusableKey = @"tableViewReusableKey";


@interface MSOSearchQuestionsListViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat topMargin;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<MSOQuestion *> *items;

@end


@implementation MSOSearchQuestionsListViewController

@synthesize intercator, router;

- (void)viewDidLoad
{
	//TODO расчитать верхний отступ для моделей 10 и выше
	self.topMargin = 20;
	self.items = [NSMutableArray array];
	
    [super viewDidLoad];
	self.view.backgroundColor = UIColor.whiteColor;
	[self configTextField];
	[self configTableView];
}

- (void)configTextField
{
	CGFloat width = self.view.bounds.size.width;
	CGRect rect = CGRectMake(6, self.topMargin, width - 12, textFieldHeight);
	
	self.textField = [[UITextField alloc] initWithFrame:rect];
	self.textField.borderStyle = UITextBorderStyleRoundedRect;
	self.textField.clearButtonMode = UITextFieldViewModeAlways;
	self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
	self.textField.returnKeyType = UIReturnKeySearch;
	self.textField.delegate = self;
	
	[self.view addSubview:self.textField];
}

- (void)configTableView
{
	CGFloat height = self.view.bounds.size.height - textFieldHeight - self.topMargin;
	CGFloat width = self.view.bounds.size.width;
	CGFloat yPosition = self.textField.frame.origin.y + self.textField.bounds.size.height;
	CGRect frame = CGRectMake(0, yPosition, width, height);
	
	self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	[self.tableView registerNib:[UINib nibWithNibName:@"MSOQuestionTableViewCell" bundle:nil] forCellReuseIdentifier:tableViewReusableKey];
	
	[self.view addSubview:self.tableView];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	if (self.textField.text.length > 0)
	{
		[self.intercator getQuestionsWithTag:self.textField.text];
	}
	
	return YES;
}


#pragma mark - ViewInputProtocol

- (void)updateWithQuestions:(NSArray<MSOQuestion *> *)questions
{
	NSInteger count = self.items.count;
	[self.items addObjectsFromArray:questions];
	[self.tableView beginUpdates];
	for (NSUInteger i = 0; i<questions.count; i++)
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
	MSOQuestionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:tableViewReusableKey];
	[cell setupWithQuestion:self.items[indexPath.row]];
	return cell;
}

@end
