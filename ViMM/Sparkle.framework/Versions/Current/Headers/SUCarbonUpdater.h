//
//  SUCarbonUpdater.h
//  Sparkle
//
//  Created by Jack Small on 2/22/07.
//  Copyright 2007 Jack Small. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SUUpdater.h"
#import "SUCarbonAPI.h"

@interface SUCarbonUpdater : SUUpdater {
	EventTargetRef	carbonEventTarget;
}

// This method creates a new updater and simulates the "applicationDidFinishLaunchingNotification".
// It is most likely that a Carbon app has already finished launching when Sparkle initilaization
// occurs.  It is called by SUSparkleInitializeForCarbon().  
+ (SUCarbonUpdater*)updaterForCarbon;

// This method creates a new status checker and sets the event target.  If statusEventTarget is
// NULL then GetApplicationEventTarget() is used instead.  It is called by SUSparkleCheckStatus().
+ (SUCarbonUpdater*)statusCheckerForCarbon:(EventTargetRef)statusEventTarget;

// This utility method was added for Carbon applications to check if updates are running.
// It is called by SUSparkleIsUpdateInProgress().
- (BOOL)updateInProgress;

// This method changes the event target for this updater.  If set, a kEventSparkleFoundVersion
// event is sent when an appcast result is found, instead of a traditinal install.
- (id)setCarbonEventTarget:(EventTargetRef)statusEventTarget;

@end
