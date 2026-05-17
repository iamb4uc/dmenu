/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 0; /* -b  option; if 0, doommenu appears at bottom     */
static const unsigned int alpha = 0xf2;
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "DepartureMono Nerd Font:size=10:antialias=true:autohint=true",
    "NotoColorEmoji:size=13:antialias=true:autohint=true"};
static const char *prompt =
    "⚡ Launch:"; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#ebdbb2", "#1d2021"},
    [SchemeSel] = {"#1d2021", "#ebdbb2"},
    [SchemeOut] = {"#ebdbb2", "#aec07c"},
    [SchemeCursor] = {"#1d2021", "#ebdbb2"},
};

static const unsigned int alphas[SchemeLast][2] = {
    [SchemeNorm] = {OPAQUE, alpha},
    [SchemeSel] = {OPAQUE, alpha},
    [SchemeOut] = {OPAQUE, alpha},
    [SchemeCursor] = {OPAQUE, alpha},
};

/* -l option; if nonzero, doommenu uses vertical list with given number of lines */
static unsigned int lines = 10;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 40;
static unsigned int min_lineheight = 15;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/*
 * -vi option; if nonzero, vi mode is always enabled and can be
 * accessed with the global_esc keysym + mod mask
 */
static unsigned int vi_mode = 1;
static unsigned int start_mode = 0;
static Key global_esc = {XK_Escape, 0};
static Key quit_keys[] = {
    /* keysym	modifier */
    {XK_q, 0}};

/* Size of the window border */
static const unsigned int border_width = 0;
