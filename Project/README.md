# UART Project

## Project Description

This project implements a Universal Asynchronous Receiver-Transmitter (UART) module using SystemVerilog on Basys3 boards. The UART module enables asynchronous serial communication, showcasing fundamental concepts in digital design, including sequential logic, state machines, and control logic for read/write operations.

## Capabilities

### Data Transmission and Reception
- **Simultaneous Communication**: The UART module can transmit and receive data between two Basys3 boards simultaneously.
- **Configurable Settings**: It uses 8 data bits, 1 parity bit, and 1 stop bit. 

### Register Files
- **FIFO Buffers**: The project utilizes 4-byte FIFO buffers (TXBUF and RXBUF) for storing transmitted and received data, ensuring efficient data handling and queuing.

### Display Integration
- **7-Segment Display**: The contents of the TXBUF and RXBUF are displayed on the 7-segment display of the Basys3 board.
- **User Navigation**: Users can navigate through the buffer contents using buttons to switch between different bytes and between the transmitter and receiver buffers.

### User Controls
- **Data Loading and Transmission**: Data loading and transmission are controlled via buttons, with visual feedback provided by LEDs.
- **Buffer Navigation**: Navigation through the buffer contents is managed by additional buttons, enhancing user interaction and debugging capabilities.
