
#include <stdint.h>

typedef uint16_t cell;

typedef struct {
  cell W;
  cell *IP;
  cell *PSP;
  cell *RSP;
  cell *PC;
} til_regs;

void next();

