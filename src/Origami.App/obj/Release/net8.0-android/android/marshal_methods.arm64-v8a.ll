; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [127 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [254 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 51
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 126
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 56
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 99
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 62
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 79
	i64 683390398661839228, ; 6: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 45
	i64 750875890346172408, ; 7: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 117
	i64 799765834175365804, ; 8: System.ComponentModel.dll => 0xb1956c9f18442ac => 93
	i64 805302231655005164, ; 9: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 872800313462103108, ; 10: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 67
	i64 1120440138749646132, ; 11: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 83
	i64 1369545283391376210, ; 12: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 75
	i64 1404195534211153682, ; 13: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 98
	i64 1476839205573959279, ; 14: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 103
	i64 1486715745332614827, ; 15: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 53
	i64 1513467482682125403, ; 16: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 125
	i64 1537168428375924959, ; 17: System.Threading.Thread.dll => 0x15551e8a954ae0df => 117
	i64 1624659445732251991, ; 18: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 60
	i64 1628611045998245443, ; 19: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 72
	i64 1743969030606105336, ; 20: System.Memory.dll => 0x1833d297e88f2af8 => 101
	i64 1767386781656293639, ; 21: System.Private.Uri.dll => 0x188704e9f5582107 => 107
	i64 1776954265264967804, ; 22: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 52
	i64 1795316252682057001, ; 23: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 59
	i64 1835311033149317475, ; 24: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 25: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 79
	i64 1881198190668717030, ; 26: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 27: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 54
	i64 1981742497975770890, ; 28: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 71
	i64 2262844636196693701, ; 29: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 67
	i64 2287834202362508563, ; 30: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 88
	i64 2295368378960711535, ; 31: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 38
	i64 2329709569556905518, ; 32: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 70
	i64 2335503487726329082, ; 33: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 114
	i64 2470498323731680442, ; 34: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 63
	i64 2497223385847772520, ; 35: System.Runtime => 0x22a7eb7046413568 => 112
	i64 2547086958574651984, ; 36: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 58
	i64 2602673633151553063, ; 37: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 38: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 41
	i64 2662981627730767622, ; 39: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2781169761569919449, ; 40: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 52
	i64 2895129759130297543, ; 41: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 42: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 83
	i64 3289520064315143713, ; 43: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 69
	i64 3311221304742556517, ; 44: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 105
	i64 3344514922410554693, ; 45: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 85
	i64 3396143930648122816, ; 46: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 43
	i64 3429672777697402584, ; 47: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 56
	i64 3494946837667399002, ; 48: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 39
	i64 3522470458906976663, ; 49: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 80
	i64 3551103847008531295, ; 50: System.Private.CoreLib.dll => 0x31480e226177735f => 123
	i64 3567343442040498961, ; 51: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 52: System.Runtime.dll => 0x319037675df7e556 => 112
	i64 3638003163729360188, ; 53: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 40
	i64 3647754201059316852, ; 54: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 121
	i64 3655542548057982301, ; 55: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 39
	i64 3727469159507183293, ; 56: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 78
	i64 3753897248517198740, ; 57: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 37
	i64 3869221888984012293, ; 58: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 48
	i64 3889433610606858880, ; 59: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 46
	i64 3890352374528606784, ; 60: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 54
	i64 3933965368022646939, ; 61: System.Net.Requests => 0x369840a8bfadc09b => 104
	i64 3966267475168208030, ; 62: System.Memory => 0x370b03412596249e => 101
	i64 4070326265757318011, ; 63: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 64: System.Private.Xml.dll => 0x3887fb25779ae26e => 109
	i64 4120493066591692148, ; 65: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 66: System.ComponentModel => 0x39a7562737acb67e => 93
	i64 4187479170553454871, ; 67: System.Linq.Expressions => 0x3a1cea1e912fa117 => 99
	i64 4205801962323029395, ; 68: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 92
	i64 4360412976914417659, ; 69: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4477672992252076438, ; 70: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 119
	i64 4672453897036726049, ; 71: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 98
	i64 4794310189461587505, ; 72: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 58
	i64 4795410492532947900, ; 73: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 80
	i64 4853321196694829351, ; 74: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 111
	i64 4871824391508510238, ; 75: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4953714692329509532, ; 76: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5197073077358930460, ; 77: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 36
	i64 5290786973231294105, ; 78: System.Runtime.Loader => 0x496ca6b869b72699 => 111
	i64 5471532531798518949, ; 79: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 80: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 81: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 96
	i64 5573260873512690141, ; 82: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 113
	i64 5692067934154308417, ; 83: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 82
	i64 6200764641006662125, ; 84: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 85: System.Text.Json.dll => 0x565a67a0ffe264a7 => 115
	i64 6300676701234028427, ; 86: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 87: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 88: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 70
	i64 6471714727257221498, ; 89: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 90: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 91: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 66
	i64 6560151584539558821, ; 92: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 50
	i64 6743165466166707109, ; 93: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6876862101832370452, ; 94: System.Xml.Linq => 0x5f6f85a57d108914 => 120
	i64 6894844156784520562, ; 95: System.Numerics.Vectors => 0x5faf683aead1ad72 => 105
	i64 6920570528939222495, ; 96: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 37
	i64 7083547580668757502, ; 97: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 108
	i64 7270811800166795866, ; 98: System.Linq => 0x64e71ccf51a90a5a => 100
	i64 7377312882064240630, ; 99: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 92
	i64 7488575175965059935, ; 100: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 120
	i64 7489048572193775167, ; 101: System.ObjectModel => 0x67ee71ff6b419e3f => 106
	i64 7654504624184590948, ; 102: System.Net.Http => 0x6a3a4366801b8264 => 102
	i64 7714652370974252055, ; 103: System.Private.CoreLib => 0x6b0ff375198b9c17 => 123
	i64 7735352534559001595, ; 104: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 84
	i64 7742555799473854801, ; 105: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7836164640616011524, ; 106: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 60
	i64 7975724199463739455, ; 107: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 108: System.Collections.dll => 0x6fe942efa61731bf => 90
	i64 8083354569033831015, ; 109: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 69
	i64 8087206902342787202, ; 110: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 95
	i64 8108129031893776750, ; 111: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 112: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 124
	i64 8185542183669246576, ; 113: System.Collections => 0x7198e33f4794aa70 => 90
	i64 8246048515196606205, ; 114: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 57
	i64 8368701292315763008, ; 115: System.Security.Cryptography => 0x7423997c6fd56140 => 113
	i64 8386351099740279196, ; 116: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 117: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 77
	i64 8563666267364444763, ; 118: System.Private.Uri => 0x76d841191140ca5b => 107
	i64 8626175481042262068, ; 119: Java.Interop => 0x77b654e585b55834 => 124
	i64 8639588376636138208, ; 120: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 76
	i64 8677882282824630478, ; 121: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 122: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 95
	i64 9045785047181495996, ; 123: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 124: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 82
	i64 9324707631942237306, ; 125: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 59
	i64 9363564275759486853, ; 126: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9551379474083066910, ; 127: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9659729154652888475, ; 128: System.Text.RegularExpressions => 0x860e407c9991dd9b => 116
	i64 9678050649315576968, ; 129: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 63
	i64 9702891218465930390, ; 130: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 89
	i64 9773637193738963987, ; 131: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 132: Mono.Android.dll => 0x881f890734e555e7 => 126
	i64 9956195530459977388, ; 133: Microsoft.Maui => 0x8a2b8315b36616ac => 55
	i64 10038780035334861115, ; 134: System.Net.Http.dll => 0x8b50e941206af13b => 102
	i64 10051358222726253779, ; 135: System.Private.Xml => 0x8b7d990c97ccccd3 => 109
	i64 10092835686693276772, ; 136: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 53
	i64 10143853363526200146, ; 137: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 138: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 139: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 66
	i64 10268097640805811799, ; 140: Origami.WebComponents => 0x8e7f9c66cf41c657 => 86
	i64 10406448008575299332, ; 141: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 85
	i64 10430153318873392755, ; 142: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 64
	i64 10506226065143327199, ; 143: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10734191584620811116, ; 144: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 45
	i64 10761706286639228993, ; 145: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10785150219063592792, ; 146: System.Net.Primitives => 0x95ac8cfb68830758 => 103
	i64 11002576679268595294, ; 147: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 49
	i64 11009005086950030778, ; 148: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 55
	i64 11051904132540108364, ; 149: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 44
	i64 11103970607964515343, ; 150: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 151: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 152: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 153: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 81
	i64 11218356222449480316, ; 154: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 35
	i64 11220793807500858938, ; 155: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 156: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 50
	i64 11340910727871153756, ; 157: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 65
	i64 11485890710487134646, ; 158: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 110
	i64 11518296021396496455, ; 159: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 160: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 81
	i64 11530571088791430846, ; 161: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 48
	i64 11855031688536399763, ; 162: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12048689113179125827, ; 163: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 46
	i64 12058074296353848905, ; 164: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 47
	i64 12145679461940342714, ; 165: System.Text.Json => 0xa88e1f1ebcb62fba => 115
	i64 12451044538927396471, ; 166: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 68
	i64 12466513435562512481, ; 167: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 73
	i64 12475113361194491050, ; 168: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12538491095302438457, ; 169: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 61
	i64 12550732019250633519, ; 170: System.IO.Compression => 0xae2d28465e8e1b2f => 97
	i64 12700543734426720211, ; 171: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 62
	i64 12843321153144804894, ; 172: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 51
	i64 12989346753972519995, ; 173: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13003699287675270979, ; 174: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 38
	i64 13005833372463390146, ; 175: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13343850469010654401, ; 176: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 125
	i64 13381594904270902445, ; 177: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 178: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 84
	i64 13540124433173649601, ; 179: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13550417756503177631, ; 180: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 43
	i64 13572454107664307259, ; 181: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 78
	i64 13717397318615465333, ; 182: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 91
	i64 13881769479078963060, ; 183: System.Console.dll => 0xc0a5f3cade5c6774 => 94
	i64 13959074834287824816, ; 184: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 68
	i64 14124974489674258913, ; 185: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 61
	i64 14125464355221830302, ; 186: System.Threading.dll => 0xc407bafdbc707a9e => 118
	i64 14349907877893689639, ; 187: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14422946560832158821, ; 188: Origami.App.dll => 0xc828997b24d7bc65 => 87
	i64 14461014870687870182, ; 189: System.Net.Requests.dll => 0xc8afd8683afdece6 => 104
	i64 14464374589798375073, ; 190: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 191: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14551742072151931844, ; 192: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 114
	i64 14610046442689856844, ; 193: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14669215534098758659, ; 194: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 41
	i64 14690985099581930927, ; 195: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 119
	i64 14705122255218365489, ; 196: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 197: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 198: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 199: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 65
	i64 14904040806490515477, ; 200: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 201: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 42
	i64 14987728460634540364, ; 202: System.IO.Compression.dll => 0xcfff1ba06622494c => 97
	i64 15076659072870671916, ; 203: System.ObjectModel.dll => 0xd13b0d8c1620662c => 106
	i64 15111608613780139878, ; 204: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 205: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 96
	i64 15133485256822086103, ; 206: System.Linq.dll => 0xd204f0a9127dd9d7 => 100
	i64 15203009853192377507, ; 207: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 208: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 40
	i64 15370334346939861994, ; 209: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 64
	i64 15391712275433856905, ; 210: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 42
	i64 15427448221306938193, ; 211: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 36
	i64 15481710163200268842, ; 212: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 44
	i64 15527772828719725935, ; 213: System.Console => 0xd77dbb1e38cd3d6f => 94
	i64 15536481058354060254, ; 214: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 215: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 72
	i64 15609085926864131306, ; 216: System.dll => 0xd89e9cf3334914ea => 122
	i64 15661133872274321916, ; 217: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 121
	i64 15783653065526199428, ; 218: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 16056281320585338352, ; 219: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 220: System => 0xe03056ea4e39aa26 => 122
	i64 16288847719894691167, ; 221: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 222: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 49
	i64 16510086877724262478, ; 223: Origami.WebComponents.dll => 0xe51f9c8a8597c04e => 86
	i64 16649148416072044166, ; 224: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 57
	i64 16677317093839702854, ; 225: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 77
	i64 16803648858859583026, ; 226: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16890310621557459193, ; 227: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 116
	i64 16942731696432749159, ; 228: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 229: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 75
	i64 17008137082415910100, ; 230: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 89
	i64 17031351772568316411, ; 231: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 74
	i64 17062143951396181894, ; 232: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 91
	i64 17079998892748052666, ; 233: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 35
	i64 17203614576212522419, ; 234: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17205988430934219272, ; 235: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 47
	i64 17230721278011714856, ; 236: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 108
	i64 17310278548634113468, ; 237: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17342750010158924305, ; 238: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17514990004910432069, ; 239: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 240: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17704177640604968747, ; 241: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 73
	i64 17710060891934109755, ; 242: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 71
	i64 17712670374920797664, ; 243: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 110
	i64 17827813215687577648, ; 244: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17942426894774770628, ; 245: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 18025913125965088385, ; 246: System.Threading => 0xfa28e87b91334681 => 118
	i64 18121036031235206392, ; 247: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 74
	i64 18245806341561545090, ; 248: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 88
	i64 18289871622456159313, ; 249: Origami.App => 0xfdd2ad5633ff2c51 => 87
	i64 18305135509493619199, ; 250: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 76
	i64 18324163916253801303, ; 251: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 252: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786 ; 253: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [254 x i32] [
	i32 51, ; 0
	i32 126, ; 1
	i32 56, ; 2
	i32 99, ; 3
	i32 62, ; 4
	i32 79, ; 5
	i32 45, ; 6
	i32 117, ; 7
	i32 93, ; 8
	i32 12, ; 9
	i32 67, ; 10
	i32 83, ; 11
	i32 75, ; 12
	i32 98, ; 13
	i32 103, ; 14
	i32 53, ; 15
	i32 125, ; 16
	i32 117, ; 17
	i32 60, ; 18
	i32 72, ; 19
	i32 101, ; 20
	i32 107, ; 21
	i32 52, ; 22
	i32 59, ; 23
	i32 6, ; 24
	i32 79, ; 25
	i32 28, ; 26
	i32 54, ; 27
	i32 71, ; 28
	i32 67, ; 29
	i32 88, ; 30
	i32 38, ; 31
	i32 70, ; 32
	i32 114, ; 33
	i32 63, ; 34
	i32 112, ; 35
	i32 58, ; 36
	i32 27, ; 37
	i32 41, ; 38
	i32 2, ; 39
	i32 52, ; 40
	i32 7, ; 41
	i32 83, ; 42
	i32 69, ; 43
	i32 105, ; 44
	i32 85, ; 45
	i32 43, ; 46
	i32 56, ; 47
	i32 39, ; 48
	i32 80, ; 49
	i32 123, ; 50
	i32 22, ; 51
	i32 112, ; 52
	i32 40, ; 53
	i32 121, ; 54
	i32 39, ; 55
	i32 78, ; 56
	i32 37, ; 57
	i32 48, ; 58
	i32 46, ; 59
	i32 54, ; 60
	i32 104, ; 61
	i32 101, ; 62
	i32 3, ; 63
	i32 109, ; 64
	i32 33, ; 65
	i32 93, ; 66
	i32 99, ; 67
	i32 92, ; 68
	i32 28, ; 69
	i32 119, ; 70
	i32 98, ; 71
	i32 58, ; 72
	i32 80, ; 73
	i32 111, ; 74
	i32 18, ; 75
	i32 26, ; 76
	i32 36, ; 77
	i32 111, ; 78
	i32 26, ; 79
	i32 29, ; 80
	i32 96, ; 81
	i32 113, ; 82
	i32 82, ; 83
	i32 23, ; 84
	i32 115, ; 85
	i32 6, ; 86
	i32 34, ; 87
	i32 70, ; 88
	i32 7, ; 89
	i32 11, ; 90
	i32 66, ; 91
	i32 50, ; 92
	i32 19, ; 93
	i32 120, ; 94
	i32 105, ; 95
	i32 37, ; 96
	i32 108, ; 97
	i32 100, ; 98
	i32 92, ; 99
	i32 120, ; 100
	i32 106, ; 101
	i32 102, ; 102
	i32 123, ; 103
	i32 84, ; 104
	i32 14, ; 105
	i32 60, ; 106
	i32 25, ; 107
	i32 90, ; 108
	i32 69, ; 109
	i32 95, ; 110
	i32 16, ; 111
	i32 124, ; 112
	i32 90, ; 113
	i32 57, ; 114
	i32 113, ; 115
	i32 31, ; 116
	i32 77, ; 117
	i32 107, ; 118
	i32 124, ; 119
	i32 76, ; 120
	i32 21, ; 121
	i32 95, ; 122
	i32 31, ; 123
	i32 82, ; 124
	i32 59, ; 125
	i32 5, ; 126
	i32 29, ; 127
	i32 116, ; 128
	i32 63, ; 129
	i32 89, ; 130
	i32 1, ; 131
	i32 126, ; 132
	i32 55, ; 133
	i32 102, ; 134
	i32 109, ; 135
	i32 53, ; 136
	i32 3, ; 137
	i32 19, ; 138
	i32 66, ; 139
	i32 86, ; 140
	i32 85, ; 141
	i32 64, ; 142
	i32 1, ; 143
	i32 45, ; 144
	i32 33, ; 145
	i32 103, ; 146
	i32 49, ; 147
	i32 55, ; 148
	i32 44, ; 149
	i32 12, ; 150
	i32 27, ; 151
	i32 8, ; 152
	i32 81, ; 153
	i32 35, ; 154
	i32 15, ; 155
	i32 50, ; 156
	i32 65, ; 157
	i32 110, ; 158
	i32 13, ; 159
	i32 81, ; 160
	i32 48, ; 161
	i32 30, ; 162
	i32 46, ; 163
	i32 47, ; 164
	i32 115, ; 165
	i32 68, ; 166
	i32 73, ; 167
	i32 34, ; 168
	i32 61, ; 169
	i32 97, ; 170
	i32 62, ; 171
	i32 51, ; 172
	i32 0, ; 173
	i32 38, ; 174
	i32 21, ; 175
	i32 125, ; 176
	i32 9, ; 177
	i32 84, ; 178
	i32 30, ; 179
	i32 43, ; 180
	i32 78, ; 181
	i32 91, ; 182
	i32 94, ; 183
	i32 68, ; 184
	i32 61, ; 185
	i32 118, ; 186
	i32 23, ; 187
	i32 87, ; 188
	i32 104, ; 189
	i32 24, ; 190
	i32 32, ; 191
	i32 114, ; 192
	i32 2, ; 193
	i32 41, ; 194
	i32 119, ; 195
	i32 16, ; 196
	i32 15, ; 197
	i32 32, ; 198
	i32 65, ; 199
	i32 0, ; 200
	i32 42, ; 201
	i32 97, ; 202
	i32 106, ; 203
	i32 17, ; 204
	i32 96, ; 205
	i32 100, ; 206
	i32 22, ; 207
	i32 40, ; 208
	i32 64, ; 209
	i32 42, ; 210
	i32 36, ; 211
	i32 44, ; 212
	i32 94, ; 213
	i32 4, ; 214
	i32 72, ; 215
	i32 122, ; 216
	i32 121, ; 217
	i32 5, ; 218
	i32 24, ; 219
	i32 122, ; 220
	i32 18, ; 221
	i32 49, ; 222
	i32 86, ; 223
	i32 57, ; 224
	i32 77, ; 225
	i32 17, ; 226
	i32 116, ; 227
	i32 25, ; 228
	i32 75, ; 229
	i32 89, ; 230
	i32 74, ; 231
	i32 91, ; 232
	i32 35, ; 233
	i32 20, ; 234
	i32 47, ; 235
	i32 108, ; 236
	i32 10, ; 237
	i32 10, ; 238
	i32 8, ; 239
	i32 20, ; 240
	i32 73, ; 241
	i32 71, ; 242
	i32 110, ; 243
	i32 11, ; 244
	i32 4, ; 245
	i32 118, ; 246
	i32 74, ; 247
	i32 88, ; 248
	i32 87, ; 249
	i32 76, ; 250
	i32 14, ; 251
	i32 13, ; 252
	i32 9 ; 253
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
