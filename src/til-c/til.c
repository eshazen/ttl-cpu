
#include "til.h"

static til_regs regs;

void next() {
  regs.W = *regs.IP++;
  regs.PC = regs.W++;
}

