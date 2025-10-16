/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 12;       /* snap pixel */
static const unsigned int gappih    = 6;        /* horiz inner gap between windows */
static const unsigned int gappiv    = 6;        /* vert inner gap between windows */
static const unsigned int gappoh    = 12;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 12;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 6;        /* 2 is the default spacing around the bar's font */
static const char *fonts[]          = { "monospace:pixelsize=14", "JetBrainsMono Nerd Font:pixelsize=12" };
static const char dmenufont[]       = "monospace:pixelsize=14";
static char normbgcolor[]           = "#18182f";
static char normbordercolor[]       = "#483b4b";
static char normfgcolor[]           = "#c399a8";
static char selfgcolor[]            = "#bdb8db";
static char selbordercolor[]        = "#9bb996";
static char selbgcolor[]            = "#809589";
static char *colors[][3] = {
    /*               fg           bg           border   */
    [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
    [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
 };

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6" };

static const Rule rules[] = {
    /* class            instance    title       tags mask     isfloating   monitor */
    /* { "St",             NULL,       NULL,       0,            1,           -1 }, */
    { "XTerm",          NULL,       NULL,       0,            1,           -1 },
    { "Nsxiv",          NULL,       NULL,       0,            1,           -1 },
    { "Firefox",        NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },                       /* 00 */    /* first entry = default */
    { "[@]",      spiral },                     /* 01 */
    { "[=]",      dwindle },                    /* 02 */
    { "]M[",      centeredmaster },             /* 03 */
    { "TTT",      bstack },                     /* 04 */
    { "===",      bstackhoriz },                /* 05 */
    { "HHH",      grid },                       /* 06 */
    { "---",      horizgrid },                  /* 07 */
    { ":::",      gaplessgrid },                /* 08 */
    { "[M]",      monocle },                    /* 09 */
    { "><>",      NULL },                       /* 10 */    /* no layout function = floating */
    { NULL,       NULL },
};

/* key definitions */
#define WIN Mod4Mask
#define ALT Mod1Mask
#define SHFT ShiftMask
#define CTRL ControlMask
#define TAGKEYS(KEY,TAG) \
    { WIN,              KEY,      view,           {.ui = 1 << TAG} }, \
    { WIN|CTRL,         KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { WIN|SHFT,         KEY,      tag,            {.ui = 1 << TAG} }, \
    { WIN|CTRL|SHFT,    KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define STATUSBAR "dwmblocks"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", normbordercolor, "-sf", selfgcolor, "-bw", "3", NULL };
static const char *termcmd[]  = { "ghostty", NULL };
static const char *stcmd[]  = { "st", NULL };
static const char *alacmd[]  = { "alacritty", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "96x24", NULL };
static const char *maim[] = { "/home/ch_rism_/scripts/maim_slop", "full", NULL };
static const char *maimslop[] = { "/home/ch_rism_/scripts/maim_slop", "select", NULL };
static const char *paper[] = { "/home/ch_rism_/scripts/paper", NULL };
static const char *paperfold[] = { "/home/ch_rism_/scripts/paperfold", NULL };

static const Key keys[] = {
    /* modifier             key                 function        argument */
    { WIN,                  XK_space,           spawn,          {.v = dmenucmd } },
    { WIN,                  XK_Return,          spawn,          {.v = stcmd } },        /* st        */
    { WIN,                  XK_apostrophe,      spawn,          {.v = termcmd } },      /* ghostty   */
    { WIN,                  XK_g,               spawn,          {.v = termcmd } },      /* ghostty   */
    { WIN,                  XK_a,               spawn,          {.v = alacmd } },       /* alacritty */
    { WIN|SHFT,             XK_semicolon,       togglescratch,  {.v = scratchpadcmd } },
    { ALT|SHFT,             XK_3,               spawn,          {.v = maim } },         /* screenshot full     */ 
    { ALT|SHFT,             XK_4,               spawn,          {.v = maimslop } },     /* screenshot geometry */
    { ALT|SHFT,             XK_space,           spawn,          {.v = paper } },        /* wallpaper random    */
    { ALT,                  XK_space,           spawn,          {.v = paperfold } },    /* wallpaper menu      */
    { WIN,                  XK_b,               togglebar,      {0} },
    { WIN,                  XK_bracketleft,     focusstack,     {.i = +1 } },
    { WIN,                  XK_bracketright,    focusstack,     {.i = -1 } },
    { WIN,                  XK_h,               focusdir,       {.i = 0 } },            /* left  */
    { WIN,                  XK_l,               focusdir,       {.i = 1 } },            /* right */
    { WIN,                  XK_k,               focusdir,       {.i = 2 } },            /* up    */
    { WIN,                  XK_j,               focusdir,       {.i = 3 } },            /* down  */
    { WIN,                  XK_i,               incnmaster,     {.i = +1 } },
    { WIN,                  XK_d,               incnmaster,     {.i = -1 } },
    { WIN,                  XK_minus,           setmfact,       {.f = -0.02} },
    { WIN,                  XK_equal,           setmfact,       {.f = +0.02} },
    { WIN|SHFT,             XK_minus,           setcfact,       {.f = -0.20} },
    { WIN|SHFT,             XK_equal,           setcfact,       {.f = +0.20} },
    { WIN|SHFT,             XK_backslash,       setcfact,       {.f =  0.00} },
    { WIN|SHFT,             XK_Return,          zoom,           {0} },
    { WIN|ALT,              XK_u,               incrgaps,       {.i = +3 } },
    { WIN|ALT|SHFT,         XK_u,               incrgaps,       {.i = -3 } },
    { WIN|ALT,              XK_i,               incrigaps,      {.i = +3 } },
    { WIN|ALT|SHFT,         XK_i,               incrigaps,      {.i = -3 } },
    { WIN|ALT,              XK_o,               incrogaps,      {.i = +3 } },
    { WIN|ALT|SHFT,         XK_o,               incrogaps,      {.i = -3 } },
    { WIN|ALT,              XK_bracketleft,     togglegaps,     {0} },
    { WIN|ALT,              XK_p,               defaultgaps,    {0} },
    { WIN|ALT,              XK_1,               setlayout,      {.v = &layouts[0]} },   /* tile           */
    { WIN|ALT,              XK_2,               setlayout,      {.v = &layouts[1]} },   /* spiral         */
    { WIN|ALT,              XK_3,               setlayout,      {.v = &layouts[2]} },   /* dwindle        */
    { WIN|ALT,              XK_4,               setlayout,      {.v = &layouts[3]} },   /* centeredmaster */
    { WIN|ALT,              XK_5,               setlayout,      {.v = &layouts[4]} },   /* bstack         */
    { WIN|ALT,              XK_6,               setlayout,      {.v = &layouts[5]} },   /* bstackhoriz    */
    { WIN|ALT,              XK_7,               setlayout,      {.v = &layouts[6]} },   /* grid           */
    { WIN|ALT,              XK_8,               setlayout,      {.v = &layouts[7]} },   /* horizgrid      */
    { WIN|ALT,              XK_9,               setlayout,      {.v = &layouts[8]} },   /* gaplessgrid    */
    { WIN|ALT,              XK_0,               setlayout,      {.v = &layouts[10]} },  /* floating       */
    { WIN|ALT|CTRL,         XK_j,               moveresize,     {.v = "0x 25y 0w 0h" } },
    { WIN|ALT|CTRL,         XK_k,               moveresize,     {.v = "0x -25y 0w 0h" } },
    { WIN|ALT|CTRL,         XK_l,               moveresize,     {.v = "25x 0y 0w 0h" } },
    { WIN|ALT|CTRL,         XK_h,               moveresize,     {.v = "-25x 0y 0w 0h" } },
    { WIN|ALT|CTRL|SHFT,    XK_j,               moveresize,     {.v = "0x 0y 0w 25h" } },
    { WIN|ALT|CTRL|SHFT,    XK_k,               moveresize,     {.v = "0x 0y 0w -25h" } },
    { WIN|ALT|CTRL|SHFT,    XK_l,               moveresize,     {.v = "0x 0y 25w 0h" } },
    { WIN|ALT|CTRL|SHFT,    XK_h,               moveresize,     {.v = "0x 0y -25w 0h" } },
    { WIN,                  XK_comma,           focusmon,       {.i = -1 } },
    { WIN,                  XK_period,          focusmon,       {.i = +1 } },
    { WIN|SHFT,             XK_comma,           tagmon,         {.i = -1 } },
    { WIN|SHFT,             XK_period,          tagmon,         {.i = +1 } },
    { WIN|ALT,              XK_Return,          xrdb,           {.v = NULL } },
    { WIN,                  XK_0,               view,           {.ui = ~0 } },
    { WIN|SHFT,             XK_0,               tag,            {.ui = ~0 } },
    { WIN,                  XK_Tab,             view,           {0} },
    { WIN,                  XK_q,               killclient,     {0} },
    TAGKEYS(                XK_1,                                0)
    TAGKEYS(                XK_2,                                1)
    TAGKEYS(                XK_3,                                2)
    TAGKEYS(                XK_4,                                3)
    TAGKEYS(                XK_5,                                4)
    TAGKEYS(                XK_6,                                5)
    { WIN|SHFT|CTRL,        XK_q,               quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask          button          function        argument */
    { ClkLtSymbol,          0,                  Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,                  Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,                  Button2,        zoom,           {0} },
    { ClkStatusText,        0,                  Button1,        sigstatusbar,   {.i = 1} },
    { ClkStatusText,        0,                  Button2,        sigstatusbar,   {.i = 2} },
    { ClkStatusText,        0,                  Button3,        sigstatusbar,   {.i = 3} },
    { ClkClientWin,         WIN,                Button1,        movemouse,      {0} },
    { ClkClientWin,         WIN,                Button2,        togglefloating, {0} },
    { ClkClientWin,         WIN,                Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,                  Button1,        view,           {0} },
    { ClkTagBar,            0,                  Button3,        toggleview,     {0} },
    { ClkTagBar,            WIN,                Button1,        tag,            {0} },
    { ClkTagBar,            WIN,                Button3,        toggletag,      {0} },
};

static const char *ipcsockpath = "/tmp/dwm.sock";
static IPCCommand ipccommands[] = {
    /*          function            args    arg types       */
    IPCCOMMAND( view,               1,      {ARG_TYPE_UINT} ),
    IPCCOMMAND( toggleview,         1,      {ARG_TYPE_UINT} ),
    IPCCOMMAND( tag,                1,      {ARG_TYPE_UINT} ),
    IPCCOMMAND( toggletag,          1,      {ARG_TYPE_UINT} ),
    IPCCOMMAND( tagmon,             1,      {ARG_TYPE_UINT} ),
    IPCCOMMAND( focusmon,           1,      {ARG_TYPE_SINT} ),
    IPCCOMMAND( focusstack,         1,      {ARG_TYPE_SINT} ),
    IPCCOMMAND( zoom,               1,      {ARG_TYPE_NONE} ),
    IPCCOMMAND( incnmaster,         1,      {ARG_TYPE_SINT} ),
    IPCCOMMAND( killclient,         1,      {ARG_TYPE_SINT} ),
    IPCCOMMAND( togglefloating,     1,      {ARG_TYPE_NONE} ),
    IPCCOMMAND( setmfact,           1,      {ARG_TYPE_FLOAT} ),
    IPCCOMMAND( setlayoutsafe,      1,      {ARG_TYPE_PTR} ),
    IPCCOMMAND( xrdb,               1,      {ARG_TYPE_NONE} ),
    IPCCOMMAND( quit,               1,      {ARG_TYPE_NONE} )
};
