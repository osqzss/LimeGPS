# LimeGPS

Yet another crude experimental implimentation of [gps-sdr-sim](https://github.com/osqzss/gps-sdr-sim) for real-time signal generation.
The code works with LimeSDR and has been tested on Windows 10 and Ubuntu 17.10. The default TX antenna port is TX1_1.

```
Usage: limegps [options]
Options:
  -e <gps_nav>     RINEX navigation file for GPS ephemerides (required)
  -u <user_motion> User motion file (dynamic mode)
  -g <nmea_gga>    NMEA GGA stream (dynamic mode)
  -l <location>    Lat,Lon,Hgt (static mode) e.g. 35.274,137.014,100
  -t <date,time>   Scenario start time YYYY/MM/DD,hh:mm:ss
  -T <date,time>   Overwrite TOC and TOE to scenario start time
  -d <duration>    Duration [sec] (max: 86400)
  -a <rf_gain>     Normalized RF gain in [0.0 ... 1.0] (default: 0.1)
  -i               Interactive mode: North='w', South='s', East='d', West='a'
  -I               Disable ionospheric delay for spacecraft scenario
```

### Build on Windows with Visual Studio

Follow the instructions at [Lime Suite wiki page](https://wiki.myriadrf.org/Lime_Suite) and install the Pothos SDR development environment.

1. Start Visual Studio.
2. Create an empty project for a console application.
3. On the _Solution Explorer_ at right, add the following files to the project:
 * __limegps.c__ and __limegps.h__
 * __gpssim.c__ and __gpssim.h__
 * __getopt.c__ and __getopt.h__
4. Add the path to the following folder in `Configuration Properties -> C/C++ -> General -> Additional Include Directories`:
 * __PothosSDR/include__ for pthread.h and lime/LimeSuite.h
5. Add the path to the following folder in `Configuration Properties -> Linker -> General -> Additional Library Directories`:
 * __PothosSDR/lib__ for pthreadVC2.lib and LimeSuite.lib
6. Specify the name of the additional libraries in `Configuration Properties -> Linker -> Input -> Additional Dependencies`:
 * __pthreadVC2.lib__
 * __LimeSuite.lib__
7. Select __Release__ in the _Solution Configurations_ drop-down list.
8. Select __X64__ in the _Sofution Platforms_ drop-down list.
9. Run `Build -> Build Solution`

After a successful build, you can find the executable in the __x64/Release__ folder.

### Build on Linux (Ubuntu 17.10)

1. Install LimeSuite and all the MyriadRF drivers.

 ```
$ sudo add-apt-repository -y ppa:myriadrf/drivers
$ sudo apt-get update
$ sudo apt-get install limesuite liblimesuite-dev limesuite-udev limesuite-images
$ sudo apt-get install soapysdr soapysdr-module-lms7
```

2. Build LimeGPS.

 ```
$ make
```

### License

Copyright &copy; 2018 Takuji Ebinuma  
Distributed under the [MIT License](http://www.opensource.org/licenses/mit-license.php).