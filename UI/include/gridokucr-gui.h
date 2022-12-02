#ifndef GRIDOKUCR_H
#define GRIDOKUCR_H

#include <gtk/gtk.h>
#include "image.h"

typedef struct step {
    GtkViewport *viewport;
    GtkButton **buttons;
    GtkFileChooserButton *file_chooser_button;
    GtkDrawingArea **draw_areas;
    GtkEventBox *event_box;
    GtkLabel **labels;
    GtkEntry **entries;
    GtkWidget **scales;
    Image **images;
} Step;

typedef struct progress {
    GtkProgressBar *progress_bar;
    GtkButton **buttons;
} Progress;

typedef struct header {
    GtkHeaderBar *header_bar;
    GtkButton **buttons;
} Header;

typedef struct ui {
    GtkWindow *window;
    GtkStack *stack;

    Step *steps[10];
    Header *header;
    Progress *progress;

    int curr_step;
    Image *curr_img;
} UI;



// CUSTOM FUNCTIONS //
UI * init_ui(GtkBuilder *builder);

// CALLBACKS //

// MAIN //
int launch_gui(int argc, char **argv);

#endif
