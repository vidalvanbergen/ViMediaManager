/*
 *  SUCarbonAPI.h
 *  Sparkle
 *
 *  Created by Jack Small on 2/22/07.
 *  Copyright 2007 Jack Small. All rights reserved.
 *
 */

#ifndef SUCARBONAPI
#define SUCARBONAPI

#include <Carbon/Carbon.h>

#if PRAGMA_ONCE
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

enum {
	/* This HICommand is handeled automatically by Sparkle and calls SUSparkleCheckForUpdates( TRUE ); */
	kHICommandSparkleCheckForUpdates = 'sCUP',
	
	/* This HICommand is sent to the application by Sparkle before kHICommandQuit.  If your event
	   handler returns noErr the kHICommandQuit command is not sent.  */
	kHICommandSparkleQuitApplication = 'sQAP'
};

enum {
	kEventClassSparkle = 'Sprk'
};

enum {
	kEventSparkleFoundVersion = 1,
	kEventParamSparkleVersion = 'sVrs',		/* typeCFStringRef (optional) */
	kEventParamSparkleIsNew = 'sNew'		/* typeBoolean */
}; 

void SUSparkleInitializeForCarbon( void );
void SUSparkleCheckForUpdates( Boolean showUI );
void SUSparkleCheckWithInterval( double interval );
void SUSparkleCheckStatus( EventTargetRef theEventTarget );
Boolean SUSparkleIsUpdateInProgress( void );

#ifdef __cplusplus
}
#endif

#endif /* SUCARBONAPI */

