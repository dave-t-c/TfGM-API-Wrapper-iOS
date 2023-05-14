//
//  MapView.swift
//  LiveTramsMCR (iOS)
//  Created by shaundon (https://gist.github.com/shaundon/00be84deb3450e31db90a31d5d5b7adc)
//  Modified
//

import SwiftUI
import MapKit
import OrderedCollections

struct ExampleRouteCoordinates {
    static let exampleCoordinates: [[Double]] = [
        //"Piccadilly",
                    [ -2.230190776, 53.4769818218 ],
                                [ -2.2304092919, 53.4770298302 ],
                                [ -2.2315965814, 53.4772909127 ],
                                [ -2.231725691, 53.4773218429 ],
                                [ -2.2318373127, 53.477356402 ],
                                [ -2.2319301735, 53.4773904579 ],
                                [ -2.2319991638, 53.4774208749 ],
                                [ -2.2320782862, 53.4774665427 ],
                                [ -2.2321197205, 53.4774999789 ],
                                [ -2.2321634202, 53.4775427581 ],
                                [ -2.2322773226, 53.4777006816 ],
                                [ -2.2324544851, 53.4779761043 ],
                                [ -2.2325177309, 53.478046882 ],
                                [ -2.2325871566, 53.4780904129 ],
                                [ -2.2326751658, 53.4781211532 ],
                                [ -2.232775952, 53.4781518687 ],
                                [ -2.2328638675, 53.4781681468 ],
                                [ -2.2333820184, 53.4782792785 ],
                                [ -2.2335884731, 53.4783212028 ],
                                [ -2.2336619796, 53.4783365196 ],
                                [ -2.2337456017, 53.4783610656 ],
                                [ -2.2338001144, 53.4783801854 ],
                                [ -2.2338672425, 53.4784110554 ],
                                [ -2.2339618188, 53.4784630752 ],
                                [ -2.2340805323, 53.4785451588 ],
                                [ -2.2346444015, 53.4789706972 ],
                                [ -2.2350919469, 53.4793200866 ],
                                [ -2.235573291, 53.4796685085 ],
                                [ -2.2357655483, 53.4798172915 ],
                                [ -2.2358852616, 53.4798963148 ],
                                [ -2.2359289765, 53.479915994 ],
                                [ -2.2359884619, 53.4799346535 ],
                                [ -2.236070935, 53.4799549843 ],
                                [ -2.236175506, 53.4799713976 ],
                                [ -2.2362555689, 53.4799809471 ],
                                [ -2.236328318, 53.4799921288 ],
                                [ -2.236415245, 53.4800085767 ],
                                [ -2.2364886595, 53.4800310733 ],
                                [ -2.236578328, 53.4800690876 ],
                                [ -2.236987811, 53.4802724384 ],
                                [ -2.2374552773, 53.480510619 ],
                                [ -2.2375720234, 53.4805727482 ],
                                [ -2.237796668, 53.4806882153 ],
                                [ -2.2382160036, 53.4809161604 ],
                                [ -2.2382662269, 53.4809433759 ],
                                [ -2.2383155503, 53.4809659192 ],
                                [ -2.2383545146, 53.4809817508 ],
                    //"Delta junction east",
                    [ -2.2383545146, 53.4809817508 ],
                    [ -2.2383994528, 53.4809961325 ],
                    [ -2.2384342925, 53.481004593 ],
                    [ -2.2384830475, 53.4810143829 ],
                    [ -2.2385213403, 53.4810205984 ],
                    [ -2.2385700577, 53.4810236472 ],
                    [ -2.2386293176, 53.4810230797 ],
                    [ -2.2387004793, 53.4810194324 ],
                    [ -2.2387544785, 53.4810104263 ],
                    [ -2.2387953066, 53.4810011768 ],
                    [ -2.2388498788, 53.4809841789 ],
                    [ -2.2389161808, 53.4809549336 ],
                    //"Delta junction curve south to east of curve",
                    [ -2.2389161808, 53.4809549336 ],
                    [ -2.2389643081, 53.4809198821 ],
                    [ -2.2391839703, 53.4807664181 ],
                    [ -2.2392566054, 53.4807138803 ],
                    [ -2.2394774654, 53.4805540408 ],
                    [ -2.2396622175, 53.4804445805 ],
                    [ -2.2397970592, 53.4803879721 ],
                    [ -2.2399192437, 53.480331389 ],
                    [ -2.2400688899, 53.4802334137 ],
                    [ -2.2402783813, 53.4800839143 ],
                    [ -2.2407160506, 53.4797727611 ],
                    [ -2.2410978203, 53.4795082693 ],
                    [ -2.2416132143, 53.4791427781 ],
                    [ -2.2420386445, 53.4788436998 ],
                    [ -2.2422038436, 53.4787279073 ],
                    [ -2.2423057708, 53.4786705476 ],
                    [ -2.2426694808, 53.4785291101 ],
                    [ -2.2431081393, 53.4782182293 ],
                    [ -2.243771741, 53.4777478532 ],
                    [ -2.2438667295, 53.47767344 ],
                    [ -2.243919846, 53.4776179855 ],
                    [ -2.2439971785, 53.4775203378 ],
                    [ -2.2440680734, 53.4774460626 ],
                    [ -2.2441518836, 53.4773722198 ],
                    [ -2.2442349044, 53.477310683 ],
                    [ -2.2448780337, 53.4768486094 ],
                    [ -2.2452080364, 53.4766145966 ],
                    [ -2.245313846, 53.4765415978 ],
                    [ -2.2459203296, 53.4761255997 ],
                    [ -2.245950153, 53.476105415 ],
                    [ -2.2460273749, 53.4760530469 ],
                    [ -2.2462797934, 53.4759208147 ],
                    [ -2.24679663, 53.4756687991 ],
                    [ -2.24745443, 53.4753438869 ],
                    [ -2.2479419892, 53.4751018115 ],
                    [ -2.2483335713, 53.4749100659 ],
                    [ -2.2484798586, 53.4748376092 ],
                    [ -2.2485612752, 53.4748029367 ],
                    [ -2.2486521379, 53.4747681548 ],
                    [ -2.2487378289, 53.4747431805 ],
                    [ -2.2488307502, 53.4747205281 ],
                    [ -2.2489183695, 53.4747059668 ],
                    [ -2.2490060107, 53.4746951894 ],
                    [ -2.2490967679, 53.4746865536 ],
                    [ -2.2491873075, 53.4746819629 ],
                    [ -2.249356987, 53.474681613 ],
                    [ -2.2500607747, 53.4747110694 ],
                        [ -2.2503454594, 53.4747237826 ],
                   // "Deansgate",
                   // "Deansgate",
                [ -2.2503454594, 53.4747237826 ],
                [ -2.2510329833, 53.4747544265 ],
                [ -2.2510906308, 53.4747573628 ],
                [ -2.2514413082, 53.4747751495 ],
                [ -2.2517301645, 53.4748002455 ],
                [ -2.2537490707, 53.4749871496 ],
                [ -2.2541938879, 53.4750226085 ],
                [ -2.2543458813, 53.4750326164 ],
                [ -2.2548291168, 53.4750522719 ],
                [ -2.2552722573, 53.4750562807 ],
                [ -2.2554862653, 53.4750508852 ],
                [ -2.2570217217, 53.4749478834 ],
                [ -2.2572396425, 53.4749290917 ],
                [ -2.257462612, 53.4749055159 ],
                [ -2.2576937123, 53.4748710556 ],
                [ -2.2578950034, 53.4748380067 ],
                [ -2.2581653343, 53.4747780335 ],
                [ -2.2585013746, 53.4746961761 ],
                [ -2.2603597703, 53.4741763001 ],
                [ -2.2615328152, 53.4738482998 ],
                [ -2.2617310223, 53.47380015 ],
                [ -2.2622418291, 53.4736783608 ],
                [ -2.2624735259, 53.4736201685 ],
                [ -2.2627020642, 53.473553174 ],
                [ -2.2629781485, 53.4734611862 ],
                [ -2.263196288, 53.4733817195 ],
                [ -2.2641158511, 53.4729697706 ],
                [ -2.2644806302, 53.4727986027 ],
                [ -2.2647177104, 53.4726694928 ],
                [ -2.2648940106, 53.472554628 ],
                [ -2.2650878858, 53.4724096128 ],
                [ -2.265184136, 53.4723259249 ],
                [ -2.2653482584, 53.4721694786 ],
                [ -2.2654811663, 53.4720281025 ],
                [ -2.2655800969, 53.4719178114 ],
                [ -2.2660468276, 53.4714030529 ],
                [ -2.2665977327, 53.4707870201 ],
                [ -2.2668431441, 53.4705620057 ],
                [ -2.2671523572, 53.4703110604 ],
                [ -2.2675495027, 53.4700194787 ],
                [ -2.2677815827, 53.4698492221 ],
                [ -2.2681604599, 53.4695768148 ],
                [ -2.2686207838, 53.4692200369 ],
                [ -2.2687762539, 53.469114999 ],
                [ -2.2688546329, 53.4690571349 ],
                [ -2.269009906, 53.4689210058 ],
                [ -2.2691932646, 53.4687476186 ],
                [ -2.2694314587, 53.4685651996 ],
                [ -2.2696196231, 53.4684449948 ],
                [ -2.2698477033, 53.4683122954 ],
                [ -2.2700447529, 53.4682039348 ],
                [ -2.2701248275, 53.468159899 ],
                [ -2.2702171558, 53.4681073954 ],
                [ -2.2703477652, 53.468019669 ],
                [ -2.2704638521, 53.4679343032 ],
                [ -2.2705604316, 53.4678467433 ],
                [ -2.2706391101, 53.4677585047 ],
                [ -2.2706739326, 53.4677076586 ],
                [ -2.2707082843, 53.4676586023 ],
                [ -2.2707621883, 53.4675404967 ],
                [ -2.2708057485, 53.4673994936 ],
                [ -2.2708170791, 53.4673048454 ],
                [ -2.2708174435, 53.4672458976 ],
                [ -2.270804224, 53.4669023937 ],
                [ -2.2707929774, 53.4665801793 ],
                [ -2.2707991294, 53.4664124029 ],
                [ -2.2708195763, 53.4662303024 ],
                [ -2.2708589035, 53.4660277551 ],
                [ -2.2709170553, 53.4658150172 ],
                [ -2.2709925086, 53.4656108601 ],
                [ -2.27107508, 53.4654318548 ],
                [ -2.2712019318, 53.4652022425 ],
                [ -2.271340666, 53.4649890522 ],
                [ -2.2715143144, 53.4647591538 ],
                [ -2.2716598273, 53.4645938478 ],
                [ -2.2718901294, 53.4643671461 ],
                [ -2.2720321768, 53.464244705 ],
                [ -2.2721069364, 53.4641859478 ],
                [ -2.2721904922, 53.4641224065 ],
                [ -2.2723674439, 53.4639819086 ],
                [ -2.2725805388, 53.4638238993 ],
                [ -2.2726946532, 53.4637434885 ],
                [ -2.2728148668, 53.4636653019 ],
                [ -2.2730726903, 53.4635089876 ],
                [ -2.2733859455, 53.4633414003 ],
                [ -2.2735304253, 53.463270717 ],
                [ -2.2737349898, 53.4631766158 ],
                [ -2.2738908073, 53.4631101217 ],
                [ -2.274143646, 53.4630114151 ],
                [ -2.2746338245, 53.4628380264 ],
                [ -2.2752600956, 53.4626214654 ],
                [ -2.2759032066, 53.4623616364 ],
                [ -2.2769044384, 53.4619244948 ],
                [ -2.2772539486, 53.4617587999 ],
                [ -2.2775130765, 53.4616359822 ],
                [ -2.2781151361, 53.4613307719 ],
                [ -2.2782568416, 53.4612549568 ],
                [ -2.2786576437, 53.4610364745 ],
                [ -2.2789622816, 53.4608654858 ],
                [ -2.2794423913, 53.4605825657 ],
                [ -2.2795913001, 53.4604896628 ],
                [ -2.2796599421, 53.4604469057 ],
                [ -2.2798656024, 53.4603172954 ],
                [ -2.2799175465, 53.4602846444 ],
                [ -2.280162429, 53.4601303222 ],
                [ -2.2804656899, 53.4599235672 ],
                [ -2.2807285953, 53.4597369416 ],
                [ -2.2810944025, 53.4594687453 ],
                [ -2.2813998222, 53.4592321497 ],
                [ -2.2816858082, 53.459006736 ],
                [ -2.2820336147, 53.4587194423 ],
                [ -2.2823179521, 53.4584712089 ],
                [ -2.2826149533, 53.4582026306 ],
                [ -2.2834055899, 53.4574542064 ],
                [ -2.283960486, 53.4569452705 ],
                [ -2.2844137496, 53.4565572631 ],
                [ -2.2847439573, 53.456283477 ],
                [ -2.2850068072, 53.4560743794 ],
                [ -2.2853142352, 53.455829679 ],
                [ -2.2858421197, 53.4554271964 ],
                [ -2.2863521157, 53.4550631158 ],
                [ -2.2866980738, 53.4548272158 ],
                [ -2.2870322983, 53.4546005022 ],
                [ -2.2875766115, 53.4542465785 ],
                [ -2.2880918227, 53.4539240837 ],
                [ -2.2882606928, 53.4538145005 ],
                [ -2.2886179543, 53.453600931 ],
                [ -2.2888918989, 53.4534418442 ],
                [ -2.2894397094, 53.4531330171 ],
                [ -2.2900273043, 53.4528142032 ],
                [ -2.2905813035, 53.4525232429 ],
                [ -2.2910348228, 53.4522982048 ],
                [ -2.291727097, 53.4519687902 ],
                [ -2.2926204918, 53.4515645696 ],
                [ -2.2929653771, 53.4514165351 ],
                [ -2.2936955688, 53.4511157702 ],
                [ -2.2939633761, 53.4510087217 ],
                [ -2.2944888989, 53.4508056856 ],
                [ -2.2952486097, 53.4505219167 ],
                [ -2.2955543558, 53.4504084787 ],
                [ -2.296087291, 53.4502212371 ],
                [ -2.2964820412, 53.4500886997 ],
                [ -2.2974632146, 53.4497693194 ],
                [ -2.2977750812, 53.4496628624 ],
                [ -2.2978027062, 53.4496556026 ],
                [ -2.2982175777, 53.4495080071 ],
                [ -2.2986497386, 53.4493462547 ],
                [ -2.2990365952, 53.4491897378 ],
                [ -2.2993401208, 53.4490630822 ],
                [ -2.2997223975, 53.4488897747 ],
                [ -2.2998706313, 53.4488184102 ],
                [ -2.3002020374, 53.4486510626 ],
                [ -2.3004164177, 53.448541527 ],
                [ -2.3007293235, 53.4483733257 ],
                [ -2.3012253743, 53.4480873048 ],
                [ -2.3013834666, 53.4479890446 ],
                [ -2.3017287487, 53.4477684589 ],
                [ -2.3019512564, 53.4476157609 ],
                [ -2.3022285814, 53.4474055036 ],
                [ -2.3024440162, 53.447236823 ],
                [ -2.3026100008, 53.4470994494 ],
                [ -2.3028703219, 53.4468723444 ],
                [ -2.3035481124, 53.446259738 ],
                [ -2.3038078823, 53.4460264212 ],
                [ -2.304152891, 53.4457165092 ],
                [ -2.3043868453, 53.4454847942 ],
                [ -2.3046201528, 53.4452492963 ],
                [ -2.3048434431, 53.4450028665 ],
                [ -2.3050722193, 53.4447428493 ],
                [ -2.3053723892, 53.4443634949 ],
                [ -2.3055644257, 53.4441036701 ],
                [ -2.3057269554, 53.4438674532 ],
                [ -2.3058892058, 53.4436093135 ],
                [ -2.3060514356, 53.4433317671 ],
                [ -2.3061267168, 53.4431836653 ],
                [ -2.3062565168, 53.4429188672 ],
                [ -2.3063037735, 53.4428097492 ],
                [ -2.3064291555, 53.4425170167 ],
                [ -2.3065040313, 53.4423149029 ],
                [ -2.3066510116, 53.4418835547 ],
                [ -2.3067699405, 53.4415063722 ],
                [ -2.306962345, 53.4409050659 ],
                [ -2.3071506023, 53.4403139271 ],
                [ -2.307340243, 53.4397253912 ],
                [ -2.3077399215, 53.4385400858 ],
                [ -2.3081544342, 53.4373484395 ],
                [ -2.3086030776, 53.4359902066 ],
                [ -2.3090734261, 53.4344966633 ],
                [ -2.3093611899, 53.4336019853 ],
                [ -2.309472253, 53.433292397 ],
                [ -2.3096500908, 53.4328491893 ],
                [ -2.3097817464, 53.432573776 ],
                [ -2.3098961164, 53.4323453284 ],
                [ -2.3100191226, 53.4321270063 ],
                [ -2.3101574015, 53.4318917457 ],
                [ -2.3102875767, 53.4316868876 ],
                [ -2.3103883658, 53.4315370895 ],
                [ -2.3105970332, 53.4312399195 ],
                [ -2.3108127438, 53.4309554856 ],
                [ -2.310988158, 53.430742868 ],
                [ -2.3111620014, 53.4305379755 ],
                [ -2.3113599196, 53.4303160402 ],
                [ -2.3116614149, 53.4300039735 ],
                [ -2.3117404778, 53.4299221763 ],
                [ -2.3118936116, 53.4297696419 ],
                [ -2.312140866, 53.4295408343 ],
                [ -2.3123074686, 53.4293988616 ],
                [ -2.3126211014, 53.4291369082 ],
                [ -2.3129883518, 53.4288605118 ],
                [ -2.313426062, 53.4285475425 ],
                [ -2.3144496089, 53.4278705293 ],
                [ -2.3149028824, 53.4275668526 ],
                [ -2.3153335606, 53.4272631531 ],
                [ -2.3159780953, 53.4268009983 ],
                [ -2.3164394784, 53.4264574924 ],
                [ -2.3168446715, 53.4261497115 ],
                [ -2.3174423437, 53.4256655705 ],
                [ -2.317873243, 53.4253117135 ],
                [ -2.3185324949, 53.4247361854 ],
                [ -2.3188865899, 53.4244191952 ],
                [ -2.3191394411, 53.4241853331 ],
                [ -2.3194049762, 53.4239395714 ],
                [ -2.3197075926, 53.4236425726 ],
                [ -2.3200839393, 53.4232680081 ],
                [ -2.3205962255, 53.4227402234 ],
                [ -2.3211689576, 53.4221522378 ],
                [ -2.3217289197, 53.4215668998 ],
                [ -2.3224166764, 53.4208543287 ],
                [ -2.3231030684, 53.420145254 ],
                [ -2.3237036243, 53.4195207949 ],
                [ -2.3244517506, 53.4187438869 ],
                [ -2.3249975975, 53.4181754624 ],
                [ -2.3256375028, 53.4175112554 ],
                [ -2.3258297473, 53.417312942 ],
                [ -2.3260595267, 53.4170730157 ],
                [ -2.3264106388, 53.4167063123 ],
                [ -2.3277373535, 53.4153317471 ],
                [ -2.3285181859, 53.4145212966 ],
                [ -2.3292547936, 53.4137579597 ],
                [ -2.3300461102, 53.4129352498 ],
                [ -2.3305692706, 53.4123887906 ],
                [ -2.3313465726, 53.4115889425 ],
                [ -2.331761813, 53.411156817 ],
                [ -2.3321279574, 53.4107764041 ],
                [ -2.3324884343, 53.4104011295 ],
                [ -2.3331898005, 53.4096699489 ],
                [ -2.334425455, 53.4083862455 ],
                [ -2.3355861163, 53.4071810061 ],
                [ -2.3364473159, 53.4062879682 ],
                [ -2.3367784796, 53.4059470028 ],
                [ -2.3372174918, 53.4054914275 ],
                [ -2.3377732048, 53.4049138665 ],
                [ -2.338153737, 53.4045159664 ],
                [ -2.3384036505, 53.4042544039 ],
                [ -2.3386796352, 53.4039656217 ],
                [ -2.3388126968, 53.4038255094 ],
                [ -2.3390921784, 53.4035402218 ],
                [ -2.3394314467, 53.4031801863 ],
                [ -2.3396294914, 53.4029627043 ],
                [ -2.3398280951, 53.402753301 ],
                [ -2.3402129412, 53.4023110868 ],
                [ -2.3404136767, 53.4020588196 ],
                [ -2.3405673926, 53.40185135 ],
                [ -2.3406954843, 53.4016801677 ],
                [ -2.3408305107, 53.4014924178 ],
                [ -2.3410238663, 53.4012192366 ],
                [ -2.3411705072, 53.4009967757 ],
                [ -2.3413473327, 53.4007034263 ],
                [ -2.3414957533, 53.400470803 ],
                [ -2.3417725106, 53.4000203544 ],
                [ -2.3419437152, 53.3996930529 ],
                [ -2.3420457339, 53.3994885969 ],
                [ -2.3422295481, 53.3990936838 ],
                [ -2.3423440158, 53.3988350994 ],
                [ -2.3424483404, 53.3985646883 ],
                [ -2.3425839679, 53.3982077364 ],
                [ -2.3426862735, 53.3979167473 ],
                [ -2.3428020865, 53.3975480862 ],
                [ -2.3429368239, 53.3970836707 ],
                [ -2.3430515784, 53.3966906537 ],
                [ -2.3431623866, 53.3963194895 ],
                [ -2.3433163641, 53.3957955321 ],
                [ -2.3434570085, 53.3953247167 ],
                [ -2.3436202519, 53.3948594897 ],
                [ -2.3437563834, 53.3945080265 ],
                [ -2.3438656238, 53.3942027245 ],
                [ -2.3439764431, 53.3939235742 ],
                [ -2.3441426743, 53.393507316 ],
                [ -2.3444606902, 53.3928042471 ],
                [ -2.3446873282, 53.3923321031 ],
                [ -2.3449795737, 53.3917701811 ],
                [ -2.3452081261, 53.3913665046 ],
                [ -2.3453669198, 53.3910736416 ],
                [ -2.3455563363, 53.3907359452 ],
                [ -2.3456955605, 53.390477825 ],
                [ -2.3458850648, 53.390136802 ],
                [ -2.346199912, 53.3895679798 ],
                [ -2.3463405242, 53.3893132701 ],
                [ -2.3466985331, 53.38867342 ],
                [ -2.3468752785, 53.3883663994 ],
                [ -2.3469674752, 53.3881952156 ],
                [ -2.3471239327, 53.3879229401 ],
                [ -2.3472615519, 53.3876822598 ],
                [ -2.3474353138, 53.3873591558 ],
                [ -2.3475158907, 53.3872091274 ],
                [ -2.3476652236, 53.3869308481 ]


    ]
}

struct MapView: UIViewRepresentable {
    
    let region: MKCoordinateRegion
    let lineCoordinatesFromOrigin: OrderedDictionary<String, CLLocationCoordinate2D>
    var lineCoordinatesFromInterchange: OrderedDictionary<String, CLLocationCoordinate2D>? = nil
    let lineColorFromOrigin: Color
    var lineColorFromInterchange: Color? = nil
    @Environment(\.colorScheme) private var displayMode
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        mapView.preferredConfiguration = MKStandardMapConfiguration(emphasisStyle: .muted)
        
        var testCoordinates: [CLLocationCoordinate2D] = []
        for coordinate in ExampleRouteCoordinates.exampleCoordinates {
            testCoordinates.append(CLLocationCoordinate2D(latitude: coordinate[1], longitude: coordinate[0]))
        }
        let testPolyline = RoutePolyline(coordinates: testCoordinates, count: testCoordinates.count)
        testPolyline.routeColor = .purple
        
        
        var stopAnnotations: [StopAnnotation] = []
        var routePolylines: [RoutePolyline] = []
        let polyline = RoutePolyline(coordinates: testCoordinates, count: testCoordinates.count)
        polyline.routeColor = UIColor(lineColorFromOrigin)
        routePolylines.append(polyline)
        routePolylines.append(testPolyline)
        for (index, stop) in lineCoordinatesFromOrigin.keys.enumerated() {
            let annotation = StopAnnotation()
            if index == 0 {
                annotation.subtitle = "Start"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange != nil{
                annotation.subtitle = "Change here"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange == nil{
                annotation.subtitle = "Destination"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            annotation.stopColor = displayMode == .dark ? .white : .black
            annotation.coordinate = lineCoordinatesFromOrigin[stop]!
            annotation.title = stop
            stopAnnotations.append(annotation)
        }
        
        if (lineCoordinatesFromInterchange != nil && lineColorFromInterchange != nil) {
            let polylineFromInterchange = RoutePolyline(coordinates: lineCoordinatesFromInterchange!.map {$0.value}, count: lineCoordinatesFromInterchange!.count)
            polylineFromInterchange.routeColor = UIColor(lineColorFromInterchange!)
            routePolylines.append(polylineFromInterchange)
            
            for (index, stop) in lineCoordinatesFromInterchange!.keys.enumerated() {
                if index == 0 {
                    continue
                }
                
                let annotation = StopAnnotation()
                
                if index == lineCoordinatesFromInterchange!.keys.count - 1 {
                    annotation.subtitle = "Destination"
                    annotation.stopSize = CGSize(width: 30, height: 30)
                }
                 
                annotation.stopColor = displayMode == .dark ? .white : .black
                annotation.coordinate = lineCoordinatesFromInterchange![stop]!
                annotation.title = stop
                stopAnnotations.append(annotation)
            }
        }
        
        mapView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 100, right: 100)
        mapView.addOverlays(routePolylines)
        mapView.addAnnotations(stopAnnotations)
        mapView.region = region
        mapView.setRegion(region, animated: true)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.region = region
        
        view.overlays.forEach {
            view.removeOverlay($0)
        }
        
        view.annotations.forEach {
            view.removeAnnotation($0)
        }
        
        let testCoordinates = ExampleRouteCoordinates.exampleCoordinates.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0])}
        let testPolyline = RoutePolyline(coordinates: testCoordinates, count: testCoordinates.count)
        testPolyline.routeColor = .purple
        var stopAnnotations: [StopAnnotation] = []
        var routePolylines: [RoutePolyline] = []
        let polyline = RoutePolyline(coordinates: lineCoordinatesFromOrigin.map {$0.value}, count: lineCoordinatesFromOrigin.count)
        polyline.routeColor = UIColor(lineColorFromOrigin)
        routePolylines.append(polyline)
        routePolylines.append(testPolyline)
        for (index, stop) in lineCoordinatesFromOrigin.keys.enumerated() {
            let annotation = StopAnnotation()
            if index == 0 {
                annotation.subtitle = "Start"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange != nil{
                annotation.subtitle = "Change here"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange == nil{
                annotation.subtitle = "Destination"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            annotation.stopColor = displayMode == .dark ? .white : .black
            annotation.coordinate = lineCoordinatesFromOrigin[stop]!
            annotation.title = stop
            stopAnnotations.append(annotation)
        }
        
        if (lineCoordinatesFromInterchange != nil && lineColorFromInterchange != nil) {
            let polylineFromInterchange = RoutePolyline(coordinates: lineCoordinatesFromInterchange!.map {$0.value}, count: lineCoordinatesFromInterchange!.count)
            polylineFromInterchange.routeColor = UIColor(lineColorFromInterchange!)
            routePolylines.append(polylineFromInterchange)
            
            
            for (index, stop) in lineCoordinatesFromInterchange!.keys.enumerated() {
                if index == 0 {
                    continue
                }
                
                let annotation = StopAnnotation()
                if index == lineCoordinatesFromInterchange!.keys.count - 1 {
                    annotation.subtitle = "Destination"
                    annotation.stopSize = CGSize(width: 30, height: 30)
                }
                    
                annotation.stopColor = displayMode == .dark ? .white : .black
                annotation.coordinate = lineCoordinatesFromInterchange![stop]!
                annotation.title = stop
                stopAnnotations.append(annotation)
                
            }
        }
        
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 100, right: 100)
        view.addOverlays(routePolylines)
        view.addAnnotations(stopAnnotations)
        view.region = region
        view.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(_ parent: MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let routePolyline = overlay as? RoutePolyline
            let renderer = MKPolylineRenderer(polyline: routePolyline!)
            renderer.strokeColor = routePolyline!.routeColor
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is StopAnnotation {
            let annotation = annotation as? StopAnnotation
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: UUID().uuidString)
            annotationView.canShowCallout = true
            annotationView.image = UIImage(systemName: "smallcircle.filled.circle")?.withTintColor(annotation!.stopColor)
            annotationView.image = UIGraphicsImageRenderer(size: annotation!.stopSize).image {
                 _ in annotationView.image!.draw(in:CGRect(origin: .zero, size: annotation!.stopSize))
            }
            return annotationView
        }
        

        return nil
    }
}

class RoutePolyline: MKPolyline {
    var routeColor: UIColor = UIColor.clear
}

class StopAnnotation: MKPointAnnotation {
    var stopColor: UIColor = .white
    var stopSize: CGSize = CGSize(width: 15, height: 15)
}
