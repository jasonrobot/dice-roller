#include "stdio.h"
#include "stdlib.h"
#include "time.h"
#include "dice.h"

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
    return 0;
}