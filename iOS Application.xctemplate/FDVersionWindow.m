#import "FDVersionWindow.h"


#pragma mark Class Extension

@interface FDVersionWindow ()

- (void)_initializeVersionWindow;
- (void)_repositionWindowToMatchStatusBar;


@end


#pragma mark - Class Definition

@implementation FDVersionWindow


#pragma mark - Constructors

- (id)initWithFrame: (CGRect)frame
{
	// Abort if base initializer fails.
	if ((self = [super initWithFrame: frame]) == nil)
	{
		return nil;
	}
	
	// Initialize view.
	[self _initializeVersionWindow];
	
	// Return initialized instance.
	return self;
}

- (id)initWithCoder: (NSCoder *)coder
{
	// Abort if base initializer fails.
	if ((self = [super initWithCoder: coder]) == nil)
	{
		return nil;
	}
	
	// Initialize view.
	[self _initializeVersionWindow];
	
	// Return initialized instance.
	return self;
}


- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver: self];
}


#pragma mark - Private Methods

- (void)_initializeVersionWindow
{
	// Ensure the version window is above the status bar.
	[self setWindowLevel:UIWindowLevelStatusBar + 1.0];
	
	// Ensure the version window is not hidden.
	[self setHidden:NO];
	
	// Disabe all user interaction with the version window.
	[self setUserInteractionEnabled:NO];
	
	// Enable autoresizing of the version window's subviews so the labels are correctly resized when the device's orientation changes.
	[self setAutoresizesSubviews:YES];
	
	// Reposition the window so it is above the status bar.
	[self _repositionWindowToMatchStatusBar];
	
	// Create a label to display the version number.
	NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
	NSString *versionNumber = [info objectForKey:@"CFBundleShortVersionString"];
	
	UILabel *versionLabel = [[UILabel alloc] init];
	versionLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin 
		| UIViewAutoresizingFlexibleRightMargin;
	versionLabel.backgroundColor = [UIColor clearColor];
	versionLabel.textColor = [UIColor whiteColor];
	versionLabel.font = [UIFont boldSystemFontOfSize: 10.0f];
	versionLabel.textAlignment = NSTextAlignmentCenter;
	versionLabel.text = [NSString stringWithFormat:@"v%@", versionNumber];
	[versionLabel sizeToFit];
	
	// Create a label to display the build number.
	NSString *buildNumber = [info objectForKey:@"CFBundleVersion"];
	
	UILabel *buildLabel = [[UILabel alloc] init];
	buildLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin 
		| UIViewAutoresizingFlexibleRightMargin;
	buildLabel.backgroundColor = versionLabel.backgroundColor;
	buildLabel.textColor = versionLabel.textColor;
	buildLabel.font = versionLabel.font;
	buildLabel.textAlignment = NSTextAlignmentCenter;
	buildLabel.text = [NSString stringWithFormat:@"Build %@", buildNumber];
	[buildLabel sizeToFit];
	
	// Position the version and build labels so they are on either side of the clock in the status bar.
	CGRect versionLabelFrame = versionLabel.frame;
	CGRect buildLabelFrame = buildLabel.frame;
	
	versionLabelFrame.size.height = self.bounds.size.height;
	buildLabelFrame.size.height = self.bounds.size.height;
	
	versionLabelFrame.origin.x = floorf(self.bounds.size.width / 3.0f) - (versionLabelFrame.size.width / 2.0f);
	buildLabelFrame.origin.x = floorf(self.bounds.size.width / 3.0f * 2.0f) - (buildLabelFrame.size.width / 2.0f);
	
	versionLabel.frame = versionLabelFrame;
	buildLabel.frame = buildLabelFrame;
	
	[self addSubview: versionLabel];
	[self addSubview: buildLabel];
	
	// Listen for changes to the status bar frame because the version window will need to be repositioned each time the status bar changes.
	[[NSNotificationCenter defaultCenter] addObserver: self 
		selector: @selector(_repositionWindowToMatchStatusBar) 
		name: UIApplicationDidChangeStatusBarFrameNotification 
		object: nil];
}

- (void)_repositionWindowToMatchStatusBar
{
	UIApplication *sharedApplication = [UIApplication sharedApplication];
	
	// Rotate the version window so that it is the same orientation as the status bar.
	CGFloat angle = 0.0f;
	switch(sharedApplication.statusBarOrientation)
	{
		case UIInterfaceOrientationPortrait:
		{
			angle =  0.0f;
			
			break;
		}
		
		case UIInterfaceOrientationLandscapeLeft:
		{
			angle = -M_PI_2;
			
			break;
		}
		
		case UIInterfaceOrientationLandscapeRight:
		{
			angle =  M_PI_2;
			
			break;
		}
		
		case UIInterfaceOrientationPortraitUpsideDown:
		{
			angle =  M_PI;
			
			break;
		}
	}
	
	self.transform = CGAffineTransformMakeRotation(angle);

	// Resize the version window so it will sit just above the status bar.
	self.frame = sharedApplication.statusBarFrame;
}


@end