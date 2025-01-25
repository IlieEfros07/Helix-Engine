workspace "Helix"
    architecture "x64"

    configurations{
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir={}
IncludeDir["GLFW"] = "Helix/vendor/GLFW/include"

include "Helix/vendor/GLFW"

project "Helix"
    location "Helix"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "hxpch.h"
    pchsource "Helix/src/hxpch.cpp"

    files{
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs{
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{prj.name}/vendor/spdlog/include/fmt",
        "%{prj.name}/vendor/GLFW/deps",
        "%{IncludeDir.GLFW}"
    }



    libdirs {
        "Helix/vendor/GLFW/lib" 
    }
    
    links {
        "GLFW", 
        "opengl32.lib",
        "gdi32.lib",
        "user32.lib",
        "kernel32.lib"
    }
    filter "system:windows"
        buildoptions { "/utf-8" }
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines{
                "HX_PLATFOM_WINDOWS",
                "HX_BUILD_DLL"
    
        }


postbuildcommands {
("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/")
}

    filter "configurations:Debug"
        defines "HX_DEBUG"

        symbols "On"

    filter "configurations:Release"
        defines "HX_RELEASE"
        optimize "On"


    filter "configurations:Dist"
        defines "HX_DIST"
        optimize "On"






project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files{
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs{
        "Helix/vendor/spdlog/include",
        "Helix/src"
    }

    links{
        "Helix"
    }

    filter "system:windows"
        buildoptions { "/utf-8" }
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines{
                "HX_PLATFOM_WINDOWS"

    
        }


    filter "configurations:Debug"
        defines "HX_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "HX_RELEASE"
        optimize "On"


    filter "configurations:Dist"
        defines "HX_DIST"
        optimize "On"