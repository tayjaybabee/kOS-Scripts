//hellolaunch

//First, we'll clear the terminal screen to make it look nice
CLEARSCREEN.

//Next, we'll lock our throttle to 100%.
LOCK THROTTLE TO 1.0.   // 1.0 is the max, 0.0 is idle.

//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

//This is the line we added
LOCK STEERING TO UP.

UNTIL SHIP:MAXTHRUST > 30 {
    WAIT 0.5. // pause half a second between stage attempts.
    PRINT "Stage activated.".
    STAGE. // same as hitting the spacebar.
}

WAIT UNTIL SHIP:ALTITUDE > 70000.
PRINT "Reached 70,000m, disengaging throttle".
LOCK THROTTLE TO 0.0.

UNLOCK STEERING.
WAIT UNTIL SHIP:ALTITUDE > 100000.
LOCK STEERING TO North + R(0,90,0).
STAGE.