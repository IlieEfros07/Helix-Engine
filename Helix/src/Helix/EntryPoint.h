#pragma once

#ifdef HX_PLATFOM_WINDOWS

extern Helix::Application* Helix::CreateApplication();

int main(int argc,char** argv) {
	printf("Zdarova");
	auto app = Helix::CreateApplication();
	app->Run();
	delete app;
}


#endif