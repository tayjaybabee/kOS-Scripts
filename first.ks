// launch_test.ks
// 10.18.19
// Taylor-Jayde Blackstone <t.blackstone@inspyre.tech>
// kOS (Kerbal Operating-System) Script
// Usage: Testing kOS scripting for automated rocket launch_test
// Params: none

// create a 'main' function, this will handle a
// good portion of the logic involved in this

// Below is the function that will contain our
// main list of instructions/function calls

SET VERSION TO "a0.10".

function main {
  doInitialState().
  WAIT 0.1.
  welcome().
  wait 0.1.
  doPreFlight(). // run pre-flight operations such
                 // as countdown setting the target
}

// Capture a Lexicon of the state the rocket is in
// before we take control

function doInitialState {
  SET initStateLexicon TO Lexicon().
  initStateLexicon:ADD("SAS", SAS).
  IF SAS {
    SAS OFF.
    PRINT "Turned SAS off!".
  }
  initStateLexicon:ADD("LIGHTS", LIGHTS).
  IF LIGHTS {
    LIGHTS OFF.
    PRINT "Turned lights off!".
  }
  initStateLexicon:ADD("MAXTHRUST", MAXTHRUST).
  initStateLexicon:ADD("GEAR", GEAR).
  PRINT initStateLexicon. // DEBUG
  WAIT 1.
}

// Called by main function in order to prepare
// terminal screen and welcome user, providing
// useless version information.
// PARAMS: none

function welcome {
  CLEARSCREEN.
  HUDTEXT("Welcome to launch_test.ks V" + VERSION, 5, 2, 15, green, true).
  PRINT "Your initial state is: " + initStateLexicon.
}

// Function called by main to begin preflight
// countdown/setup
// PARAMS: none

function doPreFlight {
  FROM {local countdown is 12.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    HUDTEXT("..." + countdown, 5, 2, 15, green, true).

    // Set up steps to be performed as the
    // countdown goes from 12 to 0.

    // Turn on lights
    IF countdown = 11 {
      PRINT "Turning on lights...".
      PRINT "Lights on: " + LIGHTS.
      LIGHTS ON.
    }

    // Locking throttle to 1 or 100%
    IF countdown = 10 {
      PRINT "Locking throttle to 100%".
      LOCK THROTTLE TO 1.0.
      PRINT "Throttle set to:" + THROTTLE.
    }

    // Locking steering to 'up'
    IF countdown = 9 {
      PRINT "Setting target to the Mun".
      LOCK STEERING TO UP.
    }

    IF countdown = 8 {
      IF GEAR {
        PRINT "Gear is down, retracting...".
        GEAR OFF.
        WHEN GEAR = false THEN {
          PRINT "Gear is up!".
        }
      }
    }

    WAIT 1. // pauses the script here for 1 second.
  }
}

// Calling main function from above
main().
