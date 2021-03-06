//
//  DPTableViewController_arc.m
//
//  Created by Jonas Hagstedt.
//

#import "DPTableViewController_arc.h"

@interface DPTableViewController_arc ()
- (void)centerLoader;
@end

@implementation DPTableViewController_arc

- (void)showLoader {
	if (_loader == nil) {
		_loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		_loaderBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loader_background"]];
		[self.view addSubview:_loaderBackgroundView];
		_loader.frame = CGRectMake(_loaderBackgroundView.center.x - (_loader.frame.size.width / 2),
									   _loaderBackgroundView.center.y - (_loader.frame.size.height / 2), 
									   _loader.frame.size.width, 
									   _loader.frame.size.height);
		[_loaderBackgroundView addSubview:_loader];
	}
	[self centerLoader];
	[self.view bringSubviewToFront:_loaderBackgroundView];
	_loaderBackgroundView.hidden = NO;
	[_loader startAnimating];
	[self.view setUserInteractionEnabled:NO];
}

- (void)hideLoader {
	[self.view setUserInteractionEnabled:YES];
	[_loader stopAnimating];
	_loaderBackgroundView.hidden = YES;
}

- (void)centerLoader {
	_loaderBackgroundView.frame = CGRectMake(self.view.center.x - (_loaderBackgroundView.frame.size.width / 2), 
												 self.view.center.y - (_loaderBackgroundView.frame.size.height / 2), 
												 _loaderBackgroundView.frame.size.width, 
												 _loaderBackgroundView.frame.size.height);
	
}

@end
