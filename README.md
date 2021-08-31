auto-power - tool that automatically selects the power value for the rig to get the most profit.

- Automatically OC to choose the index with the highest hashrate.
- Automatically monitor and correct errors caused by changing ambient temperature, automatically adjust the OC number to avoid repeating errors next time.
- Automatically control fan speed with goals: Safe, cautious, intelligent, optimal, predictive before errors appear for early response.
- Automatically adjust power in real time so that vga operates at the most profit with different day and night ambient temperatures.
- Automatically identify and automatically adjust OC when the list of VGA in the rig is disturbed PCI position, add or remove from rig 1 or more vga for maintenance.

The tool is currently supported on HiveOS, other operating systems need a few changes in the configuration file to be usable but have not been tested in practice. Particularly, RaveOS does not know how to install the tool yet, it is difficult for simple mining to use this tool because access to the necessary functions of the OS is prevented everywhere.
The current tool that only supports miners is nbminer.
The tool currently only supports coin ETH.
The current tool only supports NVIDIA VGA.
Tool needs to evaluate the needs of Miners to consider whether to expand to support other coins, other miners or not. If many people are interested, they can develop their own OS to avoid depending on HiveOS or existing OS.
DevFee 1%: Every 24 hours, equivalent to 14.4 minutes of devfee, 60 minutes or more to collect. Receive only when the rig has an error that needs to be fixed, not when the rig is operating normally. After fixing the error, if the machine runs for a whole month, the whole year will not stop to collect fees. The toll command will activate when the rig has an error, check for 60 minutes or more to collect. Fee information can be viewed in the log file in the /auto-power/logs/ directory. Everyone can consider trying it, spend 1% devfee to get back many times more profit 1% devfee, it's a profitable business, can try it and consider if you don't want to stop first. when devfee is full 60 minutes will not be charged. Even sacrificing 1% of devfee to scan the optimal set of numbers for the rig and then stop using it is a bright path. When using auto-power, it helps to thoroughly fix all errors to help VGA run more durable, increase VGA life, which is also a rare benefit.

Installation Instructions:
Here are the entire installation and usage instructions, taking HiveOS as an example:
After downloading and extracting, copy the install-auto-power.sh file to the drive (partition) containing the OS config file (eg hiveOS is the drive named Hive).
This is a file containing a set of commands, like on Windows, this is a *.bat, *.cmd file. It is also possible to copy and run each command sequentially.
To run the install-auto-power.sh file:
Before running the install-auto-power.sh file, pay attention to wait for LA < 1 to start. LA is the overall system load index, if any part is overloaded, then LA > 1 (such as CPU overload, overheating or north bridge, VGA, USB/SSD/HDD, ... ).
After LA < 1, turn off the OS watchdog if it is on.
After LA < 1, watchdog off, Find shellinabox or any similar app that OS supports on the web to enter commands remotely. For HiveOS type in:
sudo bash /hive-config/install-auto-power.sh
After the entire command has finished running, if it does not appear unexpectedly dotnet core 3.1 LTS runtime has been installed, the /auto-power directory on it has been shared with full permissions.
From Windows access the shared folder with the command \\IP\auto-power (IP is LAN IP can be found on the OS management web)
copy all the files inside the previously unzipped auto-power\ folder to the shared folder \\IP\auto-power\
From HiveOS web turn off autoFan (if any) remove all OCs on HiveOS to avoid the two sides competing to install OC.
After removing autoFan, remove OC, turn off HieOS watchdog, go back to shellinabox run command: sudo bash /auto-power/set-service.sh to install auto-power tool start with OS and now boot auto-power.
You can find the file auto-power.runtimeconfig.json to fix the OC number set to match the current rig or start from the default set of 0, wait about 3-5 days, the most optimal set of numbers will finish scanning. . There are also many other indicators that can be installed according to the instructions at the bottom.

Research documents:
The following is an explanation of the parameters in the auto-power.runtimeconfig.json configuration file and the configuration files generated during auto-power run as currentOC.json and currentPowers.json:
- the file auto-power.runtimeconfig.json has a number of self-changing indicators that will be saved in currentOC.json, but the power indicator changes frequently, so save a separate file currentPowers.json.
- Which indicators are in one of the following two files, the tool will prioritize using it, the indicators do not exist in the following two files, the tool will use it in the file auto-power.runtimeconfig.json
- Every time the user edits a file, the tool will reload the index of the entire file, which index is used by the tool according to the priority rule of using the index as the rule above.

Indicators in the file auto-power.runtimeconfig.json:
In the file auto-power.runtimeconfig.json the parameters outside the "userConfigProperties" section do not touch, the adjustment inside "userConfigProperties" is explained as follows:
- "defaultCoreMHz": [0, 50, 100, 150]: is the core clock offset Mhz, numbers separated by comma "," can be more than the number of VGA can also be less than the number of VGA, at least 1 number. If more than the number of VGA, the following numbers are ignored, if less, the smallest number will be used to add to the VGA without number, in this case the 5th VGA and later receive the value 0, the case in the number sequence with numbers less than 0 can see this example to deduce: the sequence of numbers [-150, 100, -50, 150] with 6 VGAs, the following 2 VGAs without settings will take the number -50, [-150, 100, -50, 30, 150] then 1 VGA without the number will take the number 30 .For the sequence of numbers of other indexes in any file, this rule is also followed. This index will be copied to currentOC.json.
- "LockedCoreClock": [0]: This stat is for RTX, it is Absolute Core Clock MHz, when using this indicator, there is no need for "defaultCoreMHz" and "PowerLimitW" below. In the first version, the tool has automatically adjusted this index instead of the power index, but have not tested it, only running code. This indicator will be copied to currentPowers.json.
- "defaultMemoryMHz":[0]: This is the Memory Clock Mhz in HiveOS. This index will be copied to currentOC.json.
- "PowerLimitW":[80]: Power Limit W in HiveOS. This indicator will be copied to currentPowers.json.
- "AutoPowerLimitBool": [true]: For true/false range, if any VGA has no value, the default value will be the value of the first VGA. "AutoPowerLimitBool" to toggle which VGA will automatically adjust the power. true is on, false is to get a fixed power value that doesn't change over time.
- "autoPowerIntervalMin": 4: Every 4 minutes will increase or decrease 1W for each VGA, depending on the specific situation. Indicators without the [] pair are single values, with the [] pair as a numeric sequence, true/false sequence, or some other type range, usually corresponding to each value of which is 1 VGA.
- "minerApiUrl": "http://127.0.0.1:22333/api/v1/status", This parameter of nbminer, when supporting other miners will change to another value, currently only supports nbminer, change the price value for another miner, the other miner can't work either.
- "MinerName": "nbMiner", similar to the previous index, currently the change has not taken effect.
- "refreshSecond": 120, Every 120 seconds print out the log file of the tool's indicators.
- "extraPowerW": 115, This indicator is the estimated power of: total rig power minus VGA power. Such as gizzard + 4u fan, ... For example, NVIDIA VGA 4u case can calculate 35W gizzard, 4 fans 1.6A = 1.6A x 12V x 4fans = 35W + 76.8 = 111.8W
- "WriteToLogFile": true, true is to log file, false is to not log file.
- "isEffWattMode": false, false is the power optimization to bring the biggest profit, true is the power optimization to bring the best electricity efficiency, true is used in case the coin price is low, need to be optimized to minimize electricity loss.
- "PowerPriceUSD": 0.14, is the electricity price depending on each country, each region, each price list. The unit of measurement is USD/kW.
- "delLogAfterXdays": 3, After how many days does the log file exist, it will be deleted?
- "smartAutoFan": [true], Turn each VGA on and off to see which fan uses auto fan, which fan does not.
- "defaultTargetCoreTemp": [65], Fan speed will be adjusted so that GPU temperature never exceeds this stat. This index will be copied to currentOC.json.
- "defaultMinFanSpeedPercent": [60], % min fan speed, % fan speed is never lower than this number to keep the airflow steady not only to cool the GPU but also to cool the VRAM, if not enough VRAM cool , this index will increase inside the file currentOC.json.
- "MaxFanSpeedPercent": [90], This stat is up to 100%, default is 90%. If placed 100% or near, the fan heats up the engine, dries quickly, and requires a lot of maintenance. If set too low wastes the operational capacity of VGA. Consider a value between 90-95% is reasonable.
- "autoUpMinFanSpeedWhenErrorMax": [ 80 ], This value needs to be less than "MaxFanSpeedPercent", so it should be lower than "MaxFanSpeedPercent" 10% so that the tool has space to choose the correct error correction solution when VGA error occurs. This stat sets a limit when VRAM needs more wind then "defaultMinFanSpeedPercent" will increase not exceeding this "autoUpMinFanSpeedWhenErrorMax" metric.
- "autoFanIntervalSecond": 10, Every 10 seconds will check and adjust fan speed if necessary.
- "autoFixRejectShare": [true], Autocorrect if vga encounters share error.
- "autoFixHashrateEqual0": [true], Autocorrect if vga get no hashrate error.
- "autoFixPowerEqual0": [true], self-corrects if vga gets power=0 value error.
- "autoDownTargetCoreTempWhenError": [true], Allow to reduce "defaultTargetCoreTemp" if that particular error case should reduce "defaultTargetCoreTemp", if "defaultTargetCoreTemp" is disallowed, another allow will execute, but precision of bug fixes can be reduced.
- "autoDownMemoryMHzWhenError": [true], Allows reducing MemoryMHz, same as above, true is recommended.
- "autoFixRebootRigAfterMinutes": 5, Allow the tool 5 minutes to track the error, After 5 minutes will decide on the solution and reboot the rig if necessary. The smaller this number is, the less accurate it is, and the larger the number, the more wasteful it is. Default is 5 minutes.
- "autoOcCoreMHz": [11], Value > 0 indicates auto OC is ready or auto OC is in progress, value < 0 indicates auto OC is done, monitoring to lower OC if necessary, within 24h no If an error occurs, the value will be changed to 0. The value 0 indicates that the OC is complete and there are no errors. 11 is a prime number, the unit value is 1 to make it easier to guess how the old value has changed. For example, the original value was 110, now it's 198, look at the number 8 in the unit row will know that auto OC has increased 8 times. 198 - 8 x 11 = 110 will recall the original value before auto OC was 110.
- "autoOcMemoryMHz": [61], Similarly this index is used to auto OC MemoryMHz.
- "StopMinerCmd": ["/hive/bin/miner","stop"], This is the command to stop the miner in case of necessary error correction. Depending on each OS has its own command, the value seen here is HiveOS.
- "XidBlackList": [79], is a list of VGA error codes, if the error codes are put here, the tool will see this error code and will not automatically fix it. 79 is an error: GPU has fallen off the bus, this is a loose physical error that the PCI tool can't handle. Anyone who sees any other errors can add their own. Error code lookup table: https://docs.google.com/spreadsheets/d/1RFSV59IB7sp-5qwB-mJ7uoMVXfoBYxr4uvqDlPfyVXQ/edit#gid=0. During the operation of the tool, all arising VGA errors will print a separate file /auto-power/ErrXid.txt for everyone's convenience.

Indexes in currentOC.json file:
The indexes inside the file auto-power.runtimeconfig.json have a default prefix eg defaultCoreMHz when switching to the currentOC.json file will have the current prefix (CurrentCoreMHz) without further explanation, the indexes have the same name between the two. file also needs no further explanation. The file currentOC.json is only generated after the rig generates the first error or the tool needs to save the index. Default is 1 hour after appearing.
- "UUIDs": are the unique character strings to identify NVIDIA's GPU. Since NVIDIA was born, there will be no 2 VGAs with the same number. Used to identify when the VGA in a rig has a PCI position disturbance, so that the OC does not mistake this set of indicators for the other VGA after each rig repair and maintenance. This indicator is saved by the tool itself, should not be touched.
- "LastAutoOcTime": This indicator is also created by the tool itself, understand that it should not be touched. Record when the VGA's OC index is changed, for later reference to make more accurate decisions.
- "AutoOC":[false], Default is false, if false, AutoOC will check "LastAutoOcTime" if the time to correct VGA's OC value is more than 24 hours, it will reverse the "AutoOC" value to true for that VGA. to start autoOC, after autoOC is done the value stays true forever without changing. In case AutoOC is not necessary to false, the user immediately switches to true when core and mem are all set to 0 to scan and select a new value from the beginning, if using the old stable OC set, choose false by default to strictly comply. 24h without errors to start autoOC, otherwise the tool can autoOC and fix errors, if there is an error within 24h the tool will fix the error and wait for 24h to be stable before proceeding with autoOC.
- "LastAutoFix0MHs": This is also a time series. The number of elements is the number of VGAs. this indicator to avoid the case of 0 Mh error correction loop, If you encounter this error every 1 hour, only try to fix the error once, avoid the case of hardware failure, go fix software errors and make the rig restart continuously without worrying about doing eat what.

The indicators in the file currentPowers.json: file currentPowers.json only appear after the default of 8 minutes, when the power has an adjustment to save the index.
- "PowerLimits": is the indicator "PowerLimitW" in the file auto-power.runtimeconfig.json
- "LockedCoreClock": index copied from file auto-power.runtimeconfig.json
- "UUIDs": same as "UUIDs" in file currentOC.json

ErrXid.txt file: 1 line in ErrXid.txt file has the form:
Aug 27 11:52:10 Worker1 kernel: NVRM: Xid (PCI:0000:06:00): 43, pid=2863, Ch 00000010
Error time Aug 27 11:52:10, rig name Worker1, PCI index: 6, error code: 43. Error code lookup table: https://docs.google.com/spreadsheets/d/1RFSV59IB7sp-5qwB-mJ7uoMVXfoBYxr4uvqDlPfyVXQ/edit#gid=0
