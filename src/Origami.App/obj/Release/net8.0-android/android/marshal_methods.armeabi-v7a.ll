; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [127 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [254 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 117
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 57
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 113106019, ; 6: Origami.App.dll => 0x6bddc63 => 87
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 110
	i32 136584136, ; 8: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 9: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 62
	i32 169828938, ; 11: Origami.WebComponents.dll => 0xa1f624a => 86
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 80
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 93
	i32 254259026, ; 14: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 35
	i32 317674968, ; 15: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 16: Xamarin.AndroidX.Activity.dll => 0x13031348 => 58
	i32 321963286, ; 17: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 18: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 69
	i32 379916513, ; 19: System.Threading.Thread.dll => 0x16a510e1 => 117
	i32 385762202, ; 20: System.Memory.dll => 0x16fe439a => 101
	i32 395744057, ; 21: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 22: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 23: System.Collections => 0x1a61054f => 90
	i32 450948140, ; 24: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 68
	i32 456227837, ; 25: System.Web.HttpUtility.dll => 0x1b317bfd => 119
	i32 469710990, ; 26: System.dll => 0x1bff388e => 122
	i32 489220957, ; 27: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 28: System.ObjectModel => 0x1dbae811 => 106
	i32 513247710, ; 29: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 51
	i32 538707440, ; 30: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 31: Microsoft.Extensions.Logging => 0x20216150 => 48
	i32 571435654, ; 32: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 45
	i32 627609679, ; 33: Xamarin.AndroidX.CustomView => 0x2568904f => 66
	i32 627931235, ; 34: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 35: System.Text.Encodings.Web.dll => 0x27787397 => 114
	i32 672442732, ; 36: System.Collections.Concurrent => 0x2814a96c => 88
	i32 690569205, ; 37: System.Xml.Linq.dll => 0x29293ff5 => 120
	i32 722857257, ; 38: System.Runtime.Loader.dll => 0x2b15ed29 => 111
	i32 759454413, ; 39: System.Net.Requests => 0x2d445acd => 104
	i32 775507847, ; 40: System.IO.Compression => 0x2e394f87 => 97
	i32 777317022, ; 41: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 42: Microsoft.Extensions.Options => 0x2f0980eb => 50
	i32 804008546, ; 43: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 38
	i32 823281589, ; 44: System.Private.Uri.dll => 0x311247b5 => 107
	i32 830298997, ; 45: System.IO.Compression.Brotli => 0x317d5b75 => 96
	i32 869139383, ; 46: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 47: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 91
	i32 918734561, ; 49: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 50: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 51: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 69
	i32 990727110, ; 52: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 53: System.Collections.dll => 0x3b2c715c => 90
	i32 999186168, ; 54: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 47
	i32 1012816738, ; 55: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 79
	i32 1028951442, ; 56: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 42
	i32 1035644815, ; 57: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 59
	i32 1043950537, ; 58: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 59: System.Linq.Expressions.dll => 0x3e444eb4 => 99
	i32 1052210849, ; 60: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 71
	i32 1082857460, ; 61: System.ComponentModel.TypeConverter => 0x408b17f4 => 92
	i32 1084122840, ; 62: Xamarin.Kotlin.StdLib => 0x409e66d8 => 84
	i32 1098259244, ; 63: System => 0x41761b2c => 122
	i32 1108272742, ; 64: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 65: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 66: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 67: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 68: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 43
	i32 1178241025, ; 69: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 76
	i32 1260983243, ; 70: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 67
	i32 1308624726, ; 72: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 73: System.Linq => 0x4eed2679 => 100
	i32 1336711579, ; 74: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 75: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 76: Xamarin.AndroidX.SavedState => 0x52114ed3 => 79
	i32 1406073936, ; 77: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 63
	i32 1414632214, ; 78: Origami.WebComponents => 0x54519316 => 86
	i32 1430672901, ; 79: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1454105418, ; 80: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 44
	i32 1461004990, ; 81: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 82: System.IO.Compression.dll => 0x57261233 => 97
	i32 1469204771, ; 83: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 60
	i32 1470490898, ; 84: Microsoft.Extensions.Primitives => 0x57a5e912 => 51
	i32 1480492111, ; 85: System.IO.Compression.Brotli.dll => 0x583e844f => 96
	i32 1521091094, ; 86: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 47
	i32 1526286932, ; 87: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 88: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 116
	i32 1546581739, ; 89: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 38
	i32 1622152042, ; 90: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 73
	i32 1624863272, ; 91: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 82
	i32 1636350590, ; 92: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 65
	i32 1639515021, ; 93: System.Net.Http.dll => 0x61b9038d => 102
	i32 1639986890, ; 94: System.Text.RegularExpressions => 0x61c036ca => 116
	i32 1654881142, ; 95: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 37
	i32 1657153582, ; 96: System.Runtime => 0x62c6282e => 112
	i32 1658251792, ; 97: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 83
	i32 1677501392, ; 98: System.Net.Primitives.dll => 0x63fca3d0 => 103
	i32 1679769178, ; 99: System.Security.Cryptography => 0x641f3e5a => 113
	i32 1729485958, ; 100: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 61
	i32 1743415430, ; 101: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1760259689, ; 102: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 36
	i32 1766324549, ; 103: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 80
	i32 1770582343, ; 104: Microsoft.Extensions.Logging.dll => 0x6988f147 => 48
	i32 1780572499, ; 105: Mono.Android.Runtime.dll => 0x6a216153 => 125
	i32 1782862114, ; 106: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 107: Xamarin.AndroidX.Fragment => 0x6a96652d => 68
	i32 1793755602, ; 108: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 109: Xamarin.AndroidX.Loader => 0x6bcd3296 => 73
	i32 1813058853, ; 110: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 84
	i32 1813201214, ; 111: Xamarin.Google.Android.Material => 0x6c13413e => 83
	i32 1818569960, ; 112: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 77
	i32 1828688058, ; 113: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 49
	i32 1853025655, ; 114: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 115: System.Linq.Expressions => 0x6ec71a65 => 99
	i32 1875935024, ; 116: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 117: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 118: System.Collections.NonGeneric.dll => 0x71dc7c8b => 89
	i32 1939592360, ; 119: System.Private.Xml.Linq => 0x739bd4a8 => 108
	i32 1953182387, ; 120: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 121: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 39
	i32 2003115576, ; 122: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 123: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 71
	i32 2045470958, ; 124: System.Private.Xml => 0x79eb68ee => 109
	i32 2055257422, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 70
	i32 2066184531, ; 126: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2072397586, ; 127: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 46
	i32 2079903147, ; 128: System.Runtime.dll => 0x7bf8cdab => 112
	i32 2090596640, ; 129: System.Numerics.Vectors => 0x7c9bf920 => 105
	i32 2127167465, ; 130: System.Console => 0x7ec9ffe9 => 94
	i32 2151282119, ; 131: Origami.App => 0x8039f5c7 => 87
	i32 2159891885, ; 132: Microsoft.Maui => 0x80bd55ad => 55
	i32 2169148018, ; 133: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 134: Microsoft.Extensions.Options.dll => 0x820d22b3 => 50
	i32 2192057212, ; 135: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 49
	i32 2193016926, ; 136: System.ObjectModel.dll => 0x82b6c85e => 106
	i32 2201107256, ; 137: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 85
	i32 2201231467, ; 138: System.Net.Http => 0x8334206b => 102
	i32 2207618523, ; 139: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 140: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 40
	i32 2279755925, ; 141: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 78
	i32 2303942373, ; 142: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 143: System.Private.CoreLib.dll => 0x896b7878 => 123
	i32 2353062107, ; 144: System.Net.Primitives => 0x8c40e0db => 103
	i32 2366048013, ; 145: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 146: System.Xml.ReaderWriter.dll => 0x8d24e767 => 121
	i32 2371007202, ; 147: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 39
	i32 2395872292, ; 148: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 149: System.Web.HttpUtility => 0x8f24faee => 119
	i32 2411328690, ; 150: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 35
	i32 2427813419, ; 151: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 152: System.Console.dll => 0x912896e5 => 94
	i32 2442556106, ; 153: Microsoft.JSInterop.dll => 0x919672ca => 52
	i32 2475788418, ; 154: Java.Interop.dll => 0x93918882 => 124
	i32 2480646305, ; 155: Microsoft.Maui.Controls => 0x93dba8a1 => 53
	i32 2503351294, ; 156: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 157: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 158: System.Text.Encodings.Web => 0x9930ee42 => 114
	i32 2576534780, ; 159: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2592341985, ; 160: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 43
	i32 2593496499, ; 161: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 162: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 85
	i32 2617129537, ; 163: System.Private.Xml.dll => 0x9bfe3a41 => 109
	i32 2620871830, ; 164: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 65
	i32 2626831493, ; 165: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 166: System.Runtime.Loader => 0x9ec4cf01 => 111
	i32 2692077919, ; 167: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 37
	i32 2732626843, ; 168: Xamarin.AndroidX.Activity => 0xa2e0939b => 58
	i32 2737747696, ; 169: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 60
	i32 2740698338, ; 170: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 171: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 172: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 54
	i32 2764765095, ; 173: Microsoft.Maui.dll => 0xa4caf7a7 => 55
	i32 2778768386, ; 174: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 81
	i32 2785988530, ; 175: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 176: Microsoft.Maui.Graphics => 0xa7008e0b => 57
	i32 2810250172, ; 177: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 63
	i32 2853208004, ; 178: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 81
	i32 2861189240, ; 179: Microsoft.Maui.Essentials => 0xaa8a4878 => 56
	i32 2892341533, ; 180: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 36
	i32 2909740682, ; 181: System.Private.CoreLib => 0xad6f1e8a => 123
	i32 2911054922, ; 182: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 46
	i32 2916838712, ; 183: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 82
	i32 2919462931, ; 184: System.Numerics.Vectors.dll => 0xae037813 => 105
	i32 2959614098, ; 185: System.ComponentModel.dll => 0xb0682092 => 93
	i32 2978675010, ; 186: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 67
	i32 3038032645, ; 187: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 188: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 189: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 74
	i32 3059408633, ; 190: Mono.Android.Runtime => 0xb65adef9 => 125
	i32 3059793426, ; 191: System.ComponentModel.Primitives => 0xb660be12 => 91
	i32 3178803400, ; 192: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 75
	i32 3220365878, ; 193: System.Threading => 0xbff2e236 => 118
	i32 3258312781, ; 194: Xamarin.AndroidX.CardView => 0xc235e84d => 61
	i32 3305363605, ; 195: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 196: System.Net.Requests.dll => 0xc5b097e4 => 104
	i32 3317135071, ; 197: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 66
	i32 3346324047, ; 198: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 76
	i32 3357674450, ; 199: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 200: System.Text.Json => 0xc82afec1 => 115
	i32 3362522851, ; 201: Xamarin.AndroidX.Core => 0xc86c06e3 => 64
	i32 3366347497, ; 202: Java.Interop => 0xc8a662e9 => 124
	i32 3374999561, ; 203: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 78
	i32 3381016424, ; 204: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3406629867, ; 205: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 44
	i32 3428513518, ; 206: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 41
	i32 3458724246, ; 207: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 208: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 92
	i32 3476120550, ; 209: Mono.Android => 0xcf3163e6 => 126
	i32 3484440000, ; 210: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 211: System.Text.Json.dll => 0xcfbaacae => 115
	i32 3500000672, ; 212: Microsoft.JSInterop => 0xd09dc5a0 => 52
	i32 3509114376, ; 213: System.Xml.Linq => 0xd128d608 => 120
	i32 3580758918, ; 214: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 215: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 216: System.Linq.dll => 0xd715a361 => 100
	i32 3641597786, ; 217: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 70
	i32 3643446276, ; 218: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 219: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 75
	i32 3657292374, ; 220: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 40
	i32 3672681054, ; 221: Mono.Android.dll => 0xdae8aa5e => 126
	i32 3724971120, ; 222: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 74
	i32 3748608112, ; 223: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 95
	i32 3751619990, ; 224: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 225: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 62
	i32 3792276235, ; 226: System.Collections.NonGeneric => 0xe2098b0b => 89
	i32 3823082795, ; 227: System.Security.Cryptography.dll => 0xe3df9d2b => 113
	i32 3841636137, ; 228: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 42
	i32 3849253459, ; 229: System.Runtime.InteropServices.dll => 0xe56ef253 => 110
	i32 3896106733, ; 230: System.Collections.Concurrent.dll => 0xe839deed => 88
	i32 3896760992, ; 231: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 64
	i32 3920221145, ; 232: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 233: System.Xml.ReaderWriter => 0xea213423 => 121
	i32 3931092270, ; 234: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 77
	i32 3955647286, ; 235: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 59
	i32 4025784931, ; 236: System.Memory => 0xeff49a63 => 101
	i32 4046471985, ; 237: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 54
	i32 4068434129, ; 238: System.Private.Xml.Linq.dll => 0xf27f60d1 => 108
	i32 4073602200, ; 239: System.Threading.dll => 0xf2ce3c98 => 118
	i32 4091086043, ; 240: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 241: Microsoft.Maui.Essentials.dll => 0xf40add04 => 56
	i32 4100113165, ; 242: System.Private.Uri => 0xf462c30d => 107
	i32 4103439459, ; 243: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 244: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 41
	i32 4127667938, ; 245: System.IO.FileSystem.Watcher => 0xf60736e2 => 98
	i32 4150914736, ; 246: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4164802419, ; 247: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 98
	i32 4182413190, ; 248: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 72
	i32 4213026141, ; 249: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 95
	i32 4249188766, ; 250: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 251: Microsoft.Maui.Controls.dll => 0xfea12dee => 53
	i32 4292120959, ; 252: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 72
	i32 4294648842 ; 253: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 45
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [254 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 117, ; 2
	i32 33, ; 3
	i32 57, ; 4
	i32 17, ; 5
	i32 87, ; 6
	i32 110, ; 7
	i32 32, ; 8
	i32 25, ; 9
	i32 62, ; 10
	i32 86, ; 11
	i32 80, ; 12
	i32 93, ; 13
	i32 35, ; 14
	i32 30, ; 15
	i32 58, ; 16
	i32 8, ; 17
	i32 69, ; 18
	i32 117, ; 19
	i32 101, ; 20
	i32 34, ; 21
	i32 28, ; 22
	i32 90, ; 23
	i32 68, ; 24
	i32 119, ; 25
	i32 122, ; 26
	i32 6, ; 27
	i32 106, ; 28
	i32 51, ; 29
	i32 27, ; 30
	i32 48, ; 31
	i32 45, ; 32
	i32 66, ; 33
	i32 19, ; 34
	i32 114, ; 35
	i32 88, ; 36
	i32 120, ; 37
	i32 111, ; 38
	i32 104, ; 39
	i32 97, ; 40
	i32 25, ; 41
	i32 50, ; 42
	i32 38, ; 43
	i32 107, ; 44
	i32 96, ; 45
	i32 10, ; 46
	i32 24, ; 47
	i32 91, ; 48
	i32 21, ; 49
	i32 14, ; 50
	i32 69, ; 51
	i32 23, ; 52
	i32 90, ; 53
	i32 47, ; 54
	i32 79, ; 55
	i32 42, ; 56
	i32 59, ; 57
	i32 4, ; 58
	i32 99, ; 59
	i32 71, ; 60
	i32 92, ; 61
	i32 84, ; 62
	i32 122, ; 63
	i32 26, ; 64
	i32 20, ; 65
	i32 16, ; 66
	i32 22, ; 67
	i32 43, ; 68
	i32 76, ; 69
	i32 2, ; 70
	i32 67, ; 71
	i32 11, ; 72
	i32 100, ; 73
	i32 31, ; 74
	i32 32, ; 75
	i32 79, ; 76
	i32 63, ; 77
	i32 86, ; 78
	i32 0, ; 79
	i32 44, ; 80
	i32 6, ; 81
	i32 97, ; 82
	i32 60, ; 83
	i32 51, ; 84
	i32 96, ; 85
	i32 47, ; 86
	i32 30, ; 87
	i32 116, ; 88
	i32 38, ; 89
	i32 73, ; 90
	i32 82, ; 91
	i32 65, ; 92
	i32 102, ; 93
	i32 116, ; 94
	i32 37, ; 95
	i32 112, ; 96
	i32 83, ; 97
	i32 103, ; 98
	i32 113, ; 99
	i32 61, ; 100
	i32 1, ; 101
	i32 36, ; 102
	i32 80, ; 103
	i32 48, ; 104
	i32 125, ; 105
	i32 17, ; 106
	i32 68, ; 107
	i32 9, ; 108
	i32 73, ; 109
	i32 84, ; 110
	i32 83, ; 111
	i32 77, ; 112
	i32 49, ; 113
	i32 26, ; 114
	i32 99, ; 115
	i32 8, ; 116
	i32 2, ; 117
	i32 89, ; 118
	i32 108, ; 119
	i32 13, ; 120
	i32 39, ; 121
	i32 5, ; 122
	i32 71, ; 123
	i32 109, ; 124
	i32 70, ; 125
	i32 4, ; 126
	i32 46, ; 127
	i32 112, ; 128
	i32 105, ; 129
	i32 94, ; 130
	i32 87, ; 131
	i32 55, ; 132
	i32 12, ; 133
	i32 50, ; 134
	i32 49, ; 135
	i32 106, ; 136
	i32 85, ; 137
	i32 102, ; 138
	i32 14, ; 139
	i32 40, ; 140
	i32 78, ; 141
	i32 18, ; 142
	i32 123, ; 143
	i32 103, ; 144
	i32 12, ; 145
	i32 121, ; 146
	i32 39, ; 147
	i32 13, ; 148
	i32 119, ; 149
	i32 35, ; 150
	i32 10, ; 151
	i32 94, ; 152
	i32 52, ; 153
	i32 124, ; 154
	i32 53, ; 155
	i32 16, ; 156
	i32 11, ; 157
	i32 114, ; 158
	i32 15, ; 159
	i32 43, ; 160
	i32 20, ; 161
	i32 85, ; 162
	i32 109, ; 163
	i32 65, ; 164
	i32 15, ; 165
	i32 111, ; 166
	i32 37, ; 167
	i32 58, ; 168
	i32 60, ; 169
	i32 1, ; 170
	i32 21, ; 171
	i32 54, ; 172
	i32 55, ; 173
	i32 81, ; 174
	i32 27, ; 175
	i32 57, ; 176
	i32 63, ; 177
	i32 81, ; 178
	i32 56, ; 179
	i32 36, ; 180
	i32 123, ; 181
	i32 46, ; 182
	i32 82, ; 183
	i32 105, ; 184
	i32 93, ; 185
	i32 67, ; 186
	i32 34, ; 187
	i32 7, ; 188
	i32 74, ; 189
	i32 125, ; 190
	i32 91, ; 191
	i32 75, ; 192
	i32 118, ; 193
	i32 61, ; 194
	i32 7, ; 195
	i32 104, ; 196
	i32 66, ; 197
	i32 76, ; 198
	i32 24, ; 199
	i32 115, ; 200
	i32 64, ; 201
	i32 124, ; 202
	i32 78, ; 203
	i32 3, ; 204
	i32 44, ; 205
	i32 41, ; 206
	i32 22, ; 207
	i32 92, ; 208
	i32 126, ; 209
	i32 23, ; 210
	i32 115, ; 211
	i32 52, ; 212
	i32 120, ; 213
	i32 31, ; 214
	i32 33, ; 215
	i32 100, ; 216
	i32 70, ; 217
	i32 28, ; 218
	i32 75, ; 219
	i32 40, ; 220
	i32 126, ; 221
	i32 74, ; 222
	i32 95, ; 223
	i32 3, ; 224
	i32 62, ; 225
	i32 89, ; 226
	i32 113, ; 227
	i32 42, ; 228
	i32 110, ; 229
	i32 88, ; 230
	i32 64, ; 231
	i32 19, ; 232
	i32 121, ; 233
	i32 77, ; 234
	i32 59, ; 235
	i32 101, ; 236
	i32 54, ; 237
	i32 108, ; 238
	i32 118, ; 239
	i32 5, ; 240
	i32 56, ; 241
	i32 107, ; 242
	i32 29, ; 243
	i32 41, ; 244
	i32 98, ; 245
	i32 29, ; 246
	i32 98, ; 247
	i32 72, ; 248
	i32 95, ; 249
	i32 18, ; 250
	i32 53, ; 251
	i32 72, ; 252
	i32 45 ; 253
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
