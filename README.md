FIFO (First in First out):

![DW03_BICTR_DCNTO Diagram](https://github.com/ElTheScreeps/FIFO/assets/115155585/387692f4-1b07-41e3-89f4-bd9bd86ce869)

The memory interface of the FIFO is presented in the following tables.

| Parameter name | Default value | Value Range | Description                                                                     |
|      :---:     |     :---:     |    :---:    |    :---:                                                                        |
| DATA_WIDTH     | 8             |≥ 1          | Size of the data                                                                |
| ADDR_WIDTH     | 8             |> 1          | Size of the internal address. Determines the FIFO depth (2<sup>ADDR WIDTH</sup>)|

| Port Name   | Direction   | Size       | Description                                                            |
|    :---:    |    :---:    |   :---:    |   :---:                                                                |
| clk         | IN          | 1          | Clock signal                                                           |
| rst_n       | IN          | 1          | Asynchronous reset signal, active low                                  |
| push        | IN          | 1          | Write command for data, valid only if the memory is not full (full=0)  |
| data_in     | IN          | DATA_WIDTH | Written data                                                           |
| pop         | IN          | 1          | Read command for data, valid only if the memory is not empty (empty=0) |
| data_out    | OUT         | DATA_WIDTH | Read data (first written)                                              |
| empty       | OUT         | 1          | FIFO memory empty indicator. No reads (pop) are allowed                |
| full        | OUT         | 1          | FIFO memory full indicator. No writes (push) are allowed               |


How to use this files:

1. Download the files;
2. Put them in a directory;
3. Open Modelsim;
4. Change directory to the directory who contain the files;
5. Create a project and add the files;
6. Compile the files and start stimulate.
