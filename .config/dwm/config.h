#define TERMINAL "kitty"
#define TERMCLASS "St"
#define BROWSER "brave"

static unsigned int borderpx  = 2;
static unsigned int snap      = 32;
static unsigned int gappih    = 7;
static unsigned int gappiv    = 7;
static unsigned int gappoh    = 7;
static unsigned int gappov    = 7;
static int swallowfloating    = 0;
static int smartgaps          = 0;
static int showbar            = 1;
static int topbar             = 1;
static char *fonts[]          = { "Iosevka Nerd Font:size=10", "NotoColorEmoji:pixelsize=10:antialias=true:autohint=true"  };
static char normbgcolor[]      = "#303030";
static char normbordercolor[]  = "#444444";
static char normfgcolor[]      = "#bbbbbb";
static char selfgcolor[]       = "#eeeeee";
static char selbordercolor[]   = "#770000";
static char selbgcolor[]       = "#78c2b3";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { normbgcolor,  selbgcolor,  selbgcolor  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spcalc", "-f", "monospace:size=16", "-g", "50x20", "-e", "bc", "-lq", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spcalc",      spcmd2},
};

static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class    instance      title       	 tags mask    isfloating   isterminal  noswallow  monitor */
	{ TERMCLASS,  NULL,       NULL,       	 0,           0,           1,          0,         -1 },
	{ NULL,       NULL,       "Event Tester", 0,          0,           0,          1,         -1 },
	{ TERMCLASS,  "floatterm", NULL,       	 0,           1,           1,          0,         -1 },
	{ TERMCLASS,  "bg",        NULL,       	 1 << 7,      0,           1,          0,         -1 },
	{ TERMCLASS,  "spterm",    NULL,       	 SPTAG(0),    1,           1,          0,         -1 },
	{ TERMCLASS,  "spcalc",    NULL,       	 SPTAG(1),    1,           1,          0,         -1 },
};

/* layout(s) */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",	tile },
	{ "TTT",	bstack },
	{ "[@]",	spiral },
	{ "[\\]",	dwindle },
	{ "[D]",	deck },
	{ "[M]",	monocle },
	{ "|M|",	centeredmaster },
	{ ">M>",	centeredfloatingmaster },
	{ "><>",	NULL },
	{ NULL,		NULL },
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define STACKKEYS(MOD,ACTION) \
	{ MOD,	XK_j,	ACTION##stack,	{.i = INC(+1) } }, \
	{ MOD,	XK_k,	ACTION##stack,	{.i = INC(-1) } }, \
	{ MOD,  XK_v,   ACTION##stack,  {.i = 0 } }, \

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static const char *termcmd[]  = { TERMINAL, NULL };

ResourcePref resources[] = {
		{ "color0",		STRING,	&normbordercolor },
		{ "color8",		STRING,	&selbordercolor },
		{ "color0",		STRING,	&normbgcolor },
		{ "color4",		STRING,	&normfgcolor },
		{ "color0",		STRING,	&selfgcolor },
		{ "color4",		STRING,	&selbgcolor },
		{ "borderpx",		INTEGER, &borderpx },
		{ "snap",		INTEGER, &snap },
		{ "showbar",		INTEGER, &showbar },
		{ "topbar",		INTEGER, &topbar },
		{ "nmaster",		INTEGER, &nmaster },
		{ "resizehints",	INTEGER, &resizehints },
		{ "mfact",		FLOAT,	&mfact },
		{ "gappih",		INTEGER, &gappih },
		{ "gappiv",		INTEGER, &gappiv },
		{ "gappoh",		INTEGER, &gappoh },
		{ "gappov",		INTEGER, &gappov },
		{ "swallowfloating",	INTEGER, &swallowfloating },
		{ "smartgaps",		INTEGER, &smartgaps },
};

#include <X11/XF86keysym.h>
#include "shiftview.c"

static const char* upvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "+1%", NULL };
static const char* downvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "-1%", NULL };
static const char* mutevol[] = { "/usr/bin/pactl", "set-sink-mute", "0", "toggle", NULL };

static const Key keys[] = {
	/* modifier                     key            function                argument */
	STACKKEYS(MODKEY,                              focus)
	STACKKEYS(MODKEY|ShiftMask,                    push)
	TAGKEYS(			    XK_1,          0)
	TAGKEYS(			    XK_2,          1)
	TAGKEYS(			    XK_3,          2)
	TAGKEYS(			    XK_4,          3)
	TAGKEYS(			    XK_5,          4)
	TAGKEYS(			    XK_6,          5)
	TAGKEYS(			    XK_7,          6)
	TAGKEYS(			    XK_8,          7)
	TAGKEYS(			    XK_9,          8)
	{ MODKEY,			    XK_0,	       view,                   {.ui = ~0 } },
	{ MODKEY|ShiftMask,		XK_0,	       tag,                    {.ui = ~0 } },

	{ MODKEY,			    XK_q,          killclient,             {0} },
	{ MODKEY,			    XK_w,          spawn,                  {.v = (const char*[]){ BROWSER, NULL } } },
	{ MODKEY,			    XK_t,          setlayout,              {.v = &layouts[0]} }, /* tile */
	{ MODKEY|ShiftMask,		XK_t,          setlayout,              {.v = &layouts[1]} }, /* bstack */
	{ MODKEY,			    XK_y,          setlayout,              {.v = &layouts[2]} }, /* spiral */
	{ MODKEY|ShiftMask,		XK_y,          setlayout,              {.v = &layouts[3]} }, /* dwindle */
	{ MODKEY,			    XK_u,          setlayout,              {.v = &layouts[4]} }, /* deck */
	{ MODKEY|ShiftMask,		XK_u,          setlayout,              {.v = &layouts[5]} }, /* monocle */
	{ MODKEY,			    XK_i,          setlayout,              {.v = &layouts[6]} }, /* centeredmaster */
	{ MODKEY|ShiftMask,		XK_i,          setlayout,              {.v = &layouts[7]} }, /* centeredfloatingmaster */

	{ MODKEY,			    XK_a,          togglegaps,             {0} },
	{ MODKEY|ShiftMask,		XK_a,          defaultgaps,            {0} },
	{ MODKEY,			    XK_s,          togglesticky,           {0} },
	{ MODKEY,			    XK_d,          spawn,                  {.v = (const char*[]){ "dmenu_run", NULL } } },
	{ MODKEY,			    XK_f,          togglefullscr,          {0} },
	{ MODKEY|ShiftMask,		XK_f,          setlayout,              {.v = &layouts[8]} },

	{ MODKEY,			    XK_h,          setmfact,               {.f = -0.05} },
	{ MODKEY,			    XK_l,          setmfact,               {.f = +0.05} },
	{ MODKEY|ShiftMask,		XK_semicolon,  shifttag,               { .i = 1 } },
	{ MODKEY,		        XK_r,          togglesmartgaps,        {0} },
	{ MODKEY,			    XK_Return,     spawn,                  {.v = termcmd } },
	{ MODKEY|ShiftMask,		XK_Return,     togglescratch,          {.ui = 0} },

	{ MODKEY,			    XK_z,          incrgaps,               {.i = +3 } },
	{ MODKEY,			    XK_x,          incrgaps,               {.i = -3 } },
	{ MODKEY,			    XK_g,          togglebar,              {0} },

    { MODKEY|ShiftMask,		XK_Page_Up,    shifttag,               { .i = -1 } },
    { MODKEY|ShiftMask,		XK_Page_Down,  shifttag,               { .i = +1 } },
    { MODKEY,			    XK_space,      zoom,                   {0} },
    { MODKEY|ShiftMask,		XK_space,      togglefloating,         {0} },
    { MODKEY|ShiftMask,     XK_q,          quit,                   { 0 } },
    { MODKEY,               XK_Tab,        shiftview,              { .i = +1 } },
    { MODKEY|ShiftMask,     XK_Tab,        shiftview,              { .i = -1 } },

    { MODKEY,               XK_c,            spawn,         {.v = (const char*[]){ TERMINAL, "-e", "bc", "-l", NULL } } },
    { MODKEY,               XK_n,            spawn,         SHCMD("exec nemo") },
    { MODKEY|ShiftMask,     XK_n,            spawn,         SHCMD("exec nitrogen") },
    { MODKEY,               XK_m,            spawn,         SHCMD("exec redshift -O 3500") },
    { MODKEY|ShiftMask,     XK_m,            spawn,         SHCMD("exec redshift -x") },
    { MODKEY|ShiftMask,     XK_s,            spawn,         SHCMD("exec slock") },
    { MODKEY,               XK_e,            spawn,         SHCMD("exec emacs") },
    { MODKEY,               XK_o,            spawn,         SHCMD("exec obsidian") },
    { MODKEY,               XK_v,            spawn,         SHCMD("exec feh --bg-fill --randomize /mnt/disk/wallpapers/secure/*") },
    { MODKEY|ShiftMask,     XK_v,            spawn,         SHCMD("exec feh --bg-max --randomize /mnt/disk/wallpapers/insecure/*") },
    { MODKEY,               XK_b,            spawn,         SHCMD("exec blueman-manager") },
    { MODKEY,               XK_p,            spawn,         SHCMD("exec maim ~/$(date +%H:%M:%S).png") },
    { MODKEY|ShiftMask,     XK_p,            spawn,         SHCMD("exec maim -s ~/$(date +%H:%M:%S).png") },
    { MODKEY,		        XK_comma,        spawn,         SHCMD("mpc toggle; pauseallmpv") },
    { MODKEY,		    	XK_period,       spawn,         {.v = (const char*[]){ "mpc", "next", NULL } } },
	{ MODKEY|ShiftMask,		XK_period,       spawn,         {.v = (const char*[]){ "mpc", "prev", NULL } } },
    { MODKEY,			    XK_Right,        spawn,         {.v = (const char*[]){ "mpc", "volume", "+10", NULL } } },
	{ MODKEY,			    XK_Left,         spawn,         {.v = (const char*[]){ "mpc", "volume", "-10", NULL } } },
    { MODKEY,			    XK_F6,           spawn,         {.v = (const char*[]){ "mpc", "seek", "-10", NULL } } },
	{ MODKEY,			    XK_F7,           spawn,         {.v = (const char*[]){ "mpc", "seek", "+10", NULL } } },

	{ MODKEY,               XK_F9,            spawn,                  {.v = mutevol } },
	{ MODKEY,               XK_F11,           spawn,                  {.v = upvol } },
	{ MODKEY,               XK_F10,           spawn,                  {.v = downvol } },
    { 0,                    XF86XK_MonBrightnessUp,      spawn,                  { .v = (const char*[]) { "sudo", "xbacklight", "-inc", "10", NULL } } },
    { 0,                    XF86XK_MonBrightnessDown,    spawn,                  { .v = (const char*[]) { "sudo", "xbacklight", "-dec", "10", NULL } } },
};

static const Button buttons[] = {
	/* click                event mask           button          function        argument */
#ifndef __OpenBSD__
	{ ClkWinTitle,          0,                   Button2,        zoom,           {0} },
	{ ClkStatusText,        0,                   Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,                   Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,                   Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,                   Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,                   Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,           Button1,        sigdwmblocks,   {.i = 6} },
#endif
	{ ClkStatusText,        ShiftMask,           Button3,        spawn,          SHCMD(TERMINAL " -e nvim ~/.local/src/dwmblocks/config.h") },
	{ ClkClientWin,         MODKEY,              Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,              Button2,        defaultgaps,    {0} },
	{ ClkClientWin,         MODKEY,              Button3,        resizemouse,    {0} },
	{ ClkClientWin,		    MODKEY,		         Button4,	     incrgaps,       {.i = +1} },
	{ ClkClientWin,		    MODKEY,		         Button5,	     incrgaps,       {.i = -1} },
	{ ClkTagBar,            0,                   Button1,        view,           {0} },
	{ ClkTagBar,            0,                   Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,              Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,              Button3,        toggletag,      {0} },
	{ ClkTagBar,		    0,		             Button4,	     shiftview,      {.i = -1} },
	{ ClkTagBar,		    0,		             Button5,	     shiftview,      {.i = 1} },
	{ ClkRootWin,		    0,		             Button2,	     togglebar,      {0} },
};
