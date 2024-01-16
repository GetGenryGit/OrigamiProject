; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [334 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [662 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 253
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 287
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 295
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 304
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 328
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 210
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 15: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 312
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 271
	i32 113106019, ; 17: Origami.App.dll => 0x6bddc63 => 0
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 271
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 291
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 327
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 320
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 227
	i32 169828938, ; 28: Origami.WebComponents.dll => 0xa1f624a => 329
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 273
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 225
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 247
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 244348769, ; 39: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 179
	i32 246610117, ; 40: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 41: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 178
	i32 261689757, ; 42: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 230
	i32 276479776, ; 43: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 249
	i32 280482487, ; 45: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 246
	i32 291076382, ; 46: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 325
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 216
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 51: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 303
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 248
	i32 360082299, ; 53: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 54: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 55: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 56: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 57: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 58: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 59: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 60: _Microsoft.Android.Resource.Designer => 0x17969339 => 330
	i32 403441872, ; 61: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 62: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 323
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 231
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 244
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 246
	i32 486930444, ; 72: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 259
	i32 489220957, ; 73: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 301
	i32 495020624, ; 74: Microsoft.JSInterop.WebAssembly => 0x1d816a50 => 204
	i32 498788369, ; 75: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 76: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 202
	i32 526420162, ; 77: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 291
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 80: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 322
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 198
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 284
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 282
	i32 571435654, ; 88: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 195
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 236
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 314
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 242
	i32 643868501, ; 96: System.Net => 0x2660a755 => 81
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 278
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 223
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 102: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 103: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 293
	i32 693804605, ; 104: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 105: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 106: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 288
	i32 700358131, ; 107: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 292
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 213
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 320
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 201
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 237
	i32 804008546, ; 119: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 184
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 251
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 264
	i32 869139383, ; 127: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 305
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 131: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 319
	i32 904024072, ; 132: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 133: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 134: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 316
	i32 928116545, ; 135: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 287
	i32 952186615, ; 136: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 137: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 292
	i32 961460050, ; 138: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 309
	i32 966729478, ; 139: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 285
	i32 967690846, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 248
	i32 975236339, ; 141: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 142: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 143: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 144: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 145: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 318
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 148: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 197
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 268
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 192
	i32 1031528504, ; 153: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 286
	i32 1035644815, ; 154: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 221
	i32 1036536393, ; 155: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 156: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 299
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 255
	i32 1067306892, ; 159: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 160: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 161: Xamarin.Kotlin.StdLib => 0x409e66d8 => 289
	i32 1098259244, ; 162: System => 0x41761b2c => 164
	i32 1106973742, ; 163: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 189
	i32 1108272742, ; 164: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 321
	i32 1117529484, ; 165: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 315
	i32 1118262833, ; 166: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 311
	i32 1121599056, ; 167: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 254
	i32 1127624469, ; 168: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 200
	i32 1149092582, ; 169: Xamarin.AndroidX.Window => 0x447dc2e6 => 281
	i32 1168523401, ; 170: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 317
	i32 1170634674, ; 171: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 172: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 193
	i32 1175144683, ; 173: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 277
	i32 1178241025, ; 174: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 262
	i32 1204270330, ; 175: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 223
	i32 1208641965, ; 176: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 177: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 178: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 282
	i32 1253011324, ; 179: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 180: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 297
	i32 1264511973, ; 181: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 272
	i32 1267360935, ; 182: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 276
	i32 1273260888, ; 183: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 228
	i32 1275534314, ; 184: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 293
	i32 1278448581, ; 185: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 220
	i32 1293217323, ; 186: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 239
	i32 1308624726, ; 187: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 306
	i32 1309188875, ; 188: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 189: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 281
	i32 1324164729, ; 190: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 191: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 192: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 326
	i32 1364015309, ; 193: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 194: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 327
	i32 1376866003, ; 195: Xamarin.AndroidX.SavedState => 0x52114ed3 => 268
	i32 1379779777, ; 196: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 197: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 198: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 232
	i32 1408764838, ; 199: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 200: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1414632214, ; 201: Origami.WebComponents => 0x54519316 => 329
	i32 1422545099, ; 202: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 203: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 295
	i32 1434145427, ; 204: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 205: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 285
	i32 1439761251, ; 206: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 207: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 208: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 209: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 194
	i32 1457743152, ; 210: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 211: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 212: es\Microsoft.Maui.Controls.resources => 0x57152abe => 301
	i32 1461234159, ; 213: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 214: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 215: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 216: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 222
	i32 1470490898, ; 217: Microsoft.Extensions.Primitives => 0x57a5e912 => 202
	i32 1479771757, ; 218: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 219: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 220: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 221: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 269
	i32 1521091094, ; 222: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 197
	i32 1526286932, ; 223: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 325
	i32 1536373174, ; 224: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 225: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 226: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 227: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 184
	i32 1550322496, ; 228: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1560932650, ; 229: Microsoft.AspNetCore.Components.WebAssembly => 0x5d09f12a => 182
	i32 1565862583, ; 230: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 231: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 232: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 233: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 234: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 238
	i32 1592978981, ; 235: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 236: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 286
	i32 1601112923, ; 237: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 238: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1616467958, ; 239: Blazored.Toast => 0x605957f6 => 175
	i32 1618516317, ; 240: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 241: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 258
	i32 1622358360, ; 242: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 243: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 280
	i32 1632842087, ; 244: Microsoft.Extensions.Configuration.Json => 0x61533167 => 190
	i32 1635184631, ; 245: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 242
	i32 1636350590, ; 246: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 235
	i32 1639515021, ; 247: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 248: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 249: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 250: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 183
	i32 1657153582, ; 251: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 252: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 274
	i32 1658251792, ; 253: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 283
	i32 1670060433, ; 254: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 230
	i32 1675553242, ; 255: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 256: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 257: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679018464, ; 258: Blazored.LocalStorage => 0x6413c9e0 => 173
	i32 1679769178, ; 259: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 260: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 261: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 262: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 290
	i32 1701541528, ; 263: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1718376423, ; 264: Blazored.SessionStorage => 0x666c57e7 => 174
	i32 1720223769, ; 265: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 251
	i32 1726116996, ; 266: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 267: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 268: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 226
	i32 1743415430, ; 269: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 296
	i32 1744735666, ; 270: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 271: System.IO.Pipelines.dll => 0x68139a0d => 211
	i32 1746316138, ; 272: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 273: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 274: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 275: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 181
	i32 1763938596, ; 276: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 277: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 278: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 273
	i32 1770582343, ; 279: Microsoft.Extensions.Logging.dll => 0x6988f147 => 198
	i32 1776026572, ; 280: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 281: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 282: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 283: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 312
	i32 1788241197, ; 284: Xamarin.AndroidX.Fragment => 0x6a96652d => 244
	i32 1793755602, ; 285: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 304
	i32 1808609942, ; 286: Xamarin.AndroidX.Loader => 0x6bcd3296 => 258
	i32 1813058853, ; 287: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 289
	i32 1813201214, ; 288: Xamarin.Google.Android.Material => 0x6c13413e => 283
	i32 1818569960, ; 289: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 263
	i32 1818787751, ; 290: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 291: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 292: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 293: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 199
	i32 1847515442, ; 294: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 213
	i32 1853025655, ; 295: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 321
	i32 1858542181, ; 296: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1862132565, ; 297: Microsoft.JSInterop.WebAssembly.dll => 0x6efde355 => 204
	i32 1870277092, ; 298: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 299: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 303
	i32 1879696579, ; 300: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 301: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 224
	i32 1888955245, ; 302: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 303: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 304: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 297
	i32 1898237753, ; 305: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 306: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 307: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 308: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 309: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 308
	i32 1956758971, ; 310: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 311: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 270
	i32 1968388702, ; 312: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 186
	i32 1983156543, ; 313: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 290
	i32 1985761444, ; 314: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 215
	i32 2003115576, ; 315: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 300
	i32 2011961780, ; 316: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 317: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 255
	i32 2031763787, ; 318: Xamarin.Android.Glide => 0x791a414b => 212
	i32 2045470958, ; 319: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 320: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 188
	i32 2055257422, ; 321: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 250
	i32 2060060697, ; 322: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 323: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 299
	i32 2070888862, ; 324: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 325: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 196
	i32 2079903147, ; 326: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 327: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 328: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 329: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 330: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 331: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2151282119, ; 332: Origami.App => 0x8039f5c7 => 0
	i32 2159891885, ; 333: Microsoft.Maui => 0x80bd55ad => 208
	i32 2169148018, ; 334: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 307
	i32 2181898931, ; 335: Microsoft.Extensions.Options.dll => 0x820d22b3 => 201
	i32 2192057212, ; 336: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 199
	i32 2192166651, ; 337: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 179
	i32 2193016926, ; 338: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 339: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 294
	i32 2201231467, ; 340: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 341: it\Microsoft.Maui.Controls.resources => 0x839595db => 309
	i32 2217644978, ; 342: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 277
	i32 2222056684, ; 343: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 344: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 259
	i32 2252106437, ; 345: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 346: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 347: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 348: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 187
	i32 2267999099, ; 349: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 214
	i32 2279755925, ; 350: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 266
	i32 2293034957, ; 351: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 352: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 353: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 354: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 313
	i32 2305521784, ; 355: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2311968808, ; 356: Blazored.LocalStorage.dll => 0x89cdd828 => 173
	i32 2315684594, ; 357: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 218
	i32 2320631194, ; 358: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 359: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 360: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 361: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 362: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 307
	i32 2368005991, ; 363: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 364: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 186
	i32 2378619854, ; 365: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 366: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 367: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 308
	i32 2401565422, ; 368: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 369: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 241
	i32 2411328690, ; 370: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 178
	i32 2421380589, ; 371: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 372: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 228
	i32 2427813419, ; 373: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 305
	i32 2435356389, ; 374: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 375: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 376: Microsoft.JSInterop.dll => 0x919672ca => 203
	i32 2454642406, ; 377: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 378: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 379: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 380: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 231
	i32 2471841756, ; 381: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 382: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 383: Microsoft.Maui.Controls => 0x93dba8a1 => 206
	i32 2483903535, ; 384: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 385: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 386: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 387: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 388: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 311
	i32 2505896520, ; 389: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 253
	i32 2522472828, ; 390: Xamarin.Android.Glide.dll => 0x9659e17c => 212
	i32 2537015816, ; 391: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 177
	i32 2538310050, ; 392: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 393: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 306
	i32 2562349572, ; 394: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 395: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 396: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 310
	i32 2581783588, ; 397: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 254
	i32 2581819634, ; 398: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 276
	i32 2585220780, ; 399: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 400: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 401: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 180
	i32 2589602615, ; 402: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 403: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 193
	i32 2593496499, ; 404: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 315
	i32 2605712449, ; 405: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 294
	i32 2615233544, ; 406: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 245
	i32 2616218305, ; 407: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 200
	i32 2617129537, ; 408: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 409: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 410: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 235
	i32 2624644809, ; 411: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 240
	i32 2626831493, ; 412: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 310
	i32 2627185994, ; 413: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2627811740, ; 414: Microsoft.AspNetCore.Components.WebAssembly.dll => 0x9ca1399c => 182
	i32 2629843544, ; 415: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 416: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 249
	i32 2646186088, ; 417: Blazored.Toast.dll => 0x9db99868 => 175
	i32 2663391936, ; 418: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 214
	i32 2663698177, ; 419: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 420: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 421: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 422: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 423: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 424: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 183
	i32 2693849962, ; 425: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 426: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 274
	i32 2715334215, ; 427: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 428: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 429: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 430: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 431: Xamarin.AndroidX.Activity => 0xa2e0939b => 216
	i32 2735172069, ; 432: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 433: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 177
	i32 2737747696, ; 434: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 222
	i32 2740698338, ; 435: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 296
	i32 2740948882, ; 436: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 437: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 438: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 316
	i32 2758225723, ; 439: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 207
	i32 2764765095, ; 440: Microsoft.Maui.dll => 0xa4caf7a7 => 208
	i32 2765824710, ; 441: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 442: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 288
	i32 2778768386, ; 443: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 279
	i32 2779977773, ; 444: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 267
	i32 2785988530, ; 445: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 322
	i32 2788224221, ; 446: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 245
	i32 2801831435, ; 447: Microsoft.Maui.Graphics => 0xa7008e0b => 210
	i32 2803228030, ; 448: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 449: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 232
	i32 2819470561, ; 450: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 451: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 452: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 267
	i32 2824502124, ; 453: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2833784645, ; 454: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 185
	i32 2838993487, ; 455: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 256
	i32 2849599387, ; 456: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2849915857, ; 457: Blazored.SessionStorage.dll => 0xa9de43d1 => 174
	i32 2853208004, ; 458: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 279
	i32 2855708567, ; 459: Xamarin.AndroidX.Transition => 0xaa36a797 => 275
	i32 2861098320, ; 460: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 461: Microsoft.Maui.Essentials => 0xaa8a4878 => 209
	i32 2870099610, ; 462: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 217
	i32 2875164099, ; 463: Jsr305Binding.dll => 0xab5f85c3 => 284
	i32 2875220617, ; 464: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 465: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 243
	i32 2887636118, ; 466: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 467: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 181
	i32 2899753641, ; 468: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 469: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 470: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 471: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 472: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 473: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 196
	i32 2916838712, ; 474: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 280
	i32 2919462931, ; 475: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 476: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 219
	i32 2936416060, ; 477: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 478: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 479: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 480: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 481: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 482: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 483: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 239
	i32 2987532451, ; 484: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 270
	i32 2996846495, ; 485: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 252
	i32 3016983068, ; 486: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 272
	i32 3023353419, ; 487: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 488: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 247
	i32 3038032645, ; 489: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 330
	i32 3053864966, ; 490: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 302
	i32 3056245963, ; 491: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 269
	i32 3057625584, ; 492: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 260
	i32 3059408633, ; 493: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 494: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 495: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 496: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 497: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 498: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 499: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 500: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 501: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 502: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 503: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 504: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 505: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 506: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 507: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 261
	i32 3192346100, ; 508: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 509: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 510: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 511: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 512: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 238
	i32 3220365878, ; 513: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 514: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 515: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 516: Xamarin.AndroidX.CardView => 0xc235e84d => 226
	i32 3265493905, ; 517: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 518: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 519: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 520: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 521: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 522: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 523: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 524: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 525: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 302
	i32 3316684772, ; 526: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 527: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 236
	i32 3317144872, ; 528: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 529: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 224
	i32 3345895724, ; 530: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 265
	i32 3346324047, ; 531: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 262
	i32 3357674450, ; 532: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 319
	i32 3358260929, ; 533: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 534: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 217
	i32 3362522851, ; 535: Xamarin.AndroidX.Core => 0xc86c06e3 => 233
	i32 3366347497, ; 536: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 537: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 266
	i32 3381016424, ; 538: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 298
	i32 3395150330, ; 539: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 540: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 541: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 237
	i32 3406629867, ; 542: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 194
	i32 3421170118, ; 543: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 188
	i32 3428513518, ; 544: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 191
	i32 3429136800, ; 545: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 546: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 547: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 240
	i32 3445260447, ; 548: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 549: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 205
	i32 3458724246, ; 550: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 317
	i32 3464190856, ; 551: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 180
	i32 3471940407, ; 552: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 553: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 554: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 318
	i32 3485117614, ; 555: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 556: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 557: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 229
	i32 3500000672, ; 558: Microsoft.JSInterop => 0xd09dc5a0 => 203
	i32 3509114376, ; 559: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 560: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 561: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 562: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 563: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 564: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 565: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 326
	i32 3592228221, ; 566: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 328
	i32 3597029428, ; 567: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 215
	i32 3598340787, ; 568: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 569: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 570: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 571: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 264
	i32 3633644679, ; 572: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 219
	i32 3638274909, ; 573: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 574: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 250
	i32 3643446276, ; 575: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 323
	i32 3643854240, ; 576: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 261
	i32 3645089577, ; 577: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 578: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 187
	i32 3660523487, ; 579: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 580: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 581: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 225
	i32 3684561358, ; 582: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 229
	i32 3700866549, ; 583: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 584: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 234
	i32 3716563718, ; 585: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 586: Xamarin.AndroidX.Annotation => 0xdda814c6 => 218
	i32 3722202641, ; 587: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 190
	i32 3724971120, ; 588: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 260
	i32 3732100267, ; 589: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 590: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 185
	i32 3737834244, ; 591: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 592: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 593: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 594: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 298
	i32 3758424670, ; 595: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 189
	i32 3786282454, ; 596: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 227
	i32 3792276235, ; 597: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 598: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 205
	i32 3802395368, ; 599: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 600: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 601: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 602: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 603: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 192
	i32 3844307129, ; 604: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 605: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 606: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 607: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 608: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 609: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 610: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 275
	i32 3888767677, ; 611: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 265
	i32 3896106733, ; 612: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 613: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 233
	i32 3901907137, ; 614: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 615: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 314
	i32 3920810846, ; 616: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 617: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 278
	i32 3928044579, ; 618: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 619: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 620: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 263
	i32 3945713374, ; 621: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 622: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 623: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 221
	i32 3959773229, ; 624: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 252
	i32 4003436829, ; 625: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 626: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 220
	i32 4023392905, ; 627: System.IO.Pipelines => 0xefd01a89 => 211
	i32 4025784931, ; 628: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 629: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 207
	i32 4054681211, ; 630: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 631: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 632: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 633: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 300
	i32 4094352644, ; 634: Microsoft.Maui.Essentials.dll => 0xf40add04 => 209
	i32 4099507663, ; 635: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 636: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 637: Xamarin.AndroidX.Emoji2 => 0xf479582c => 241
	i32 4103439459, ; 638: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 324
	i32 4126470640, ; 639: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 191
	i32 4127667938, ; 640: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 641: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 642: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 643: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 324
	i32 4151237749, ; 644: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 645: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 646: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 647: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 648: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 649: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 257
	i32 4185676441, ; 650: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 651: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 652: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 653: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 313
	i32 4256097574, ; 654: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 234
	i32 4258378803, ; 655: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 256
	i32 4260525087, ; 656: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 657: Microsoft.Maui.Controls.dll => 0xfea12dee => 206
	i32 4274976490, ; 658: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 659: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 257
	i32 4294648842, ; 660: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 195
	i32 4294763496 ; 661: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 243
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [662 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 253, ; 3
	i32 287, ; 4
	i32 48, ; 5
	i32 295, ; 6
	i32 80, ; 7
	i32 304, ; 8
	i32 145, ; 9
	i32 30, ; 10
	i32 328, ; 11
	i32 124, ; 12
	i32 210, ; 13
	i32 102, ; 14
	i32 312, ; 15
	i32 271, ; 16
	i32 0, ; 17
	i32 107, ; 18
	i32 271, ; 19
	i32 139, ; 20
	i32 291, ; 21
	i32 327, ; 22
	i32 320, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 227, ; 27
	i32 329, ; 28
	i32 132, ; 29
	i32 273, ; 30
	i32 151, ; 31
	i32 18, ; 32
	i32 225, ; 33
	i32 26, ; 34
	i32 247, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 179, ; 39
	i32 91, ; 40
	i32 178, ; 41
	i32 230, ; 42
	i32 147, ; 43
	i32 249, ; 44
	i32 246, ; 45
	i32 54, ; 46
	i32 69, ; 47
	i32 325, ; 48
	i32 216, ; 49
	i32 83, ; 50
	i32 303, ; 51
	i32 248, ; 52
	i32 131, ; 53
	i32 55, ; 54
	i32 149, ; 55
	i32 74, ; 56
	i32 145, ; 57
	i32 62, ; 58
	i32 146, ; 59
	i32 330, ; 60
	i32 165, ; 61
	i32 323, ; 62
	i32 231, ; 63
	i32 12, ; 64
	i32 244, ; 65
	i32 125, ; 66
	i32 152, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 246, ; 71
	i32 259, ; 72
	i32 301, ; 73
	i32 204, ; 74
	i32 84, ; 75
	i32 202, ; 76
	i32 150, ; 77
	i32 291, ; 78
	i32 60, ; 79
	i32 322, ; 80
	i32 198, ; 81
	i32 51, ; 82
	i32 103, ; 83
	i32 114, ; 84
	i32 40, ; 85
	i32 284, ; 86
	i32 282, ; 87
	i32 195, ; 88
	i32 120, ; 89
	i32 52, ; 90
	i32 44, ; 91
	i32 119, ; 92
	i32 236, ; 93
	i32 314, ; 94
	i32 242, ; 95
	i32 81, ; 96
	i32 136, ; 97
	i32 278, ; 98
	i32 223, ; 99
	i32 8, ; 100
	i32 73, ; 101
	i32 155, ; 102
	i32 293, ; 103
	i32 154, ; 104
	i32 92, ; 105
	i32 288, ; 106
	i32 45, ; 107
	i32 292, ; 108
	i32 109, ; 109
	i32 129, ; 110
	i32 25, ; 111
	i32 213, ; 112
	i32 72, ; 113
	i32 55, ; 114
	i32 46, ; 115
	i32 320, ; 116
	i32 201, ; 117
	i32 237, ; 118
	i32 184, ; 119
	i32 22, ; 120
	i32 251, ; 121
	i32 86, ; 122
	i32 43, ; 123
	i32 160, ; 124
	i32 71, ; 125
	i32 264, ; 126
	i32 305, ; 127
	i32 3, ; 128
	i32 42, ; 129
	i32 63, ; 130
	i32 319, ; 131
	i32 16, ; 132
	i32 53, ; 133
	i32 316, ; 134
	i32 287, ; 135
	i32 105, ; 136
	i32 292, ; 137
	i32 309, ; 138
	i32 285, ; 139
	i32 248, ; 140
	i32 34, ; 141
	i32 158, ; 142
	i32 85, ; 143
	i32 32, ; 144
	i32 318, ; 145
	i32 12, ; 146
	i32 51, ; 147
	i32 197, ; 148
	i32 56, ; 149
	i32 268, ; 150
	i32 36, ; 151
	i32 192, ; 152
	i32 286, ; 153
	i32 221, ; 154
	i32 35, ; 155
	i32 299, ; 156
	i32 58, ; 157
	i32 255, ; 158
	i32 176, ; 159
	i32 17, ; 160
	i32 289, ; 161
	i32 164, ; 162
	i32 189, ; 163
	i32 321, ; 164
	i32 315, ; 165
	i32 311, ; 166
	i32 254, ; 167
	i32 200, ; 168
	i32 281, ; 169
	i32 317, ; 170
	i32 153, ; 171
	i32 193, ; 172
	i32 277, ; 173
	i32 262, ; 174
	i32 223, ; 175
	i32 29, ; 176
	i32 52, ; 177
	i32 282, ; 178
	i32 5, ; 179
	i32 297, ; 180
	i32 272, ; 181
	i32 276, ; 182
	i32 228, ; 183
	i32 293, ; 184
	i32 220, ; 185
	i32 239, ; 186
	i32 306, ; 187
	i32 85, ; 188
	i32 281, ; 189
	i32 61, ; 190
	i32 112, ; 191
	i32 326, ; 192
	i32 57, ; 193
	i32 327, ; 194
	i32 268, ; 195
	i32 99, ; 196
	i32 19, ; 197
	i32 232, ; 198
	i32 111, ; 199
	i32 101, ; 200
	i32 329, ; 201
	i32 102, ; 202
	i32 295, ; 203
	i32 104, ; 204
	i32 285, ; 205
	i32 71, ; 206
	i32 38, ; 207
	i32 32, ; 208
	i32 194, ; 209
	i32 103, ; 210
	i32 73, ; 211
	i32 301, ; 212
	i32 9, ; 213
	i32 123, ; 214
	i32 46, ; 215
	i32 222, ; 216
	i32 202, ; 217
	i32 9, ; 218
	i32 43, ; 219
	i32 4, ; 220
	i32 269, ; 221
	i32 197, ; 222
	i32 325, ; 223
	i32 31, ; 224
	i32 138, ; 225
	i32 92, ; 226
	i32 184, ; 227
	i32 93, ; 228
	i32 182, ; 229
	i32 49, ; 230
	i32 141, ; 231
	i32 112, ; 232
	i32 140, ; 233
	i32 238, ; 234
	i32 115, ; 235
	i32 286, ; 236
	i32 157, ; 237
	i32 76, ; 238
	i32 175, ; 239
	i32 79, ; 240
	i32 258, ; 241
	i32 37, ; 242
	i32 280, ; 243
	i32 190, ; 244
	i32 242, ; 245
	i32 235, ; 246
	i32 64, ; 247
	i32 138, ; 248
	i32 15, ; 249
	i32 183, ; 250
	i32 116, ; 251
	i32 274, ; 252
	i32 283, ; 253
	i32 230, ; 254
	i32 48, ; 255
	i32 70, ; 256
	i32 80, ; 257
	i32 173, ; 258
	i32 126, ; 259
	i32 94, ; 260
	i32 121, ; 261
	i32 290, ; 262
	i32 26, ; 263
	i32 174, ; 264
	i32 251, ; 265
	i32 97, ; 266
	i32 28, ; 267
	i32 226, ; 268
	i32 296, ; 269
	i32 149, ; 270
	i32 211, ; 271
	i32 169, ; 272
	i32 4, ; 273
	i32 98, ; 274
	i32 181, ; 275
	i32 33, ; 276
	i32 93, ; 277
	i32 273, ; 278
	i32 198, ; 279
	i32 21, ; 280
	i32 41, ; 281
	i32 170, ; 282
	i32 312, ; 283
	i32 244, ; 284
	i32 304, ; 285
	i32 258, ; 286
	i32 289, ; 287
	i32 283, ; 288
	i32 263, ; 289
	i32 2, ; 290
	i32 134, ; 291
	i32 111, ; 292
	i32 199, ; 293
	i32 213, ; 294
	i32 321, ; 295
	i32 58, ; 296
	i32 204, ; 297
	i32 95, ; 298
	i32 303, ; 299
	i32 39, ; 300
	i32 224, ; 301
	i32 25, ; 302
	i32 94, ; 303
	i32 297, ; 304
	i32 89, ; 305
	i32 99, ; 306
	i32 10, ; 307
	i32 87, ; 308
	i32 308, ; 309
	i32 100, ; 310
	i32 270, ; 311
	i32 186, ; 312
	i32 290, ; 313
	i32 215, ; 314
	i32 300, ; 315
	i32 7, ; 316
	i32 255, ; 317
	i32 212, ; 318
	i32 88, ; 319
	i32 188, ; 320
	i32 250, ; 321
	i32 154, ; 322
	i32 299, ; 323
	i32 33, ; 324
	i32 196, ; 325
	i32 116, ; 326
	i32 82, ; 327
	i32 20, ; 328
	i32 11, ; 329
	i32 162, ; 330
	i32 3, ; 331
	i32 0, ; 332
	i32 208, ; 333
	i32 307, ; 334
	i32 201, ; 335
	i32 199, ; 336
	i32 179, ; 337
	i32 84, ; 338
	i32 294, ; 339
	i32 64, ; 340
	i32 309, ; 341
	i32 277, ; 342
	i32 143, ; 343
	i32 259, ; 344
	i32 157, ; 345
	i32 41, ; 346
	i32 117, ; 347
	i32 187, ; 348
	i32 214, ; 349
	i32 266, ; 350
	i32 131, ; 351
	i32 75, ; 352
	i32 66, ; 353
	i32 313, ; 354
	i32 172, ; 355
	i32 173, ; 356
	i32 218, ; 357
	i32 143, ; 358
	i32 106, ; 359
	i32 151, ; 360
	i32 70, ; 361
	i32 307, ; 362
	i32 156, ; 363
	i32 186, ; 364
	i32 121, ; 365
	i32 127, ; 366
	i32 308, ; 367
	i32 152, ; 368
	i32 241, ; 369
	i32 178, ; 370
	i32 141, ; 371
	i32 228, ; 372
	i32 305, ; 373
	i32 20, ; 374
	i32 14, ; 375
	i32 203, ; 376
	i32 135, ; 377
	i32 75, ; 378
	i32 59, ; 379
	i32 231, ; 380
	i32 167, ; 381
	i32 168, ; 382
	i32 206, ; 383
	i32 15, ; 384
	i32 74, ; 385
	i32 6, ; 386
	i32 23, ; 387
	i32 311, ; 388
	i32 253, ; 389
	i32 212, ; 390
	i32 177, ; 391
	i32 91, ; 392
	i32 306, ; 393
	i32 1, ; 394
	i32 136, ; 395
	i32 310, ; 396
	i32 254, ; 397
	i32 276, ; 398
	i32 134, ; 399
	i32 69, ; 400
	i32 180, ; 401
	i32 146, ; 402
	i32 193, ; 403
	i32 315, ; 404
	i32 294, ; 405
	i32 245, ; 406
	i32 200, ; 407
	i32 88, ; 408
	i32 96, ; 409
	i32 235, ; 410
	i32 240, ; 411
	i32 310, ; 412
	i32 31, ; 413
	i32 182, ; 414
	i32 45, ; 415
	i32 249, ; 416
	i32 175, ; 417
	i32 214, ; 418
	i32 109, ; 419
	i32 158, ; 420
	i32 35, ; 421
	i32 22, ; 422
	i32 114, ; 423
	i32 183, ; 424
	i32 57, ; 425
	i32 274, ; 426
	i32 144, ; 427
	i32 118, ; 428
	i32 120, ; 429
	i32 110, ; 430
	i32 216, ; 431
	i32 139, ; 432
	i32 177, ; 433
	i32 222, ; 434
	i32 296, ; 435
	i32 54, ; 436
	i32 105, ; 437
	i32 316, ; 438
	i32 207, ; 439
	i32 208, ; 440
	i32 133, ; 441
	i32 288, ; 442
	i32 279, ; 443
	i32 267, ; 444
	i32 322, ; 445
	i32 245, ; 446
	i32 210, ; 447
	i32 159, ; 448
	i32 232, ; 449
	i32 163, ; 450
	i32 132, ; 451
	i32 267, ; 452
	i32 161, ; 453
	i32 185, ; 454
	i32 256, ; 455
	i32 140, ; 456
	i32 174, ; 457
	i32 279, ; 458
	i32 275, ; 459
	i32 169, ; 460
	i32 209, ; 461
	i32 217, ; 462
	i32 284, ; 463
	i32 40, ; 464
	i32 243, ; 465
	i32 81, ; 466
	i32 181, ; 467
	i32 56, ; 468
	i32 37, ; 469
	i32 97, ; 470
	i32 166, ; 471
	i32 172, ; 472
	i32 196, ; 473
	i32 280, ; 474
	i32 82, ; 475
	i32 219, ; 476
	i32 98, ; 477
	i32 30, ; 478
	i32 159, ; 479
	i32 18, ; 480
	i32 127, ; 481
	i32 119, ; 482
	i32 239, ; 483
	i32 270, ; 484
	i32 252, ; 485
	i32 272, ; 486
	i32 165, ; 487
	i32 247, ; 488
	i32 330, ; 489
	i32 302, ; 490
	i32 269, ; 491
	i32 260, ; 492
	i32 170, ; 493
	i32 16, ; 494
	i32 144, ; 495
	i32 125, ; 496
	i32 118, ; 497
	i32 38, ; 498
	i32 115, ; 499
	i32 47, ; 500
	i32 142, ; 501
	i32 117, ; 502
	i32 34, ; 503
	i32 176, ; 504
	i32 95, ; 505
	i32 53, ; 506
	i32 261, ; 507
	i32 129, ; 508
	i32 153, ; 509
	i32 24, ; 510
	i32 161, ; 511
	i32 238, ; 512
	i32 148, ; 513
	i32 104, ; 514
	i32 89, ; 515
	i32 226, ; 516
	i32 60, ; 517
	i32 142, ; 518
	i32 100, ; 519
	i32 5, ; 520
	i32 13, ; 521
	i32 122, ; 522
	i32 135, ; 523
	i32 28, ; 524
	i32 302, ; 525
	i32 72, ; 526
	i32 236, ; 527
	i32 24, ; 528
	i32 224, ; 529
	i32 265, ; 530
	i32 262, ; 531
	i32 319, ; 532
	i32 137, ; 533
	i32 217, ; 534
	i32 233, ; 535
	i32 168, ; 536
	i32 266, ; 537
	i32 298, ; 538
	i32 101, ; 539
	i32 123, ; 540
	i32 237, ; 541
	i32 194, ; 542
	i32 188, ; 543
	i32 191, ; 544
	i32 163, ; 545
	i32 167, ; 546
	i32 240, ; 547
	i32 39, ; 548
	i32 205, ; 549
	i32 317, ; 550
	i32 180, ; 551
	i32 17, ; 552
	i32 171, ; 553
	i32 318, ; 554
	i32 137, ; 555
	i32 150, ; 556
	i32 229, ; 557
	i32 203, ; 558
	i32 155, ; 559
	i32 130, ; 560
	i32 19, ; 561
	i32 65, ; 562
	i32 147, ; 563
	i32 47, ; 564
	i32 326, ; 565
	i32 328, ; 566
	i32 215, ; 567
	i32 79, ; 568
	i32 61, ; 569
	i32 106, ; 570
	i32 264, ; 571
	i32 219, ; 572
	i32 49, ; 573
	i32 250, ; 574
	i32 323, ; 575
	i32 261, ; 576
	i32 14, ; 577
	i32 187, ; 578
	i32 68, ; 579
	i32 171, ; 580
	i32 225, ; 581
	i32 229, ; 582
	i32 78, ; 583
	i32 234, ; 584
	i32 108, ; 585
	i32 218, ; 586
	i32 190, ; 587
	i32 260, ; 588
	i32 67, ; 589
	i32 185, ; 590
	i32 63, ; 591
	i32 27, ; 592
	i32 160, ; 593
	i32 298, ; 594
	i32 189, ; 595
	i32 227, ; 596
	i32 10, ; 597
	i32 205, ; 598
	i32 11, ; 599
	i32 78, ; 600
	i32 126, ; 601
	i32 83, ; 602
	i32 192, ; 603
	i32 66, ; 604
	i32 107, ; 605
	i32 65, ; 606
	i32 128, ; 607
	i32 122, ; 608
	i32 77, ; 609
	i32 275, ; 610
	i32 265, ; 611
	i32 8, ; 612
	i32 233, ; 613
	i32 2, ; 614
	i32 314, ; 615
	i32 44, ; 616
	i32 278, ; 617
	i32 156, ; 618
	i32 128, ; 619
	i32 263, ; 620
	i32 23, ; 621
	i32 133, ; 622
	i32 221, ; 623
	i32 252, ; 624
	i32 29, ; 625
	i32 220, ; 626
	i32 211, ; 627
	i32 62, ; 628
	i32 207, ; 629
	i32 90, ; 630
	i32 87, ; 631
	i32 148, ; 632
	i32 300, ; 633
	i32 209, ; 634
	i32 36, ; 635
	i32 86, ; 636
	i32 241, ; 637
	i32 324, ; 638
	i32 191, ; 639
	i32 50, ; 640
	i32 6, ; 641
	i32 90, ; 642
	i32 324, ; 643
	i32 21, ; 644
	i32 162, ; 645
	i32 96, ; 646
	i32 50, ; 647
	i32 113, ; 648
	i32 257, ; 649
	i32 130, ; 650
	i32 76, ; 651
	i32 27, ; 652
	i32 313, ; 653
	i32 234, ; 654
	i32 256, ; 655
	i32 7, ; 656
	i32 206, ; 657
	i32 110, ; 658
	i32 257, ; 659
	i32 195, ; 660
	i32 243 ; 661
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
