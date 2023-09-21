#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Check the number of arguments
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <file> <string>\n", argv[0]);
        return 1;
    }

    // Open the file for writing
    const char *filename = argv[1];
    FILE *file = fopen(filename, "w");
    if (!file) {
        syslog(LOG_ERR, "Error opening file: %s", filename);
        perror("Error opening file");
        return 1;
    }

    // Write the string to the file
    const char *text = argv[2];
    if (fputs(text, file) == EOF) {
        syslog(LOG_ERR, "Error writing to file: %s", filename);
        perror("Error writing to file");
        fclose(file);
        return 1;
    }

    // Close the file
    fclose(file);

    // Log the successful write with LOG_DEBUG
    syslog(LOG_DEBUG, "Writing %s to %s", text, filename);

    // Close syslog
    closelog();

    return 0;
}
