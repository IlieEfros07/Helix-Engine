#include <Helix.h>


class ExampleLayer : public Helix::Layer {
public: 
	ExampleLayer() : Layer("Example") {

	}
	void OnUpdate() override {
		HX_INFO("ExampleLayer::Update");
	}
	void OnEvent(Helix::Event& event) override {
		HX_TRACE("{0}", event);
	}
};




class Sandbox : public Helix::Application {
public:
	Sandbox(){
		PushLayer(new ExampleLayer());
		PushOverlay(new Helix::ImGuiLayer());
	}
	~Sandbox() {

	}
};
Helix::Application* Helix::CreateApplication() {
	return new Sandbox();
}

