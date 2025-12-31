#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " ][ "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 20

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X("", "/home/ch_rism_/scripts/status/void.sh",      0,      7) \
    X("", "/home/ch_rism_/scripts/status/weather.sh",   600,    6) \
    X("", "/home/ch_rism_/scripts/status/play.sh",      0,      5) \
    X("", "/home/ch_rism_/scripts/status/mem.sh",       30,     4) \
    X("", "/home/ch_rism_/scripts/status/bat.sh",       30,     3) \
    X("", "/home/ch_rism_/scripts/status/date.sh",      600,    2) \
    X("", "/home/ch_rism_/scripts/status/time.sh",      5,      1) 

#endif  // CONFIG_H
