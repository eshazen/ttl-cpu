
# TIL Architecture

## Secondary word

| Field     | Name         | Size  | Notes                                            |
|-----------|--------------|-------|--------------------------------------------------|
| Header    | Length/flags | 1     | Length (low bits) plus immediate and other flags |
|           | Name         | <len> | ASCII name                                       |
| Link      | Link         | 1     | Pointer to previous word                         |
| Code      | Code address | 1     | address of ENTER (DOCOLON                        |
| Parameter | WORD1        | 1     |                                                  |
|           | WORD2        | 1     |                                                  |
|           | ...          | 1     |                                                  |
|           | EXIT         | 1     | address of EXIT                                  |



## CPU

|    |                        |   |
|----|------------------------|---|
| IP | Instruction Register   |   |
| WA | Word address register  |   |
| CA | Code addresss register |   |
| RS | Return stack pointer   |   |
| SP | Data Stack pointer     |   |
| PC | Program counter        |   |
