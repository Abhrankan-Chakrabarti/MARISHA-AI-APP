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

@assembly_image_cache = dso_local local_unnamed_addr global [130 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [390 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 73
	i64 u0x0075ea86498d3e4d, ; 1: OpenAI => 48
	i64 u0x02123411c4e01926, ; 2: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 69
	i64 u0x02abedc11addc1ed, ; 3: lib_Mono.Android.Runtime.dll.so => 128
	i64 u0x032267b2a94db371, ; 4: lib_Xamarin.AndroidX.AppCompat.dll.so => 52
	i64 u0x043032f1d071fae0, ; 5: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 6: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 7: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 8: System.Net.Primitives => 100
	i64 u0x0565d18c6da3de38, ; 9: Xamarin.AndroidX.RecyclerView => 71
	i64 u0x0581db89237110e9, ; 10: lib_System.Collections.dll.so => 84
	i64 u0x05989cb940b225a9, ; 11: Microsoft.Maui.dll => 45
	i64 u0x06076b5d2b581f08, ; 12: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x0680a433c781bb3d, ; 13: Xamarin.AndroidX.Collection.Jvm => 55
	i64 u0x07c57877c7ba78ad, ; 14: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 15: System.Collections.NonGeneric => 82
	i64 u0x08f3c9788ee2153c, ; 16: Xamarin.AndroidX.DrawerLayout => 60
	i64 u0x0919c28b89381a0b, ; 17: lib_Microsoft.Extensions.Options.dll.so => 41
	i64 u0x092266563089ae3e, ; 18: lib_System.Collections.NonGeneric.dll.so => 82
	i64 u0x095cacaf6b6a32e4, ; 19: System.Memory.Data => 50
	i64 u0x09d144a7e214d457, ; 20: System.Security.Cryptography => 116
	i64 u0x0abb3e2b271edc45, ; 21: System.Threading.Channels.dll => 120
	i64 u0x0b3b632c3bbee20c, ; 22: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 23: Xamarin.KotlinX.Serialization.Core.Jvm => 79
	i64 u0x0be2e1f8ce4064ed, ; 24: Xamarin.AndroidX.ViewPager => 74
	i64 u0x0c3ca6cc978e2aae, ; 25: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c59ad9fbbd43abe, ; 26: Mono.Android => 129
	i64 u0x0c7790f60165fc06, ; 27: lib_Microsoft.Maui.Essentials.dll.so => 46
	i64 u0x0e14e73a54dda68e, ; 28: lib_System.Net.NameResolution.dll.so => 98
	i64 u0x102a31b45304b1da, ; 29: Xamarin.AndroidX.CustomView => 59
	i64 u0x10f6cfcbcf801616, ; 30: System.IO.Compression.Brotli => 91
	i64 u0x11a70d0e1009fb11, ; 31: System.Net.WebSockets.dll => 106
	i64 u0x125b7f94acb989db, ; 32: Xamarin.AndroidX.RecyclerView.dll => 71
	i64 u0x13a01de0cbc3f06c, ; 33: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 34: lib_Java.Interop.dll.so => 127
	i64 u0x13f1e880c25d96d1, ; 35: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 36: Microsoft.Extensions.DependencyInjection.Abstractions => 38
	i64 u0x1497051b917530bd, ; 37: lib_System.Net.WebSockets.dll.so => 106
	i64 u0x17b56e25558a5d36, ; 38: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 39: System.Text.Encodings.Web => 117
	i64 u0x18402a709e357f3b, ; 40: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 79
	i64 u0x18f0ce884e87d89a, ; 41: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x1a91866a319e9259, ; 42: lib_System.Collections.Concurrent.dll.so => 81
	i64 u0x1aac34d1917ba5d3, ; 43: lib_System.dll.so => 125
	i64 u0x1aad60783ffa3e5b, ; 44: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c753b5ff15bce1b, ; 45: Mono.Android.Runtime.dll => 128
	i64 u0x1e3d87657e9659bc, ; 46: Xamarin.AndroidX.Navigation.UI => 70
	i64 u0x1e71143913d56c10, ; 47: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1ed8fcce5e9b50a0, ; 48: Microsoft.Extensions.Options.dll => 41
	i64 u0x209375905fcc1bad, ; 49: lib_System.IO.Compression.Brotli.dll.so => 91
	i64 u0x2174319c0d835bc9, ; 50: System.Runtime => 115
	i64 u0x2199f06354c82d3b, ; 51: System.ClientModel.dll => 49
	i64 u0x220fd4f2e7c48170, ; 52: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x237be844f1f812c7, ; 53: System.Threading.Thread.dll => 121
	i64 u0x2407aef2bbe8fadf, ; 54: System.Console => 88
	i64 u0x240abe014b27e7d3, ; 55: Xamarin.AndroidX.Core.dll => 57
	i64 u0x252073cc3caa62c2, ; 56: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x2662c629b96b0b30, ; 57: lib_Xamarin.Kotlin.StdLib.dll.so => 77
	i64 u0x268c1439f13bcc29, ; 58: lib_Microsoft.Extensions.Primitives.dll.so => 42
	i64 u0x273f3515de5faf0d, ; 59: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 60: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x2759af78ab94d39b, ; 61: System.Net.WebSockets => 106
	i64 u0x27b410442fad6cf1, ; 62: Java.Interop.dll => 127
	i64 u0x2801845a2c71fbfb, ; 63: System.Net.Primitives.dll => 100
	i64 u0x2a128783efe70ba0, ; 64: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 65: lib_System.Net.NetworkInformation.dll.so => 99
	i64 u0x2ad156c8e1354139, ; 66: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 67: System.Text.RegularExpressions.dll => 119
	i64 u0x2afc1c4f898552ee, ; 68: lib_System.Formats.Asn1.dll.so => 90
	i64 u0x2b148910ed40fbf9, ; 69: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2c8bd14bb93a7d82, ; 70: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2d169d318a968379, ; 71: System.Threading.dll => 122
	i64 u0x2d47774b7d993f59, ; 72: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 73: System.Text.Json.dll => 118
	i64 u0x2e6f1f226821322a, ; 74: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f2e98e1c89b1aff, ; 75: System.Xml.ReaderWriter => 124
	i64 u0x309ee9eeec09a71e, ; 76: lib_Xamarin.AndroidX.Fragment.dll.so => 61
	i64 u0x31195fef5d8fb552, ; 77: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 78: Xamarin.AndroidX.CardView.dll => 54
	i64 u0x329753a17a517811, ; 79: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 80: lib_System.Xml.ReaderWriter.dll.so => 124
	i64 u0x33a31443733849fe, ; 81: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 82: lib_System.Net.Sockets.dll.so => 103
	i64 u0x34dfd74fe2afcf37, ; 83: Microsoft.Maui => 45
	i64 u0x34e292762d9615df, ; 84: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 85: Microsoft.Maui.Controls => 43
	i64 u0x3549870798b4cd30, ; 86: lib_Xamarin.AndroidX.ViewPager2.dll.so => 75
	i64 u0x355282fc1c909694, ; 87: Microsoft.Extensions.Configuration => 35
	i64 u0x385c17636bb6fe6e, ; 88: Xamarin.AndroidX.CustomView.dll => 59
	i64 u0x38869c811d74050e, ; 89: System.Net.NameResolution.dll => 98
	i64 u0x393c226616977fdb, ; 90: lib_Xamarin.AndroidX.ViewPager.dll.so => 74
	i64 u0x395e37c3334cf82a, ; 91: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x3c7c495f58ac5ee9, ; 92: Xamarin.Kotlin.StdLib => 77
	i64 u0x3d9c2a242b040a50, ; 93: lib_Xamarin.AndroidX.Core.dll.so => 57
	i64 u0x407a10bb4bf95829, ; 94: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 67
	i64 u0x41cab042be111c34, ; 95: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 53
	i64 u0x434c4e1d9284cdae, ; 96: Mono.Android.dll => 129
	i64 u0x43950f84de7cc79a, ; 97: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x4515080865a951a5, ; 98: Xamarin.Kotlin.StdLib.dll => 77
	i64 u0x46a4213bc97fe5ae, ; 99: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x4787a936949fcac2, ; 100: System.Memory.Data.dll => 50
	i64 u0x47daf4e1afbada10, ; 101: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 102: System.ObjectModel => 108
	i64 u0x4a5667b2462a664b, ; 103: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 70
	i64 u0x4b7b6532ded934b7, ; 104: System.Text.Json => 118
	i64 u0x4b8f8ea3c2df6bb0, ; 105: System.ClientModel => 49
	i64 u0x4cc5f15266470798, ; 106: lib_Xamarin.AndroidX.Loader.dll.so => 66
	i64 u0x4cf6f67dc77aacd2, ; 107: System.Net.NetworkInformation.dll => 99
	i64 u0x4d3183dd245425d4, ; 108: System.Net.WebSockets.Client.dll => 105
	i64 u0x4d479f968a05e504, ; 109: System.Linq.Expressions.dll => 94
	i64 u0x4d55a010ffc4faff, ; 110: System.Private.Xml => 110
	i64 u0x4d6001db23f8cd87, ; 111: lib_System.ClientModel.dll.so => 49
	i64 u0x4d95fccc1f67c7ca, ; 112: System.Runtime.Loader.dll => 113
	i64 u0x4dcf44c3c9b076a2, ; 113: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 114: Xamarin.AndroidX.Loader.dll => 66
	i64 u0x4e32f00cb0937401, ; 115: Mono.Android.Runtime => 128
	i64 u0x4ebd0c4b82c5eefc, ; 116: lib_System.Threading.Channels.dll.so => 120
	i64 u0x4f21ee6ef9eb527e, ; 117: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x5037f0be3c28c7a3, ; 118: lib_Microsoft.Maui.Controls.dll.so => 43
	i64 u0x5131bbe80989093f, ; 119: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 64
	i64 u0x526ce79eb8e90527, ; 120: lib_System.Net.Primitives.dll.so => 100
	i64 u0x529ffe06f39ab8db, ; 121: Xamarin.AndroidX.Core => 57
	i64 u0x52ff996554dbf352, ; 122: Microsoft.Maui.Graphics => 47
	i64 u0x535f7e40e8fef8af, ; 123: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 124: System.Net.NetworkInformation => 99
	i64 u0x53be1038a61e8d44, ; 125: System.Runtime.InteropServices.RuntimeInformation.dll => 111
	i64 u0x53c3014b9437e684, ; 126: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x54795225dd1587af, ; 127: lib_System.Runtime.dll.so => 115
	i64 u0x556e8b63b660ab8b, ; 128: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 62
	i64 u0x5588627c9a108ec9, ; 129: System.Collections.Specialized => 83
	i64 u0x571c5cfbec5ae8e2, ; 130: System.Private.Uri => 109
	i64 u0x579a06fed6eec900, ; 131: System.Private.CoreLib.dll => 126
	i64 u0x57c542c14049b66d, ; 132: System.Diagnostics.DiagnosticSource => 89
	i64 u0x58601b2dda4a27b9, ; 133: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 134: Microsoft.Extensions.DependencyInjection.dll => 37
	i64 u0x5a70033ca9d003cb, ; 135: lib_System.Memory.Data.dll.so => 50
	i64 u0x5a89a886ae30258d, ; 136: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 56
	i64 u0x5a8f6699f4a1caa9, ; 137: lib_System.Threading.dll.so => 122
	i64 u0x5ae9cd33b15841bf, ; 138: System.ComponentModel => 87
	i64 u0x5b5f0e240a06a2a2, ; 139: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5c393624b8176517, ; 140: lib_Microsoft.Extensions.Logging.dll.so => 39
	i64 u0x5d0a4a29b02d9d3c, ; 141: System.Net.WebHeaderCollection.dll => 104
	i64 u0x5db0cbbd1028510e, ; 142: lib_System.Runtime.InteropServices.dll.so => 112
	i64 u0x5db30905d3e5013b, ; 143: Xamarin.AndroidX.Collection.Jvm.dll => 55
	i64 u0x5e467bc8f09ad026, ; 144: System.Collections.Specialized.dll => 83
	i64 u0x5ea92fdb19ec8c4c, ; 145: System.Text.Encodings.Web.dll => 117
	i64 u0x5eb8046dd40e9ac3, ; 146: System.ComponentModel.Primitives => 85
	i64 u0x5f2225e69bf082b9, ; 147: OpenAI.dll => 48
	i64 u0x5f36ccf5c6a57e24, ; 148: System.Xml.ReaderWriter.dll => 124
	i64 u0x5f9a2d823f664957, ; 149: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x609f4b7b63d802d4, ; 150: lib_Microsoft.Extensions.DependencyInjection.dll.so => 37
	i64 u0x60cd4e33d7e60134, ; 151: Xamarin.KotlinX.Coroutines.Core.Jvm => 78
	i64 u0x60f62d786afcf130, ; 152: System.Memory => 96
	i64 u0x61be8d1299194243, ; 153: Microsoft.Maui.Controls.Xaml => 44
	i64 u0x61d2cba29557038f, ; 154: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 155: lib_System.Runtime.Loader.dll.so => 113
	i64 u0x622eef6f9e59068d, ; 156: System.Private.CoreLib => 126
	i64 u0x6400f68068c1e9f1, ; 157: Xamarin.Google.Android.Material.dll => 76
	i64 u0x65ecac39144dd3cc, ; 158: Microsoft.Maui.Controls.dll => 43
	i64 u0x65ece51227bfa724, ; 159: lib_System.Runtime.Numerics.dll.so => 114
	i64 u0x6692e924eade1b29, ; 160: lib_System.Console.dll.so => 88
	i64 u0x66a4e5c6a3fb0bae, ; 161: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 64
	i64 u0x66d13304ce1a3efa, ; 162: Xamarin.AndroidX.CursorAdapter => 58
	i64 u0x68558ec653afa616, ; 163: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x68fbbbe2eb455198, ; 164: System.Formats.Asn1 => 90
	i64 u0x69063fc0ba8e6bdd, ; 165: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x6a4d7577b2317255, ; 166: System.Runtime.InteropServices.dll => 112
	i64 u0x6ace3b74b15ee4a4, ; 167: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6d12bfaa99c72b1f, ; 168: lib_Microsoft.Maui.Graphics.dll.so => 47
	i64 u0x6d79993361e10ef2, ; 169: Microsoft.Extensions.Primitives => 42
	i64 u0x6d86d56b84c8eb71, ; 170: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 58
	i64 u0x6d9bea6b3e895cf7, ; 171: Microsoft.Extensions.Primitives.dll => 42
	i64 u0x6e25a02c3833319a, ; 172: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 68
	i64 u0x6fd2265da78b93a4, ; 173: lib_Microsoft.Maui.dll.so => 45
	i64 u0x6fdfc7de82c33008, ; 174: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x7084a959e4948b0e, ; 175: lib_App.dll.so => 80
	i64 u0x70e99f48c05cb921, ; 176: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 177: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 178: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 179: System.ComponentModel.Primitives.dll => 85
	i64 u0x72b1fb4109e08d7b, ; 180: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x73e4ce94e2eb6ffc, ; 181: lib_System.Memory.dll.so => 96
	i64 u0x755a91767330b3d4, ; 182: lib_Microsoft.Extensions.Configuration.dll.so => 35
	i64 u0x76012e7334db86e5, ; 183: lib_Xamarin.AndroidX.SavedState.dll.so => 72
	i64 u0x76ca07b878f44da0, ; 184: System.Runtime.Numerics.dll => 114
	i64 u0x780bc73597a503a9, ; 185: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 186: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 187: Xamarin.AndroidX.Fragment.dll => 61
	i64 u0x7adb8da2ac89b647, ; 188: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bef86a4335c4870, ; 189: System.ComponentModel.TypeConverter => 86
	i64 u0x7c0820144cd34d6a, ; 190: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 191: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7d649b75d580bb42, ; 192: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 193: System.Numerics.Vectors => 107
	i64 u0x7dfc3d6d9d8d7b70, ; 194: System.Collections => 84
	i64 u0x7e946809d6008ef2, ; 195: lib_System.ObjectModel.dll.so => 108
	i64 u0x7ecc13347c8fd849, ; 196: lib_System.ComponentModel.dll.so => 87
	i64 u0x7f00ddd9b9ca5a13, ; 197: Xamarin.AndroidX.ViewPager.dll => 74
	i64 u0x7f9351cd44b1273f, ; 198: Microsoft.Extensions.Configuration.Abstractions => 36
	i64 u0x7fbd557c99b3ce6f, ; 199: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 63
	i64 u0x812c069d5cdecc17, ; 200: System.dll => 125
	i64 u0x81ab745f6c0f5ce6, ; 201: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 202: Xamarin.AndroidX.AppCompat => 52
	i64 u0x828f06563b30bc50, ; 203: lib_Xamarin.AndroidX.CardView.dll.so => 54
	i64 u0x82f6403342e12049, ; 204: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83c14ba66c8e2b8c, ; 205: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x86a909228dc7657b, ; 206: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 207: Microsoft.Extensions.Configuration.dll => 35
	i64 u0x87c69b87d9283884, ; 208: lib_System.Threading.Thread.dll.so => 121
	i64 u0x87f6569b25707834, ; 209: System.IO.Compression.Brotli.dll => 91
	i64 u0x8842b3a5d2d3fb36, ; 210: Microsoft.Maui.Essentials => 46
	i64 u0x88bda98e0cffb7a9, ; 211: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 78
	i64 u0x897a606c9e39c75f, ; 212: lib_System.ComponentModel.Primitives.dll.so => 85
	i64 u0x89c5188089ec2cd5, ; 213: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 111
	i64 u0x8ad229ea26432ee2, ; 214: Xamarin.AndroidX.Loader => 66
	i64 u0x8b4ff5d0fdd5faa1, ; 215: lib_System.Diagnostics.DiagnosticSource.dll.so => 89
	i64 u0x8b9ceca7acae3451, ; 216: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8d0f420977c2c1c7, ; 217: Xamarin.AndroidX.CursorAdapter.dll => 58
	i64 u0x8d7b8ab4b3310ead, ; 218: System.Threading => 122
	i64 u0x8da188285aadfe8e, ; 219: System.Collections.Concurrent => 81
	i64 u0x8ed807bfe9858dfc, ; 220: Xamarin.AndroidX.Navigation.Common => 67
	i64 u0x8ee08b8194a30f48, ; 221: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 222: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8f32c6f611f6ffab, ; 223: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 224: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x903101b46fb73a04, ; 225: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 226: lib_System.IO.Compression.dll.so => 92
	i64 u0x90634f86c5ebe2b5, ; 227: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 64
	i64 u0x907b636704ad79ef, ; 228: lib_Microsoft.Maui.Controls.Xaml.dll.so => 44
	i64 u0x91418dc638b29e68, ; 229: lib_Xamarin.AndroidX.CustomView.dll.so => 59
	i64 u0x9157bd523cd7ed36, ; 230: lib_System.Text.Json.dll.so => 118
	i64 u0x91a74f07b30d37e2, ; 231: System.Linq.dll => 95
	i64 u0x91fa41a87223399f, ; 232: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 233: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 234: System.IO.Compression.dll => 92
	i64 u0x967fc325e09bfa8c, ; 235: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 236: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 237: Microsoft.Maui.Graphics.dll => 47
	i64 u0x97b8c771ea3e4220, ; 238: System.ComponentModel.dll => 87
	i64 u0x97e144c9d3c6976e, ; 239: System.Collections.Concurrent.dll => 81
	i64 u0x991d510397f92d9d, ; 240: System.Linq.Expressions => 94
	i64 u0x99a00ca5270c6878, ; 241: Xamarin.AndroidX.Navigation.Runtime => 69
	i64 u0x99cdc6d1f2d3a72f, ; 242: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9d5dbcf5a48583fe, ; 243: lib_Xamarin.AndroidX.Activity.dll.so => 51
	i64 u0x9d74dee1a7725f34, ; 244: Microsoft.Extensions.Configuration.Abstractions.dll => 36
	i64 u0x9e4534b6adaf6e84, ; 245: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9eaf1efdf6f7267e, ; 246: Xamarin.AndroidX.Navigation.Common.dll => 67
	i64 u0x9ef542cf1f78c506, ; 247: Xamarin.AndroidX.Lifecycle.LiveData.Core => 63
	i64 u0xa0d8259f4cc284ec, ; 248: lib_System.Security.Cryptography.dll.so => 116
	i64 u0xa1440773ee9d341e, ; 249: Xamarin.Google.Android.Material => 76
	i64 u0xa1b9d7c27f47219f, ; 250: Xamarin.AndroidX.Navigation.UI.dll => 70
	i64 u0xa2572680829d2c7c, ; 251: System.IO.Pipelines.dll => 93
	i64 u0xa46aa1eaa214539b, ; 252: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa5e599d1e0524750, ; 253: System.Numerics.Vectors.dll => 107
	i64 u0xa5f1ba49b85dd355, ; 254: System.Security.Cryptography.dll => 116
	i64 u0xa67dbee13e1df9ca, ; 255: Xamarin.AndroidX.SavedState.dll => 72
	i64 u0xa68a420042bb9b1f, ; 256: Xamarin.AndroidX.DrawerLayout.dll => 60
	i64 u0xa78ce3745383236a, ; 257: Xamarin.AndroidX.Lifecycle.Common.Jvm => 62
	i64 u0xa7c31b56b4dc7b33, ; 258: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xaa2219c8e3449ff5, ; 259: Microsoft.Extensions.Logging.Abstractions => 40
	i64 u0xaa443ac34067eeef, ; 260: System.Private.Xml.dll => 110
	i64 u0xaa52de307ef5d1dd, ; 261: System.Net.Http => 97
	i64 u0xaaaf86367285a918, ; 262: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 38
	i64 u0xaaf84bb3f052a265, ; 263: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab9c1b2687d86b0b, ; 264: lib_System.Linq.Expressions.dll.so => 94
	i64 u0xac2af3fa195a15ce, ; 265: System.Runtime.Numerics => 114
	i64 u0xac5376a2a538dc10, ; 266: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 63
	i64 u0xacd46e002c3ccb97, ; 267: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 268: System.Threading.Channels => 120
	i64 u0xad89c07347f1bad6, ; 269: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 270: System.Web.HttpUtility => 123
	i64 u0xadc90ab061a9e6e4, ; 271: System.ComponentModel.TypeConverter.dll => 86
	i64 u0xadf511667bef3595, ; 272: System.Net.Security => 102
	i64 u0xae282bcd03739de7, ; 273: Java.Interop => 127
	i64 u0xae53579c90db1107, ; 274: System.ObjectModel.dll => 108
	i64 u0xafe29f45095518e7, ; 275: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 65
	i64 u0xb05cc42cd94c6d9d, ; 276: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb220631954820169, ; 277: System.Text.RegularExpressions => 119
	i64 u0xb2a3f67f3bf29fce, ; 278: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb3f0a0fcda8d3ebc, ; 279: Xamarin.AndroidX.CardView => 54
	i64 u0xb46be1aa6d4fff93, ; 280: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 281: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 282: System.IO.Pipelines => 93
	i64 u0xb5c7fcdafbc67ee4, ; 283: Microsoft.Extensions.Logging.Abstractions.dll => 40
	i64 u0xb7b7753d1f319409, ; 284: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 285: lib_System.Private.CoreLib.dll.so => 126
	i64 u0xb9f64d3b230def68, ; 286: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 287: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba48785529705af9, ; 288: System.Collections.dll => 84
	i64 u0xbb65706fde942ce3, ; 289: System.Net.Sockets => 103
	i64 u0xbd0e2c0d55246576, ; 290: System.Net.Http.dll => 97
	i64 u0xbd437a2cdb333d0d, ; 291: Xamarin.AndroidX.ViewPager2 => 75
	i64 u0xbee38d4a88835966, ; 292: Xamarin.AndroidX.AppCompat.AppCompatResources => 53
	i64 u0xc040a4ab55817f58, ; 293: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 294: System.Console.dll => 88
	i64 u0xc12b8b3afa48329c, ; 295: lib_System.Linq.dll.so => 95
	i64 u0xc14ee39f38ea6593, ; 296: App.dll => 80
	i64 u0xc1ff9ae3cdb6e1e6, ; 297: Xamarin.AndroidX.Activity.dll => 51
	i64 u0xc28c50f32f81cc73, ; 298: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2bcfec99f69365e, ; 299: Xamarin.AndroidX.ViewPager2.dll => 75
	i64 u0xc421b61fd853169d, ; 300: lib_System.Net.WebSockets.Client.dll.so => 105
	i64 u0xc4d3858ed4d08512, ; 301: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 65
	i64 u0xc50fded0ded1418c, ; 302: lib_System.ComponentModel.TypeConverter.dll.so => 86
	i64 u0xc519125d6bc8fb11, ; 303: lib_System.Net.Requests.dll.so => 101
	i64 u0xc5293b19e4dc230e, ; 304: Xamarin.AndroidX.Navigation.Fragment => 68
	i64 u0xc5325b2fcb37446f, ; 305: lib_System.Private.Xml.dll.so => 110
	i64 u0xc5a0f4b95a699af7, ; 306: lib_System.Private.Uri.dll.so => 109
	i64 u0xc7ce851898a4548e, ; 307: lib_System.Web.HttpUtility.dll.so => 123
	i64 u0xc858a28d9ee5a6c5, ; 308: lib_System.Collections.Specialized.dll.so => 83
	i64 u0xca3a723e7342c5b6, ; 309: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xcab3493c70141c2d, ; 310: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 311: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcbd4fdd9cef4a294, ; 312: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 313: lib_System.Text.RegularExpressions.dll.so => 119
	i64 u0xcc5c3bb714c4561e, ; 314: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 78
	i64 u0xcc76886e09b88260, ; 315: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 79
	i64 u0xccf25c4b634ccd3a, ; 316: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 317: System.Net.Requests => 101
	i64 u0xcdd0c48b6937b21c, ; 318: Xamarin.AndroidX.SwipeRefreshLayout => 73
	i64 u0xce7286aa30b0e33b, ; 319: App => 80
	i64 u0xcf23d8093f3ceadf, ; 320: System.Diagnostics.DiagnosticSource.dll => 89
	i64 u0xd1194e1d8a8de83c, ; 321: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 62
	i64 u0xd333d0af9e423810, ; 322: System.Runtime.InteropServices => 112
	i64 u0xd3426d966bb704f5, ; 323: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 53
	i64 u0xd3651b6fc3125825, ; 324: System.Private.Uri.dll => 109
	i64 u0xd373685349b1fe8b, ; 325: Microsoft.Extensions.Logging.dll => 39
	i64 u0xd3e4c8d6a2d5d470, ; 326: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 327: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 38
	i64 u0xd5507e11a2b2839f, ; 328: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 65
	i64 u0xd6694f8359737e4e, ; 329: Xamarin.AndroidX.SavedState => 72
	i64 u0xd6d21782156bc35b, ; 330: Xamarin.AndroidX.SwipeRefreshLayout.dll => 73
	i64 u0xd72329819cbbbc44, ; 331: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 36
	i64 u0xd7b3764ada9d341d, ; 332: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 40
	i64 u0xda1dfa4c534a9251, ; 333: Microsoft.Extensions.DependencyInjection => 37
	i64 u0xdad05a11827959a3, ; 334: System.Collections.NonGeneric.dll => 82
	i64 u0xdb5383ab5865c007, ; 335: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdbeda89f832aa805, ; 336: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf9607a441b4505, ; 337: System.Linq => 95
	i64 u0xdce2c53525640bf3, ; 338: Microsoft.Extensions.Logging => 39
	i64 u0xdd2b722d78ef5f43, ; 339: System.Runtime.dll => 115
	i64 u0xdd67031857c72f96, ; 340: lib_System.Text.Encodings.Web.dll.so => 117
	i64 u0xdde30e6b77aa6f6c, ; 341: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xddf3ef21cad250f2, ; 342: lib_OpenAI.dll.so => 48
	i64 u0xde8769ebda7d8647, ; 343: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 344: Xamarin.AndroidX.AppCompat.dll => 52
	i64 u0xe02f89350ec78051, ; 345: Xamarin.AndroidX.CoordinatorLayout.dll => 56
	i64 u0xe192a588d4410686, ; 346: lib_System.IO.Pipelines.dll.so => 93
	i64 u0xe1a08bd3fa539e0d, ; 347: System.Runtime.Loader => 113
	i64 u0xe1ecfdb7fff86067, ; 348: System.Net.Security.dll => 102
	i64 u0xe2420585aeceb728, ; 349: System.Net.Requests.dll => 101
	i64 u0xe29b73bc11392966, ; 350: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe3811d68d4fe8463, ; 351: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe494f7ced4ecd10a, ; 352: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 353: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe5434e8a119ceb69, ; 354: lib_Mono.Android.dll.so => 129
	i64 u0xedc4817167106c23, ; 355: System.Net.Sockets.dll => 103
	i64 u0xedc632067fb20ff3, ; 356: System.Memory.dll => 96
	i64 u0xedc8e4ca71a02a8b, ; 357: Xamarin.AndroidX.Navigation.Runtime.dll => 69
	i64 u0xeeb7ebb80150501b, ; 358: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 55
	i64 u0xef72742e1bcca27a, ; 359: Microsoft.Maui.Essentials.dll => 46
	i64 u0xefec0b7fdc57ec42, ; 360: Xamarin.AndroidX.Activity => 51
	i64 u0xf00c29406ea45e19, ; 361: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 362: System.Net.NameResolution => 98
	i64 u0xf0de2537ee19c6ca, ; 363: lib_System.Net.WebHeaderCollection.dll.so => 104
	i64 u0xf11b621fc87b983f, ; 364: Microsoft.Maui.Controls.Xaml.dll => 44
	i64 u0xf1c4b4005493d871, ; 365: System.Formats.Asn1.dll => 90
	i64 u0xf238bd79489d3a96, ; 366: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 367: lib_Xamarin.Google.Android.Material.dll.so => 76
	i64 u0xf3ddfe05336abf29, ; 368: System => 125
	i64 u0xf4c1dd70a5496a17, ; 369: System.IO.Compression => 92
	i64 u0xf5fc7602fe27b333, ; 370: System.Net.WebHeaderCollection => 104
	i64 u0xf6077741019d7428, ; 371: Xamarin.AndroidX.CoordinatorLayout => 56
	i64 u0xf77b20923f07c667, ; 372: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 373: lib_System.Numerics.Vectors.dll.so => 107
	i64 u0xf7e74930e0e3d214, ; 374: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf84773b5c81e3cef, ; 375: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8e045dc345b2ea3, ; 376: lib_Xamarin.AndroidX.RecyclerView.dll.so => 71
	i64 u0xf915dc29808193a1, ; 377: System.Web.HttpUtility.dll => 123
	i64 u0xf96c777a2a0686f4, ; 378: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 379: Microsoft.Extensions.Options => 41
	i64 u0xfa3f278f288b0e84, ; 380: lib_System.Net.Security.dll.so => 102
	i64 u0xfa5ed7226d978949, ; 381: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 382: System.Threading.Thread => 121
	i64 u0xfbf0a31c9fc34bc4, ; 383: lib_System.Net.Http.dll.so => 97
	i64 u0xfc719aec26adf9d9, ; 384: Xamarin.AndroidX.Navigation.Fragment.dll => 68
	i64 u0xfd22f00870e40ae0, ; 385: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 60
	i64 u0xfd49b3c1a76e2748, ; 386: System.Runtime.InteropServices.RuntimeInformation => 111
	i64 u0xfd583f7657b6a1cb, ; 387: Xamarin.AndroidX.Fragment => 61
	i64 u0xfda36abccf05cf5c, ; 388: System.Net.WebSockets.Client => 105
	i64 u0xfeae9952cf03b8cb ; 389: tr/Microsoft.Maui.Controls.resources => 28
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [390 x i32] [
	i32 73, i32 48, i32 69, i32 128, i32 52, i32 24, i32 2, i32 30,
	i32 100, i32 71, i32 84, i32 45, i32 31, i32 55, i32 24, i32 82,
	i32 60, i32 41, i32 82, i32 50, i32 116, i32 120, i32 25, i32 79,
	i32 74, i32 21, i32 129, i32 46, i32 98, i32 59, i32 91, i32 106,
	i32 71, i32 8, i32 127, i32 9, i32 38, i32 106, i32 12, i32 117,
	i32 79, i32 18, i32 81, i32 125, i32 27, i32 128, i32 70, i32 16,
	i32 41, i32 91, i32 115, i32 49, i32 27, i32 121, i32 88, i32 57,
	i32 8, i32 77, i32 42, i32 13, i32 11, i32 106, i32 127, i32 100,
	i32 29, i32 99, i32 7, i32 119, i32 90, i32 33, i32 20, i32 122,
	i32 26, i32 118, i32 5, i32 124, i32 61, i32 34, i32 54, i32 8,
	i32 124, i32 6, i32 103, i32 45, i32 2, i32 43, i32 75, i32 35,
	i32 59, i32 98, i32 74, i32 1, i32 77, i32 57, i32 67, i32 53,
	i32 129, i32 20, i32 77, i32 24, i32 50, i32 22, i32 108, i32 70,
	i32 118, i32 49, i32 66, i32 99, i32 105, i32 94, i32 110, i32 49,
	i32 113, i32 14, i32 66, i32 128, i32 120, i32 1, i32 43, i32 64,
	i32 100, i32 57, i32 47, i32 25, i32 99, i32 111, i32 31, i32 115,
	i32 62, i32 83, i32 109, i32 126, i32 89, i32 15, i32 37, i32 50,
	i32 56, i32 122, i32 87, i32 3, i32 39, i32 104, i32 112, i32 55,
	i32 83, i32 117, i32 85, i32 48, i32 124, i32 5, i32 37, i32 78,
	i32 96, i32 44, i32 4, i32 113, i32 126, i32 76, i32 43, i32 114,
	i32 88, i32 64, i32 58, i32 3, i32 90, i32 9, i32 112, i32 18,
	i32 47, i32 42, i32 58, i32 42, i32 68, i32 45, i32 2, i32 80,
	i32 28, i32 18, i32 14, i32 85, i32 11, i32 96, i32 35, i32 72,
	i32 114, i32 17, i32 27, i32 61, i32 7, i32 86, i32 25, i32 4,
	i32 17, i32 107, i32 84, i32 108, i32 87, i32 74, i32 36, i32 63,
	i32 125, i32 33, i32 52, i32 54, i32 29, i32 32, i32 33, i32 35,
	i32 121, i32 91, i32 46, i32 78, i32 85, i32 111, i32 66, i32 89,
	i32 9, i32 58, i32 122, i32 81, i32 67, i32 10, i32 23, i32 22,
	i32 21, i32 34, i32 92, i32 64, i32 44, i32 59, i32 118, i32 95,
	i32 1, i32 17, i32 92, i32 6, i32 13, i32 47, i32 87, i32 81,
	i32 94, i32 69, i32 16, i32 51, i32 36, i32 19, i32 67, i32 63,
	i32 116, i32 76, i32 70, i32 93, i32 16, i32 107, i32 116, i32 72,
	i32 60, i32 62, i32 12, i32 40, i32 110, i32 97, i32 38, i32 5,
	i32 94, i32 114, i32 63, i32 23, i32 120, i32 19, i32 123, i32 86,
	i32 102, i32 127, i32 108, i32 65, i32 26, i32 119, i32 3, i32 54,
	i32 10, i32 0, i32 93, i32 40, i32 26, i32 126, i32 22, i32 15,
	i32 84, i32 103, i32 97, i32 75, i32 53, i32 0, i32 88, i32 95,
	i32 80, i32 51, i32 15, i32 75, i32 105, i32 65, i32 86, i32 101,
	i32 68, i32 110, i32 109, i32 123, i32 83, i32 28, i32 20, i32 23,
	i32 34, i32 119, i32 78, i32 79, i32 32, i32 101, i32 73, i32 80,
	i32 89, i32 62, i32 112, i32 53, i32 109, i32 39, i32 14, i32 38,
	i32 65, i32 72, i32 73, i32 36, i32 40, i32 37, i32 82, i32 30,
	i32 30, i32 95, i32 39, i32 115, i32 117, i32 32, i32 48, i32 11,
	i32 52, i32 56, i32 93, i32 113, i32 102, i32 101, i32 13, i32 21,
	i32 12, i32 7, i32 129, i32 103, i32 96, i32 69, i32 55, i32 46,
	i32 51, i32 6, i32 98, i32 104, i32 44, i32 90, i32 19, i32 76,
	i32 125, i32 92, i32 104, i32 56, i32 4, i32 107, i32 31, i32 29,
	i32 71, i32 123, i32 10, i32 41, i32 102, i32 0, i32 121, i32 97,
	i32 68, i32 60, i32 111, i32 61, i32 105, i32 28
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ e7876a4f92d894b40c191a24c2b74f06d4bf4573"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
