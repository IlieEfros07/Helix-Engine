#pragma once


#ifdef HX_PLATFOM_WINDOWS
	#ifdef HX_BUILD_DLL
		#define HELIX_API __declspec(dllexport)
	#else
		#define HELIX_API __declspec(dllimport)
	#endif
#else
	#error Helix only support Windows!
#endif