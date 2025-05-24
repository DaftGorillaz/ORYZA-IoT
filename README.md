# ORYZA-IoT
Integrating ORYZAv3 with IoT Sensors

This only serves as a proof of concept.

# Pre-requisite
Only works for Windows


# Parts
ORYZAv3.5
This is the latest version for ORYZA and is currently at pre-release
https://github.com/emanalo/ORYZACropModel/tree/main

ORYZA Analysis Tool(v4.2)
An excel spreadsheet created by ORYZA to help analyse the output of the model.
Can be found in `ORYZA_v3.0.zip` from [ORYZACropModel](https://github.com/emanalo/ORYZACropModel/tree/main)

ORYZA_Model_RTOOLS
These are R functions developed by [Rodriguez-Espinoza J.](https://github.com/jrodriguez88/ORYZA_Model_RTOOLS?tab=readme-ov-file)
Used to create weather files `*.WTH` and soil files `*.SOL` for ORYZA

# Instructions for running
Run `ORYZA35.exe`
Output will be stored in `\test_data` with the following files

| output file | description                                                                                                               |
| ----------- | ------------------------------------------------------------------------------------------------------------------------- |
| op.dat      | contains summarised season results such as<br>final yield, total crop duration, seasonal transpiration<br>and evaporation |
| res.dat     | daily output of the model during the simulation                                                                           |


