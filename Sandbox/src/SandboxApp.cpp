#include <Helix.h>


class ExampleLayer : public Helix::Layer {
public: 
	ExampleLayer() : Layer("Example") {

	}
	void OnUpdate() override {
		//HX_INFO("ExampleLayer::Update");
		if (Helix::Input::IsKeyPressed(HX_KEY_TAB))
			HX_TRACE("Tab key is pressed (poll)!");
	}
	void OnEvent(Helix::Event& event) override {
		//HX_TRACE("{0}", event);
		if (event.GetEventType() == Helix::EventType::KeyPressed) {
			Helix::KeyPressedEvent& e = (Helix::KeyPressedEvent&)event;
			HX_TRACE("{0}", (char)e.GetKeyCode());
		}
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

