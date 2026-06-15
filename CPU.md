
Initial two-bus architecture.  Registers:

| Reg | In     | Out   |   |
|-----|--------|-------|---|
| MAR | A      | RAM A |   |
| A   | A      | ALU B |   |
| B   | A      | B     |   |
| PC  | A      | B     |   |
| ALU | RA / B | A     |   |
| IR  | B      |       |   |

Some thoughts on microcode:

|           | -- | PC  | -- | IR | MAR | -- MEM | MEM -- | A  | -- B | B -- | -- C | C -- | -- | ALU | ---- |
| Operation | LD | INC | OE | LD | LD  | WR     | RD     | LD | OE   | LD   | OE   | LD   | OE | F   | MODE |
|-----------|----|-----|----|----|-----|--------|--------|----|------|------|------|------|----|-----|------|
| Fetch     |    |     | 1  |    | 1   |        | 0       |    |      |      |      |      | 1  | =A  |      |
|           |    |     |    |    |     |        | 1       |    |      |      |      |      |    |     |      |

	
