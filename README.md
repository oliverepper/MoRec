# MoRec
MotionRecorder for Apple Watch

Record wrist movement as possible input for CreateML.

Example Debug Output:

```
2020-10-04 17:23:12.722113+0200 MoRec WatchKit Extension[2097:2174844] Reset recording
2020-10-04 17:23:12.727214+0200 MoRec WatchKit Extension[2097:2174844] Dispatching start in seconds(2)
2020-10-04 17:23:14.905632+0200 MoRec WatchKit Extension[2097:2174844] Start recording in queue: <NSOperationQueue: 0x116fef60>{name = 'NSOperationQueue 0x116fef60'}
2020-10-04 17:23:14.913768+0200 MoRec WatchKit Extension[2097:2174844] Dispatching stop in seconds(5)
2020-10-04 17:23:15.039903+0200 MoRec WatchKit Extension[2097:2175033] Handle Device Motion for timestamp: 0.0
2020-10-04 17:23:15.437441+0200 MoRec WatchKit Extension[2097:2175033] Handle Device Motion for timestamp: 0.40019800001755357
2020-10-04 17:23:15.837824+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 0.8003949999983888
2020-10-04 17:23:16.237921+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 1.2005939166701864
2020-10-04 17:23:16.637831+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 1.60079191668774
2020-10-04 17:23:17.037918+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 2.0009889166685753
2020-10-04 17:23:17.438699+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 2.401186916686129
2020-10-04 17:23:17.838842+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 2.801383916666964
2020-10-04 17:23:18.238975+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 3.2015825000125915
2020-10-04 17:23:18.639131+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 3.6017795000225306
2020-10-04 17:23:19.038728+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 4.001975874998607
2020-10-04 17:23:19.439130+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 4.40217387501616
2020-10-04 17:23:19.839573+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 4.8023708749969956
2020-10-04 17:23:20.239661+0200 MoRec WatchKit Extension[2097:2175031] Handle Device Motion for timestamp: 5.202567875006935
2020-10-04 17:23:20.396611+0200 MoRec WatchKit Extension[2097:2174844] Stop recording
[{"time":0,"attitude":{"pitch":1.0357329421669177,"roll":0.30727557988565529,"yaw":-0.17599973670332855},"rotationRate":{"x":0.03376760333776474,"y":0.018613066524267197,"z":-0.0079454900696873665},"gravity":{"x":0.15422447025775909,"y":-0.86023628711700439,"z":-0.48601248860359192},"acceleration":{"x":0.0051535665988922119,"y":-0.0012137889862060547,"z":-0.0033369660377502441}},{"time":0.40019800001755357,"attitude":{"pitch":1.0405245969903838,"roll":0.31508954044515369,"yaw":-0.1831400110515497},"rotationRate":{"x":-0.0069939270615577698,"y":-0.020103203132748604,"z":-0.010560904629528522},"gravity":{"x":0.15673826634883881,"y":-0.86266964673995972,"z":-0.48086819052696228},"acceleration":{"x":0.0093535929918289185,"y":-0.0059518218040466309,"z":-0.0027745962142944336}},{"time":0.80039499999838881,"attitude":{"pitch":1.0408703819402303,"roll":0.31358233825280551,"yaw":-0.18154210766864817},"rotationRate":{"x":0.020849838852882385,"y":-0.0023703123442828655,"z":0.0077100545167922974},"gravity":{"x":0.15592125058174133,"y":-0.86284452676773071,"z":-0.48081997036933899},"acceleration":{"x":0.0030446052551269531,"y":0.0097725391387939453,"z":0.0078578591346740723}},{"time":1.2005939166701864,"attitude":{"pitch":1.0448919382368387,"roll":0.31819977178750231,"yaw":-0.18597885224199365},"rotationRate":{"x":0.01054120808839798,"y":-0.0038615497760474682,"z":-0.0084124188870191574},"gravity":{"x":0.15705287456512451,"y":-0.86487030982971191,"z":-0.47679531574249268},"acceleration":{"x":0.0018976330757141113,"y":0.00094968080520629883,"z":0.0030547380447387695}},{"time":1.60079191668774,"attitude":{"pitch":1.0436929606887591,"roll":0.31746389110832546,"yaw":-0.1848889716307496},"rotationRate":{"x":-0.032055456191301346,"y":-0.004620150662958622,"z":0.0054967012256383896},"gravity":{"x":0.1570255309343338,"y":-0.86426776647567749,"z":-0.47789546847343445},"acceleration":{"x":0.0074027925729751587,"y":-0.0073731541633605957,"z":-0.00086557865142822266}},{"time":2.0009889166685753,"attitude":{"pitch":1.0450156661271532,"roll":0.31954983980606511,"yaw":-0.18570527548292157},"rotationRate":{"x":0.00092876143753528595,"y":0.0040739383548498154,"z":4.6920031309127808e-06},"gravity":{"x":0.1576627790927887,"y":-0.86493241786956787,"z":-0.47648113965988159},"acceleration":{"x":0.0018826425075531006,"y":-0.0054416060447692871,"z":0.0051203370094299316}},{"time":2.4011869166861288,"attitude":{"pitch":1.0461987692588266,"roll":0.3181737636193479,"yaw":-0.18262407628329522},"rotationRate":{"x":0.0075536239892244339,"y":0.0049536135047674179,"z":0.00091400952078402042},"gravity":{"x":0.15668673813343048,"y":-0.86552560329437256,"z":-0.47572541236877441},"acceleration":{"x":0.0076346695423126221,"y":0.0034525394439697266,"z":-0.0031276345252990723}},{"time":2.8013839166669641,"attitude":{"pitch":1.0472552617322031,"roll":0.31783706107760878,"yaw":-0.1805794025555004},"rotationRate":{"x":0.032815385609865189,"y":-0.0056185033172369003,"z":2.2497260943055153e-05},"gravity":{"x":0.15624071657657623,"y":-0.8660542368888855,"z":-0.47490930557250977},"acceleration":{"x":0.0041286945343017578,"y":0.0010055899620056152,"z":-0.0031501054763793945}},{"time":3.2015825000125915,"attitude":{"pitch":1.0501042986539519,"roll":0.3192335829076251,"yaw":-0.18108436665712194},"rotationRate":{"x":0.0025552203878760338,"y":0.0027054729871451855,"z":0.0018022877629846334},"gravity":{"x":0.15612877905368805,"y":-0.86747509241104126,"z":-0.4723459780216217},"acceleration":{"x":-0.0012067854404449463,"y":-0.0075526237487792969,"z":0.00075614452362060547}},{"time":3.6017795000225306,"attitude":{"pitch":1.051740389696278,"roll":0.32125731691169807,"yaw":-0.18473247100925852},"rotationRate":{"x":-0.0056520262733101845,"y":-0.012583634816110134,"z":0.0019613925833255053},"gravity":{"x":0.15663598477840424,"y":-0.86828786134719849,"z":-0.47068169713020325},"acceleration":{"x":0.0043285191059112549,"y":-0.012614667415618896,"z":0.0049055814743041992}},{"time":4.0019758749986067,"attitude":{"pitch":1.0555742738969356,"roll":0.31912179279954783,"yaw":-0.18201462895032547},"rotationRate":{"x":0.024730145931243896,"y":0.0022274688817560673,"z":0.013614434748888016},"gravity":{"x":0.15458494424819946,"y":-0.87018334865570068,"z":-0.46785083413124084},"acceleration":{"x":0.0074018239974975586,"y":-0.0013499855995178223,"z":-0.0052497386932373047}},{"time":4.4021738750161603,"attitude":{"pitch":1.0589810002583162,"roll":0.32092163056112832,"yaw":-0.18229148746813301},"rotationRate":{"x":-0.012278137728571892,"y":-0.013247760944068432,"z":-0.019452247768640518},"gravity":{"x":0.15449076890945435,"y":-0.87185686826705933,"z":-0.46475610136985779},"acceleration":{"x":0.0032843947410583496,"y":-0.0063129663467407227,"z":0.0072341561317443848}},{"time":4.8023708749969956,"attitude":{"pitch":1.0606400540016128,"roll":0.3261808397436462,"yaw":-0.1866199248349554},"rotationRate":{"x":0.0049770493060350418,"y":-0.0079132486134767532,"z":0.015740511938929558},"gravity":{"x":0.15646912157535553,"y":-0.87266820669174194,"z":-0.46256619691848755},"acceleration":{"x":0.0023588687181472778,"y":-0.0017781853675842285,"z":0.00089359283447265625}},{"time":5.2025678750069346,"attitude":{"pitch":1.0608980134263495,"roll":0.32293941477345378,"yaw":-0.18465769450648256},"rotationRate":{"x":0.0059027639217674732,"y":-0.0033954628743231297,"z":0.010470153763890266},"gravity":{"x":0.15489745140075684,"y":-0.87279415130615234,"z":-0.46285739541053772},"acceleration":{"x":0.00040581822395324707,"y":-0.00061517953872680664,"z":0.0023142695426940918}}]
```
