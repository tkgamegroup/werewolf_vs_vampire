#include <flame/foundation/sheet.h>
#include <flame/foundation/blueprint.h>
#include <flame/universe/application.h>
#include <flame/universe/world.h>

using namespace flame;

struct App : UniverseApplication
{
	EntityPtr root;
}app;

int main(int argc, char** argv)
{
	auto assets_path = std::filesystem::current_path() / L"assets";
	Path::set_root(L"assets", assets_path);
	app.create("PROJECT_NAME", uvec2(1280, 720), WindowFrame, false, true, { {"mesh_shader"_h, 0} });

	auto project_static_path = assets_path;
	project_static_path.make_preferred();
	if (std::filesystem::exists(project_static_path))
	{
		for (auto it : std::filesystem::recursive_directory_iterator(project_static_path))
		{
			if (it.is_regular_file())
			{
				auto ext = it.path().extension();
				if (ext == L".sht")
					Sheet::get(it.path());
				else if (ext == L".bp")
					Blueprint::get(it.path(), true);
			}
		}
	}

	app.root = Entity::create();
	app.root->load(L"assets/main.prefab");
	World::instance()->root->add_child(app.root);

	app.run();
	return 0;
}
