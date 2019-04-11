# Introduction
This project provides a board definition which enables the Arduino IDE to compile firmware (such as Marlin) for Anet 3D printers.  It is used in the SkyNet3D Marlin distribution for Anet printers, but can be used independently to, for example, build Marlin from source.

## Installation Instructions

1. Download and install the most Arduino IDE from 
   https://www.arduino.cc/en/main/software

2. Launch the Arduino IDE

3. Open the Arduino IDE Preferences by selecting **File -> Preferences**, or pressing **Ctrl + Comma**

4. Locate the **Aditional Boards Manager URLs** field and paste in this URL: 

`https://github.com/benlye/anet-board/raw/master/package_anet_board_index.json`

**Note:** Multiple URLs are comma-separated.

5. Click **OK** to save the change

6. Click **Tools -> Board -> Boards Manager**

7. Type **anet** into the search box to see the Anet board package

8. Click on the Anet board and click the **Install** button.

9. Click **Close** to close the Boards Manager

## Using the Board Definition
1. Open the Arduino IDE

1. Open the **Tools -> Board** menu and select either of the Anet V1.0 boards (see note below)

1. Open the **Tools -> Port** menu and select the appropriate COM port (the one which appeared when you plugged your printer into a USB port)

**Note:** The Optiboot board option is highly recommended as the Optiboot bootloader uses much less space than the standard Atmega 1284p bootloader, allowing more flash space for the firmware.  

If you choose to use the Optiboot option you **MUST** burn the Optiboot bootloader before uploading firmware for the first time, otherwise you risk overwriting the bootloader.

## Burning the Bootloader
Burning the bootloader to the board requires either an Arduino programmed as an ISP, or a USBasp.  The programmer is connected to the middle six pins of the J3 connector on the Anet v1.0 board.

Burning the bootloader to an Arduino always erases the flash memory.  Once the bootloader has been burned using a programmer the programmer should be disconnected and firmware uploaded using the board's USB connection.

With the programmer connected:
1. Launch the Arduino IDE

1. Select the appropriate board from the **Tools -> Boards** menu - either `Anet V1.0` or `Anet V1.0 (Optiboot)`

1. Select the appropriate programmer - typically **USBasp**

1. Click **Tools -> Burn Bootloader**

1. The board will reset when complete, and the LCD display will be blank

1. Disconnect the programmer

Assuming there were no errors, at this point the firmware has been erased and will need to be re-uploaded.

## Uploading Firmware
Assuming you have already configured your source...

1. Connect the printer using the USB port

1. Launch the Arduino IDE and open the source code

1. Click **Sketch -> Upload** or press **Ctrl + U**

**Note:** When uploading firmware, use **Sketch -> Upload** (or **Ctrl + U**), which uploads over the USB connection, **not** **Sketch -> Upload Using Programmer** (unless you're actually using an Arduino programmer and know what you're doing).
