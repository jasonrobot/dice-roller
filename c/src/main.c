#include "stdio.h"
#include "stdlib.h"
#include "time.h"
#include "dice.h"
#include "string.h"

void rollAndPrint(int amount, int sides) {
    int* results = roll(amount, sides);
    printf("[");
    for (int i = 0; i < amount; i++) {
        printf("%d", results[i]);
        if ((i + 1 - amount) != 0) {
            printf(", ");
        }
    }
    printf("]\n");    
    free(results);
}

int main(void) {
    int running = 1;
    char input[BUFSIZ];
    char firstnum[BUFSIZ];
    char secondnum[BUFSIZ];
    while (running) {
        printf("Enter dice to roll (q to quit): ");
        if ( fgets(input, BUFSIZ, stdin) == NULL ) {
            break;
        }

        if (input[0] == 'q') {
            running = 0;
            break;
        }

        int amount = 0;
        int sides = 0;
        if (parse(input, &amount, &sides) != INVALID_DICE_STRING) {
            printf("rolling %dd%d\n", amount, sides);
            //results = roll(amount, sides);
            rollAndPrint(amount, sides);
        }
        else {
            printf("Unable to parse input: %s\n", input);
        }
    }

    return 0;
}