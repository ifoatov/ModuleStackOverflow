//
//  MSOOnlineProvider.m
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOOnlineProvider.h"
#import "MSOQuestionFactory.h"


@interface MSOOnlineProvider ()
@end


@implementation MSOOnlineProvider

- (void)getQuestionsWithTag:(NSString *)tag
				 complition:(MSOOnlineProviderComplitionBlock)complition {
	if (!tag.length
		|| !complition)
	{
		return;
	}
	
	NSURLSessionTask *task = [[self standartSession] dataTaskWithURL:[self urlWithTag:tag]
												   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
													  
													   if (error)
													   {
														   complition(tag, nil, error);
													   }
													   
													   NSDictionary<NSString *, id> *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
													   
													   if (error)
													   {
														   complition(tag, nil, error);
													   }
													   
													   NSArray<MSOQuestion *> *result = [MSOQuestionFactory questionsWithJson:json[@"items"]];
													   complition(tag, result, nil);
												   }];
	[task resume];
}

- (NSURL *)urlWithTag:(NSString *)tag
{
	static NSString *baseLink = @"https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow&tagged=";
	NSString *urlString = [NSString stringWithFormat:@"%@%@", baseLink, tag];
	return [NSURL URLWithString:urlString];
}

- (NSURLSession *)standartSession
{
	return [NSURLSession sharedSession];
}

@end
