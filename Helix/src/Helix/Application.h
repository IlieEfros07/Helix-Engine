#pragma once
#include"Core.h"
namespace Helix{
	class HELIX_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	//To be defind in a client
	Application* CreateApplication();
}
