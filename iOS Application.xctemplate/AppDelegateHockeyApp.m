#import "AppDelegate.h"
#import <HockeySDK/HockeySDK.h>
#ifndef APP_STORE
#import "FDVersionWindow.h"
#endif


#pragma mark Class Definition

@implementation AppDelegate
{
	@private __strong UIWindow *_mainWindow;
#ifndef APP_STORE
	@private __strong FDVersionWindow *_versionWindow;
#endif
}


#pragma mark - UIApplicationDelegate Methods

- (BOOL)application: (UIApplication *)application 
	didFinishLaunchingWithOptions: (NSDictionary *)launchOptions
{
	// Start HockeyApp for Ad Hoc and App Store builds.
#ifdef AD_HOC
	BITHockeyManager *hockeyManager = [BITHockeyManager sharedHockeyManager];
	[hockeyManager configureWithIdentifier: @"___VARIABLE_adHocHockeyAppID:identifier___"];
	[hockeyManager startManager];
	[hockeyManager.authenticator authenticateInstallation];
#elif defined APP_STORE
	BITHockeyManager *hockeyManager = [BITHockeyManager sharedHockeyManager];
	[hockeyManager configureWithIdentifier: @"___VARIABLE_appStoreHockeyAppID:identifier___"];
	[hockeyManager startManager];
	[hockeyManager.authenticator authenticateInstallation];
#endif
	
	// Create the main window.
	UIScreen *mainScreen = [UIScreen mainScreen];
	
	_mainWindow = [[UIWindow alloc] 
		initWithFrame: mainScreen.bounds];
	
	_mainWindow.backgroundColor = [UIColor blackColor];
	
	// TODO: Create the root view controller based on what platform the app is running on.
	UIDevice *currentDevice = [UIDevice currentDevice];
	UIUserInterfaceIdiom idiom = currentDevice.userInterfaceIdiom;
	
	if (idiom == UIUserInterfaceIdiomPad)
	{
	}
	else
	{
	}
	
	// Show the main window.
	[_mainWindow makeKeyAndVisible];
	
#ifndef APP_STORE
	// Create a version window which will sit atop the main window and display the application and build version in the status bar.
	_versionWindow = [[FDVersionWindow alloc] init];
#endif
	
	// Indicate success.
	return YES;
}

- (void)applicationWillResignActive: (UIApplication *)application
{
	// Pause ongoing tasks and disable timers.
}

- (void)applicationDidEnterBackground: (UIApplication *)application
{
	// Save application data, invalidate timers and store enough information to recover previous state if the application becomes active again.
}

- (void)applicationWillEnterForeground: (UIApplication *)application
{
	// Undo any changes that were made when the application entered the background.
}

- (void)applicationDidBecomeActive: (UIApplication *)application
{
	 // Restart tasks that were paused when the application resigned its active status.
}

- (void)applicationWillTerminate: (UIApplication *)application
{
	// Save application data and invalidate timers.
}

- (void)applicationDidReceiveMemoryWarning: (UIApplication *)application
{
	// Free up as much memory as possible by purging cached data or any other data that can be read back from disk.
}


#pragma mark - Private Methods


@end