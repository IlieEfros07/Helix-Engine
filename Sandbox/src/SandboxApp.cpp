#include <Helix.h>

class Sandbox : public Helix::Application {
public:
	Sandbox(){

	}
	~Sandbox() {

	}
};
Helix::Application* Helix::CreateApplication() {
	return new Sandbox();
}

