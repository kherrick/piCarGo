#!/usr/bin/env bash

readonly FRONT_LEFT='./180-rotation-servo/left.sh'
readonly FRONT_RIGHT='./180-rotation-servo/right.sh'
readonly FRONT_CENTER='./180-rotation-servo/center.sh'
readonly FRONT_STOP='./180-rotation-servo/stop.sh'
readonly REAR_BACKWARD='./continuous-rotation-servo/backward.sh'
readonly REAR_BACKWARD_FAST='./continuous-rotation-servo/backward-fast.sh'
readonly REAR_FORWARD='./continuous-rotation-servo/forward.sh'
readonly REAR_FORWARD_FAST='./continuous-rotation-servo/forward-fast.sh'
readonly REAR_STAND_STILL='./continuous-rotation-servo/stand-still.sh'
readonly REAR_STOP='./continuous-rotation-servo/stop.sh'

while read -rsn1 ui; do
  case "$ui" in
    # Handle ESC sequence.
    $'\x1b')
      # flush read. account for sequences for fx keys
      read -rsn1 -t 0.1 tmp

      if [[ "$tmp" == "[" ]]; then
        read -rsn1 -t 0.1 tmp

        case "$tmp" in
          "A")
            printf "REAR_FORWARD_FAST\n"
            $REAR_FORWARD_FAST
          ;;
          "B")
            printf "REAR_BACKWARD_FAST\n"
            $REAR_BACKWARD_FAST
          ;;
          "C")
            printf "FRONT_RIGHT\n"
            $FRONT_RIGHT
          ;;
          "D")
             printf "FRONT_LEFT\n"
            $FRONT_LEFT
          ;;
        esac
      fi

      # flush "stdin" with 0.1 second timeout
      read -rsn1 -t 0.1
    ;;
    w)
      printf "FRONT_CENTER\n"
      $FRONT_CENTER
    ;;
    a)
      printf "FRONT_LEFT\n"
      $FRONT_LEFT
    ;;
    s)
      printf "FRONT_CENTER\n"
      $FRONT_CENTER
    ;;
    d)
      printf "FRONT_RIGHT\n"
      $FRONT_RIGHT
    ;;
    $'')
      printf "REAR_STOP\n"
      $REAR_STOP
      printf "FRONT_STOP\n"
      $FRONT_STOP
    ;;
    q)
      printf "QUITTING...\n"
      break
    ;;
  esac
done

