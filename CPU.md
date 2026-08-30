
Initial two-bus architecture.  Registers:

| Reg | In     | Out   |   |
|-----|--------|-------|---|
| MAR | A      | RAM A |   |
| A   | A      | ALU B |   |
| B   | A      | B     |   |
| PC  | A      | B     |   |
| ALU | RA / B | A     |   |
| IR  | B      |       |   |

Some thoughts on sequencing.  All signals: '1' means active

|           | -- | PC  | -- | IR | MAR | -- MEM | MEM -- | A  | -- B | B -- | -- C | C -- | -- | ALU | ---- |                    |
| Operation | LD | INC | OE | LD | LD  | WE     | OE     | LD | OE   | LD   | OE   | LD   | OE | F   | MODE | Note               |
|-----------|----|-----|----|----|-----|--------|--------|----|------|------|------|------|----|-----|------|--------------------|
| Fetch     |    |     | 1  |    | 1   |        |        |    |      |      |      |      | 1  | =A  |      | PC thru ALU to MAR |
|           |    |     |    |    |     |        | 1      |    |      |      |      |      |    |     |      | Read mem to IR     |
|           |    | 1   |    | 1  |     |        |        |    |      |      |      |      |    |     |      | Memory to IR       |
|           |    |     |    |    |     |        |        |    |      |      |      |      |    |     |      |                    |

	
