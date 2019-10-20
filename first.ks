// launch_test.ks v0.3
// 10.18.19
// Taylor-Jayde Blackstone <t.blackstone@inspyre.tech>
// kOS (Kerbal Operating-System) Script
// Usage: Testing kOS scripting for automated rocket launch_test
// Params: none

// create a 'main' function, this will handle a
// good portion of the logic involved in this

// Below is the function that will contain our
// main list of instructions/function calls

function main {
  welcome().
  wait 0.1.
  doPreFlight(). // run pre-flight operations such
                 // as countdown setting the target
}

// Called by main function in order to prepare
// terminal screen and welcome user, providing
// useless version information.
// PARAMS: none

function welcome {
  CLEARSCREEN.
  HUDTEXT("Welcome to launch_test.ks Va0.2!", 5, 2, 15, green, true).
}

// Function called by main to begin preflight
// countdown/setup
// PARAMS: none

function doPreFlight {
  FROM {local countdown is 12.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.

    IF countdown = 11 {
      PRINT "Turning on lights...".
      PRINT "Lights on:?" + LIGHTS. 
      LIGHTS ON.
    }

    IF countdown = 10 {
      PRINT "Locking throttle to 100%".
      LOCK THROTTLE TO 1.0.
      PRINT "Throttle set to:" + THROTTLE.
    }

    IF countdown = 9 {
      PRINT "Setting target to the Mun".
      LOCK    

    WAIT 1. // pauses the script here for 1 second.
  }
}

// Calling main function from above
main().
