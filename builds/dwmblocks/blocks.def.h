static const Block blocks[] = {
/*  icon        script                                      interval        signal  */
    {"",        "/home/ch_rism_/scripts/status/void.sh",    0,              7},
    {"",        "/home/ch_rism_/scripts/status/weather.sh", 600,            6},
    {"",        "/home/ch_rism_/scripts/status/play.sh",    0,              5},
    {"",        "/home/ch_rism_/scripts/status/mem.sh",     30,             4},
    {"",        "/home/ch_rism_/scripts/status/bat.sh",     30,             3},
    {"",        "/home/ch_rism_/scripts/status/date.sh",    600,            2},
    {"",        "/home/ch_rism_/scripts/status/time.sh",    5,              1},
};
          
static char delim[] = " ][ ";
static unsigned int delimLen = 5;
