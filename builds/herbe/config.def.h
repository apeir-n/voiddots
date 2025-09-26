static const char *background_color = "#3e3e3e";
static const char *border_color = "#ececec";
static const char *font_color = "#ececec";
static const char *font_pattern = "JetBrainsMono Nerd Font:size=10";
static unsigned line_spacing = 9;
static unsigned int padding = 15;

static unsigned int width = 350;
static unsigned int border_size = 3;
static unsigned int pos_x = 12;
static unsigned int pos_y = 36;

enum corners { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT };
enum corners corner = TOP_RIGHT;

static unsigned int duration = 5; /* in seconds */

#define DISMISS_BUTTON Button1
#define ACTION_BUTTON Button3
