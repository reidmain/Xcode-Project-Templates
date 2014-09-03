#import "AppDelegate.h"
#import <HockeySDK/HockeySDK.h>


#pragma mark Class Definition

@implementation AppDelegate


#pragma mark - UIApplicationDelegate Methods

- (void)applicationDidFinishLaunching: (NSNotification *)notification
{
	// Start HockeyApp for Ad Hoc and App Store builds.
#ifdef AD_HOC
	BITHockeyManager *hockeyManager = [BITHockeyManager sharedHockeyManager];
	[hockeyManager configureWithIdentifier: @"___VARIABLE_adHocHockeyAppID:identifier___"];
	[hockeyManager startManager];
#elif defined APP_STORE
	BITHockeyManager *hockeyManager = [BITHockeyManager sharedHockeyManager];
	[hockeyManager configureWithIdentifier: @"___VARIABLE_appStoreHockeyAppID:identifier___"];
	[hockeyManager startManager];
#endif
}


#pragma mark - Private Methods


@end