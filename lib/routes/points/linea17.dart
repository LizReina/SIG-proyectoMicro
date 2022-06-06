import 'package:google_maps_flutter/google_maps_flutter.dart';

List<LatLng> linea17I = [
  const LatLng(-17.7906686, -63.1720837),
  const LatLng(-17.79036649, -63.17179828),
  const LatLng(-17.79002732, -63.17156335),
  const LatLng(-17.78965184, -63.171399),
  const LatLng(-17.789261, -63.17128194),
  const LatLng(-17.78885483, -63.17125417),
  const LatLng(-17.7884479, -63.17127598),
  const LatLng(-17.78804471, -63.17133659),
  const LatLng(-17.78764168, -63.17139957),
  const LatLng(-17.78723836, -63.17146047),
  const LatLng(-17.78683501, -63.17152121),
  const LatLng(-17.78643168, -63.17158202),
  const LatLng(-17.78602837, -63.171643),
  const LatLng(-17.78563017, -63.17166486),
  const LatLng(-17.78526392, -63.17174627),
  const LatLng(-17.78486147, -63.17181315),
  const LatLng(-17.78445832, -63.17187527),
  const LatLng(-17.78405515, -63.17193721),
  const LatLng(-17.78365267, -63.17200391),
  const LatLng(-17.78324871, -63.17205665),
  const LatLng(-17.78286703, -63.17204056),
  const LatLng(-17.78251025, -63.17218722),
  const LatLng(-17.782108, -63.17225535),
  const LatLng(-17.78170355, -63.17230563),
  const LatLng(-17.7812993, -63.1723594),
  const LatLng(-17.78089505, -63.17241317),
  const LatLng(-17.78049118, -63.17246999),
  const LatLng(-17.7800874, -63.17252743),
  const LatLng(-17.77968372, -63.17258573),
  const LatLng(-17.77928118, -63.1726513),
  const LatLng(-17.77888263, -63.1727399),
  const LatLng(-17.77848543, -63.17283467),
  const LatLng(-17.77809389, -63.17282721),
  const LatLng(-17.77772799, -63.17300199),
  const LatLng(-17.77733732, -63.17312259),
  const LatLng(-17.77696141, -63.17328583),
  const LatLng(-17.77660512, -63.17348971),
  const LatLng(-17.77628349, -63.17375075),
  const LatLng(-17.77598671, -63.17404076),
  const LatLng(-17.77571025, -63.17435311),
  const LatLng(-17.77540757, -63.17461423),
  const LatLng(-17.7753135, -63.17500266),
  const LatLng(-17.77514745, -63.17539087),
  const LatLng(-17.77499692, -63.17578613),
  const LatLng(-17.7748658, -63.17618864),
  const LatLng(-17.77475815, -63.1765988),
  const LatLng(-17.77466144, -63.17701194),
  const LatLng(-17.77458497, -63.17742968),
  const LatLng(-17.77452751, -63.17785024),
  const LatLng(-17.7744908, -63.17827378),
  const LatLng(-17.77447524, -63.17869882),
  const LatLng(-17.77446854, -63.17912406),
  const LatLng(-17.77447279, -63.17954929),
  const LatLng(-17.77448834, -63.17997432),
  const LatLng(-17.77450743, -63.18039918),
  const LatLng(-17.77452409, -63.18082417),
  const LatLng(-17.77458222, -63.18124465),
  const LatLng(-17.77466482, -63.18166117),
  const LatLng(-17.77474374, -63.18207846),
  const LatLng(-17.77485702, -63.18248681),
  const LatLng(-17.77498112, -63.18289196),
  const LatLng(-17.77510371, -63.18329758),
  const LatLng(-17.77522943, -63.18370208),
  const LatLng(-17.77535829, -63.18410561),
  const LatLng(-17.77548594, -63.18450955),
  const LatLng(-17.77561559, -63.18491275),
  const LatLng(-17.77573947, -63.18531797),
  const LatLng(-17.77586336, -63.18572319),
  const LatLng(-17.77602489, -63.18611249),
  const LatLng(-17.77622104, -63.18648451),
  const LatLng(-17.77644913, -63.18683634),
  const LatLng(-17.77670145, -63.18717031),
  const LatLng(-17.77698419, -63.18747596),
  const LatLng(-17.77729694, -63.18774811),
  const LatLng(-17.77762789, -63.1879954),
  const LatLng(-17.77797624, -63.18821577),
  const LatLng(-17.77833855, -63.18840978),
  const LatLng(-17.77872218, -63.188553),
  const LatLng(-17.77910968, -63.18868436),
  const LatLng(-17.77950114, -63.18880201),
  const LatLng(-17.77989966, -63.18888894),
  const LatLng(-17.78030333, -63.18894725),
  const LatLng(-17.78070888, -63.18898764),
  const LatLng(-17.78111505, -63.18901749),
  const LatLng(-17.78152247, -63.1890137),
  const LatLng(-17.78192988, -63.18900434),
  const LatLng(-17.78233734, -63.18899926),
  const LatLng(-17.78274484, -63.18900243),
  const LatLng(-17.78315235, -63.18900559),
  const LatLng(-17.78355987, -63.18900605),
  const LatLng(-17.78396739, -63.189006),
  const LatLng(-17.78436242, -63.18908839),
  const LatLng(-17.78474364, -63.18900233),
  const LatLng(-17.78515109, -63.18899897),
  const LatLng(-17.78555765, -63.18897451),
  const LatLng(-17.78595937, -63.18890317),
  const LatLng(-17.7863544, -63.18879944),
  const LatLng(-17.78674202, -63.18866878),
  const LatLng(-17.78712945, -63.18853743),
  const LatLng(-17.78751368, -63.18839567),
  const LatLng(-17.78789776, -63.18825351),
  const LatLng(-17.78827841, -63.18810161),
  const LatLng(-17.78866034, -63.18795334),
  const LatLng(-17.78904264, -63.18780605),
  const LatLng(-17.78943815, -63.18771528),
  const LatLng(-17.7898017, -63.18755136),
  const LatLng(-17.79020528, -63.18749239),
  const LatLng(-17.79060887, -63.18743346),
  const LatLng(-17.79101287, -63.18737769),
  const LatLng(-17.79141688, -63.18732193),
  const LatLng(-17.79182096, -63.1872668),
  const LatLng(-17.79222513, -63.18721242),
  const LatLng(-17.79262821, -63.18714988),
  const LatLng(-17.79303317, -63.18710441),
  const LatLng(-17.7934054, -63.18715463),
  const LatLng(-17.79340011, -63.18679651),
  const LatLng(-17.79330349, -63.18639944),
  const LatLng(-17.79323662, -63.18597982),
  const LatLng(-17.7931731, -63.18555964),
  const LatLng(-17.7931136, -63.18513881),
  const LatLng(-17.79305049, -63.18471856),
  const LatLng(-17.79298556, -63.1842986),
  const LatLng(-17.79291735, -63.18387921),
  const LatLng(-17.79284914, -63.18345982),
  const LatLng(-17.79278093, -63.18304043),
  const LatLng(-17.79271368, -63.18262088),
  const LatLng(-17.79264014, -63.18220247),
  const LatLng(-17.79256635, -63.18178411),
  const LatLng(-17.79249454, -63.18136541),
  const LatLng(-17.79242517, -63.18094624),
  const LatLng(-17.79235415, -63.18052736),
  const LatLng(-17.79228572, -63.18010802),
  const LatLng(-17.79221763, -63.17968861),
  const LatLng(-17.79215081, -63.17926898),
  const LatLng(-17.79208491, -63.17884919),
  const LatLng(-17.79201901, -63.1784294),
  const LatLng(-17.79195311, -63.17800961),
  const LatLng(-17.79188127, -63.17762046),
  const LatLng(-17.79181448, -63.17720083),
  const LatLng(-17.79174769, -63.17678119),
  const LatLng(-17.79168251, -63.17636128),
  const LatLng(-17.79161822, -63.17594122),
  const LatLng(-17.79154969, -63.1755219),
  const LatLng(-17.79147916, -63.17510293),
  const LatLng(-17.79140864, -63.17468396),
  const LatLng(-17.79133782, -63.17426505),
  const LatLng(-17.79126624, -63.17384627),
  const LatLng(-17.79134839, -63.17345661),
  const LatLng(-17.79163248, -63.17319298),
  const LatLng(-17.79146222, -63.17284568),
  const LatLng(-17.79113682, -63.17263328),
  const LatLng(-17.7908711, -63.172311),
];
List<LatLng> linea17V = [
  const LatLng(-17.7913022, -63.1728197),
  const LatLng(-17.79105479, -63.17310231),
  const LatLng(-17.79111268, -63.17351341),
  const LatLng(-17.79117378, -63.1739245),
  const LatLng(-17.79123771, -63.17433516),
  const LatLng(-17.79130545, -63.17474515),
  const LatLng(-17.79137401, -63.17515499),
  const LatLng(-17.79144256, -63.17556484),
  const LatLng(-17.79150993, -63.1759749),
  const LatLng(-17.79157511, -63.17638534),
  const LatLng(-17.79164182, -63.17679551),
  const LatLng(-17.79171121, -63.17720521),
  const LatLng(-17.79177633, -63.17761499),
  const LatLng(-17.79184094, -63.17799171),
  const LatLng(-17.79190767, -63.17840189),
  const LatLng(-17.79197381, -63.17881216),
  const LatLng(-17.79203775, -63.17922282),
  const LatLng(-17.79210257, -63.17963332),
  const LatLng(-17.79216988, -63.1800434),
  const LatLng(-17.79223718, -63.18045347),
  const LatLng(-17.79230321, -63.18086377),
  const LatLng(-17.7923691, -63.1812741),
  const LatLng(-17.79243973, -63.18168356),
  const LatLng(-17.79251137, -63.18209283),
  const LatLng(-17.79258301, -63.1825021),
  const LatLng(-17.79264988, -63.18291224),
  const LatLng(-17.79271367, -63.18332293),
  const LatLng(-17.79277698, -63.18373369),
  const LatLng(-17.79283979, -63.18414455),
  const LatLng(-17.79290099, -63.18455566),
  const LatLng(-17.7929611, -63.18496695),
  const LatLng(-17.79301841, -63.18537868),
  const LatLng(-17.79307525, -63.18579047),
  const LatLng(-17.79313654, -63.18620157),
  const LatLng(-17.79318741, -63.18661337),
  const LatLng(-17.79298957, -63.18689236),
  const LatLng(-17.79259485, -63.18694988),
  const LatLng(-17.7921991, -63.18699929),
  const LatLng(-17.7918028, -63.18704355),
  const LatLng(-17.79140739, -63.18709546),
  const LatLng(-17.79101257, -63.18715244),
  const LatLng(-17.79061776, -63.18720942),
  const LatLng(-17.79022264, -63.18726401),
  const LatLng(-17.78982985, -63.1873339),
  const LatLng(-17.78944094, -63.18741645),
  const LatLng(-17.78908767, -63.18757202),
  const LatLng(-17.78871096, -63.1877079),
  const LatLng(-17.78833801, -63.18785448),
  const LatLng(-17.78796547, -63.18800229),
  const LatLng(-17.7875896, -63.18814067),
  const LatLng(-17.78721372, -63.18827904),
  const LatLng(-17.78683761, -63.18841664),
  const LatLng(-17.78646064, -63.18855175),
  const LatLng(-17.78607812, -63.18866762),
  const LatLng(-17.78568445, -63.18872985),
  const LatLng(-17.7852883, -63.18877449),
  const LatLng(-17.78489051, -63.18879591),
  const LatLng(-17.78450807, -63.18871503),
  const LatLng(-17.78413553, -63.18879512),
  const LatLng(-17.78373727, -63.18880012),
  const LatLng(-17.7833387, -63.18879984),
  const LatLng(-17.78294014, -63.18879786),
  const LatLng(-17.78254158, -63.18879422),
  const LatLng(-17.78214303, -63.18879087),
  const LatLng(-17.78174446, -63.18879058),
  const LatLng(-17.78134589, -63.18879029),
  const LatLng(-17.78094736, -63.18879026),
  const LatLng(-17.78055292, -63.18873383),
  const LatLng(-17.78015932, -63.18866849),
  const LatLng(-17.77976339, -63.18862073),
  const LatLng(-17.77937094, -63.18855096),
  const LatLng(-17.77898819, -63.1884351),
  const LatLng(-17.77861133, -63.18829967),
  const LatLng(-17.77824154, -63.18814618),
  const LatLng(-17.77788677, -63.18795705),
  const LatLng(-17.77755856, -63.18772102),
  const LatLng(-17.77724816, -63.18746073),
  const LatLng(-17.77695533, -63.18717908),
  const LatLng(-17.77670425, -63.18685603),
  const LatLng(-17.77646407, -63.18652476),
  const LatLng(-17.77626118, -63.18616671),
  const LatLng(-17.77609438, -63.18578897),
  const LatLng(-17.77596143, -63.18539692),
  const LatLng(-17.77583048, -63.185004),
  const LatLng(-17.77569952, -63.18461109),
  const LatLng(-17.7755738, -63.18421633),
  const LatLng(-17.77545185, -63.18382027),
  const LatLng(-17.7753299, -63.18342421),
  const LatLng(-17.77521158, -63.18302702),
  const LatLng(-17.77509296, -63.18262986),
  const LatLng(-17.77497839, -63.18223144),
  const LatLng(-17.77489601, -63.18182473),
  const LatLng(-17.77482018, -63.18141633),
  const LatLng(-17.77474381, -63.18100803),
  const LatLng(-17.77471947, -63.18059336),
  const LatLng(-17.77470354, -63.18017769),
  const LatLng(-17.77468969, -63.17976194),
  const LatLng(-17.77467895, -63.17934608),
  const LatLng(-17.77466821, -63.17893022),
  const LatLng(-17.77467623, -63.17851447),
  const LatLng(-17.77469617, -63.17809906),
  const LatLng(-17.77474388, -63.1776861),
  const LatLng(-17.77481995, -63.17727789),
  const LatLng(-17.77489709, -63.17686977),
  const LatLng(-17.77498711, -63.17646463),
  const LatLng(-17.77510512, -63.17606734),
  const LatLng(-17.77524675, -63.17567863),
  const LatLng(-17.77540033, -63.17529475),
  const LatLng(-17.7756113, -63.17496224),
  const LatLng(-17.77577378, -63.17462268),
  const LatLng(-17.77601753, -63.17429357),
  const LatLng(-17.77629451, -63.17399589),
  const LatLng(-17.77660136, -63.17373051),
  const LatLng(-17.77694607, -63.17352335),
  const LatLng(-17.77730942, -63.17335359),
  const LatLng(-17.77768554, -63.17321626),
  const LatLng(-17.77807596, -63.17319032),
  const LatLng(-17.77843164, -63.17306101),
  const LatLng(-17.77882111, -63.17297279),
  const LatLng(-17.77921114, -63.17288714),
  const LatLng(-17.77960311, -63.17281374),
  const LatLng(-17.77999746, -63.17275338),
  const LatLng(-17.78039182, -63.17269302),
  const LatLng(-17.78078617, -63.17263267),
  const LatLng(-17.78118095, -63.17257549),
  const LatLng(-17.78157583, -63.17251899),
  const LatLng(-17.78197092, -63.1724642),
  const LatLng(-17.78236587, -63.17240825),
  const LatLng(-17.78276149, -63.17235804),
  const LatLng(-17.78312463, -63.17233827),
  const LatLng(-17.78349282, -63.17222487),
  const LatLng(-17.78388792, -63.17217015),
  const LatLng(-17.78428295, -63.17211478),
  const LatLng(-17.7846779, -63.17205882),
  const LatLng(-17.78507281, -63.1720026),
  const LatLng(-17.78545807, -63.17198788),
  const LatLng(-17.78581799, -63.17188147),
  const LatLng(-17.78621178, -63.17181752),
  const LatLng(-17.78660624, -63.17175795),
  const LatLng(-17.78700049, -63.17169688),
  const LatLng(-17.78739475, -63.17163581),
  const LatLng(-17.78778913, -63.17157573),
  const LatLng(-17.78818417, -63.17152049),
  const LatLng(-17.78857944, -63.17146757),
  const LatLng(-17.7889772, -63.17145962),
  const LatLng(-17.78936998, -63.17152616),
  const LatLng(-17.78974851, -63.17165465),
  const LatLng(-17.79009435, -63.17185731),
  const LatLng(-17.79040595, -63.17211468),
  const LatLng(-17.79067967, -63.17241711),
  const LatLng(-17.79095784, -63.17264114),
  const LatLng(-17.7908711, -63.172311),
];
