project "ImPlot"
	kind "StaticLib"
	language "C++"
    staticruntime "On"

	targetdir ("build/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("build/obj/" .. outputdir .. "/%{prj.name}")

	-- include "3rdparty/external/GLFW"
	-- include "3rdparty/external/imgui"
	-- include "3rdparty/external/Glad"

	files
	{
		"implot.h",
		"implot.cpp",
		"implot_internal.h",
		"implot_items.cpp",
		"implot_demo.cpp",
	}

	includedirs 
    {
		"%{wks.location}/3rdparty/external/GLFW/include",
		"%{wks.location}/3rdparty/external/Glad/include",
		"%{wks.location}/3rdparty/external/imgui",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

		links
        {
            "GLFW",
            "Glad",
		    "ImGui",
		}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

		links
        {
            "GLFW",
            "dl",
            "X11",
            "Glad",
		    "ImGui",
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
