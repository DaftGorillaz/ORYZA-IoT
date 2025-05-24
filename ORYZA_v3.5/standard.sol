**********************************************************************
* Soil data file for PADDY soil water balance model.                 *
* File name   : (User Defined)                                       *
* Addtional information : (User Defined)                             *
* Note: Three markers for variable definition, with ! only or no     *
*       definition, value(s) must be given, with !@ value must switch*
*       among given, with !* the variable and values can be commented*
*       out                                                          * 
**********************************************************************

*---------------------------------------------------------------*
* 1. Various soil and management parameters
*---------------------------------------------------------------*
WL0MX = 50.  ! Bund height (mm)
NL    = 9     ! Number of soil layers (maximum is 10) (-)
TKL   = 3*0.05, 3*0.05, 0.10, 0.20, 0.20 ! Thickness of each soil layer (m)
ZRTMS = 1.0   ! Maximum rooting depth in the soil (m)

*---------------------------------------------------------------*
* 2. Puddling switch: 1=PUDDLED or 0=NON PUDDLED
*---------------------------------------------------------------*
*SWITPD = 0 !@ Non puddled
SWITPD = 1  ! Puddled

* If PUDDLED, supply parameters for puddled soil
NLPUD = 3 ! Number of puddled soil layers, including the plow sole (-)
          ! (NLPUD cannot exceed the total number of soil layers NL)
DPLOWPAN = 0.50  !* The depth of plowpan (m), if it is missing, will be 
                 ! calculated from NLPUD. If it is 0 or negative number,
                 ! equal to the maximum depth of soil layer
*---------------------------------------------------------------*
* 3. Groundwater switch: 0=DEEP (i.e., not in profile), 1=DATA 
* (supplied), 2=CALCULATE
*---------------------------------------------------------------*
SWITGW = 0  !@ Deep groundwater
*SWITGW = 2 ! Calculate groundwater
*SWITGW = 1 ! Groundwater data

* If DATA, supply table of groundwater table depth (cm; Y-value) 
* as function of calendar day (d; X value):
ZWTB =   1.,500.,
       366.,500.

* If CALCULATE, supply the following parameters:
ZWTBI = 500. ! Initial groundwater table depth (cm)
MINGW = 500. ! Minimum groundwater table depth (cm)
MAXGW = 500. ! Maximum groundwater table depth (cm)
ZWA   = 1.0  ! Receding rate of groundwater with no recharge (cm d-1)
ZWB   = 0.5  ! Sensitivity factor of groundwater recharge (-)

*---------------------------------------------------------------*
* 4. Percolation switch
* Value for SWITVP can not be 1 (CALCULATE) for nonpuddled soil
*---------------------------------------------------------------*
SWITVP = -1 !@ Fixed percolation rate
*SWITVP = 0 ! Percolation as function of the groundwater depth
*SWITVP = 1 ! Calculate percolation

* If SWITVP = -1, supply fixed percolation rate (mm d-1):
FIXPERC = 10.0  !   3.0

* If SWITVP = 0, supply table of percolation rate (mm d-1; Y-value) 
* as function of water table depth (cm; X value):
*PERTB =   0., 3.,    !*
*         200., 3. 

*---------------------------------------------------------------*
*7.Soil physical properties, these parameters will be used when model
*runs under actual water or nitrogen condition, or even both. Otherwise
*these parameter will not be used.
CLAYX = 0.55,0.55,0.55,0.55,0.53,0.5,3*0.45      !soil clay contents, fraction
SANDX = 0.08,0.08,0.08,0.08,0.1,0.13,3*0.18      !soil sand contents, fraction
BD = 1.17894,1.17894,1.17911,1.42734,1.2695,1.31061,3*1.37562      !g/CM3
*Soil organic carbon and nitrogen content in kg C or N/ha

SOC = 2*11831.65,10044.87,8529.56,4632.67,1673.66,280.63,28.063,2.8063      
SON = 2*473.27,520.24,533.10,421.15,152.15,25.51,2.55, 0.255      
SNH4X = 2*4.73,5.20,5.33,4.21,1.51,0.25,0.026,0.0026       !*  kg N/ha
SNO3X = 2*2.372,2.6,2.67,2.11,0.76,0.13,0.013,0.0013        !*  kg N/ha
SPH = 9*6.0

*---------------------------------------------------------------*
* 8. Soil hydrological properties. Required type of data input
* according to setting of conductivity and water retention switch
*---------------------------------------------------------------*
* Saturated hydraulic conductivity, for each soil layer 
* (cm d-1) (always required!):
KST = 2*127.0, 0.3, 3*35.0, 2*103.0, 42.0

* Saturated volumetric water content, for each soil layer  
* (m3 m-3)(always required!):
WCST = 3*0.52, 3*0.55, 2*0.61, 0.64 

* Volumetric water content at field capacity, for each soil layer 
* (m3 m-3)(needed if SWITPF = 0):
WCFC = 3*0.48, 3*0.47, 2*0.52, 0.58 !* can be commented out based on options in sections 5 and 6

* Volumetric water content at wilting point, for each soil layer 
* (m3 m-3) (needed if SWITPF = 0):
WCWP = 9*0.21 !* can be commented out based on options in sections 5 and 6

* Volumetric water content at air dryness, for each soil layer
* (m3 m-3) (needed if SWITPF = 0):
WCAD = 9*0.01 !* can be commented out based on options in sections 5 and 6

*---------------------------------------------------------------*
* 9. Initialization conditions, and re-initialization
*---------------------------------------------------------------*
WL0I = 0.   ! Initial ponded water depth at start of simulation (mm)

* Initial volumetric water content at the start of simulation,
* for each soil layer (m3 m-3):
WCLI = 3*0.38, 3*0.30, 2*0.38, 0.40

* Initial ponded water depth and water contents may be reset:
* Ponded water depth: at minimum of WL0I and WL0MX
* Water contents in all soil layers: at saturation value
* For direct-seeded rice, this happens at sowing, for transplanted
* rice, this happens at transplanting 
* Re-initialize switch RIWCLI is YES or NO
*RIWCLI = 'NO'   !@
RIWCLI = 'YES'

*---------------------------------------------------------------*
* 10. Initialization of soil thermal conditions
*---------------------------------------------------------------*
SATAV = 25.0       !Soil annual avaerage temperature of the first layers
SOILT = 27.0, 25.0, 23.0, 21.0, 19.0, 4*17.0     !Initial soil temperature in each layer
*                  !Have to provide above either one and two of abov paremeter, otherwise,
*                  !model start the calculation of soil temperature at 0 degree
* Table for interpolation of water content between soil layers for
* those layers for which no observations were made: first number is
* the soil layer for which interpolation needs to be done, the second
* is the number of the underlying soil layer, the third is the number 
* of the overlying soil layer. No interpolation is performed when all 
* three numbers are the same: 
WCLINT  = 1, 1, 1,
          2, 2, 2,
          3, 3, 3,
          4, 4, 4,
          5, 5, 5,
          6, 6, 6,
          7, 7, 7,
          8, 8, 8,
          9, 9, 9
*---------------------------------------------------------------*
* 11. Observations/measurements
*    Switches to force observed water content in water balance
*---------------------------------------------------------------*

* WCL1_OBS, WCL2_OBS,...WCL10_OBS: Observed soil water contents 
* in layer 1, 2, ..., 10. Format: year, day number, water content
* Not obligatory to give data

WL0_FRC = 2     !Force model to use observation to drive simulation
*WL0_FRC = 0	! Inforce the function
WL0_OBS = 		! WL0 values are in mm
2012.0, 13.0, 15.0, 
2012.0, 21.0, 12.0, 
2012.0, 27.0, -150.0, 
2012.0, 40.0, 2.0,
2012.0, 70.0, 2.0,
2012.0, 89.0, -200.0

WCL1_FRC = 2
*WCL1_FRC = 0
WCL1_OBS = 
2012.0, 11.0, 0.38, 
2012.0, 31.0, 0.39, 
2012.0, 90.0, 0.36, 
2012.0, 110.0, 0.27

WCL2_FRC = 0
*WCL2_FRC = 2
WCL2_OBS = 
2012.0, 11.0, 0.385, 
2012.0, 31.0, 0.395, 
2012.0, 90.0, 0.365, 
2012.0, 109.0, 0.30

WCL3_FRC = 0
*WCL3_FRC = 2
WCL3_OBS = 
2012.0, 11.0, 0.261, 
2012.0, 31.0, 0.260, 
2012.0, 90.0, 0.249, 
2012.0, 110.0, 0.208

WCL4_FRC = 0
*WCL4_FRC = 2
WCL4_OBS = 
2012.0, 11.0, 0.412, 
2012.0, 31.0, 0.395, 
2012.0, 90.0, 0.412, 
2012.0, 110.0, 0.395


* @*===================================================================*
* @* Additional parameters with default value, can be provided by user
* @* ==================================================================*
* @*---------------------------------------------------------------*
* @* 1. Various soil and management parameters
* @*---------------------------------------------------------------*
* @* Give code name of soil data file to match the water balance PADDY:
* @SCODE = 'PADDY'
* @
* @*---------------------------------------------------------------*
* @* 2. Puddling switch: 1=PUDDLED or 0=NON PUDDLED
* @*---------------------------------------------------------------*
* @* Soil water tension of puddled soil layer at which cracks reach 
* @* break through the plow sole (pF):
* @PFCR = 6.0 
* @*---------------------------------------------------------------*
* @* 3. Groundwater switch: 0=DEEP (i.e., not in profile), 1=DATA 
* @* (supplied), 2=CALCULATE
* @*---------------------------------------------------------------*
* @
* @*---------------------------------------------------------------*
* @* 4. Percolation switch
* @* Value for SWITVP can not be 1 (CALCULATE) for nonpuddled soil
* @*---------------------------------------------------------------*
* @
* @*---------------------------------------------------------------*
* @* 5. Conductivity switch: 0=NO DATA, 1=VAN GENUCHTEN or 2=POWER
* @*    function used
* @*---------------------------------------------------------------*
* @SWITKH = 0 !@ No data
* @*SWITKH = 2 ! Power
* @*SWITKH  = 1 ! van Genuchten
* @
* @*---------------------------------------------------------------*
* @* 6. Water retention switch: 0=DATA; 1=VAN GENUCHTEN. When DATA, data
* @* have to be supplied for saturation, field capacity,
* @* wilting point and at air dryness
* @*---------------------------------------------------------------*
* @SWITPF = 0 !@ Data
* @*SWITPF  = 1 ! van Genuchten
* @
* @*---------------------------------------------------------------*
* @*7.Soil physical and chemical properties, these parameters will be used when model
* @*runs under actual water or nitrogen condition, or even both. Otherwise
* @*these parameter will not be used.
* @*FCarboh = 0.54         !* fraction
* @*FCellulo = 0.38        !* fraction
* @*DCarboh = 0.014         !* decomposition rate of carbohydrates (1/d)
* @*DCellulo = 0.0034        !* decomposition rate of cellulous (1/d)
* @*DLignin = 0.00095          !* decomposition rate of lignin (1/d)
* @*DHUMUS = 0.0012845		! decomposition rate of HUMUS (1/d)
