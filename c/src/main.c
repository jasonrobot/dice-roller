#include "stdio.h"
#include "stdlib.h"
#include "time.h"
#include "dice.h"
#include "string.h"

int main(void) {
    printf("4\nbut really...\n");
    srand(time(NULL));
    // int result = rand();
    // printf("%d\n", result);
    printf("%d\n", rollOne(6));
    printf("Ok, this is a lot harder already.\n");
    int amount = 10;
    int* results = roll(amount, 20);
    printf("[");
    for (int i = 0; i < amount; i++) {
        printf("%d", results[i]);
        if ((i + 1 - amount) != 0) {
            printf(", ");
        }
    }
    printf("]\n");
    free(results);

    int running = 1;
    char input[BUFSIZ];
    char firstnum[BUFSIZ];
    char secondnum[BUFSIZ];
    while (running) {
        if ( fgets(input, BUFSIZ, stdin) == NULL ) {
            continue;
        }
        printf("%s\n", input);
        if (input[0] == 'q') {
            running = 0;
        }
        char* d_char = NULL;
        d_char = strchr(input, 'd');
        if (d_char == NULL) {
            printf("Unable to parse input: %s\n", input);
            continue;
        }
        strncpy(firstnum, input, (d_char-firstnum)/sizeof(char));
        strcpy(secondnum, d_char + sizeof(char));
        printf("%s, %s", firstnum, secondnum);
    }

    return 0;
}