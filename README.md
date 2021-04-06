# Dragontile

> Create games with DragonRuby and the Tiled 2D map editor

---

## Features

Dragontile supports the [Tiled 1.4 JSON Map Format](https://doc.mapeditor.org/en/stable/reference/json-map-format/#tiled-1-4)

### Import your tiles

* Both embedded and external tilesets are supported
* Tile sprites are preloaded and cached to a render target upfront
* Any tiles not found in the map will be skipped and lazy-loaded on first use

### Tile Layers

* All visible Tile Layers are rendered to the grid
* Tiles use static sprites to paint each layer as a precomputed render target,
  skipping any tiles located off-camera until they enter the viewport for performance

### Layer effects

* Background color, opacity values, and tint colors are applied
* Supports parallax scrolling offset layers (Tiled 1.5)

### Hot reloading

* The current in-game map will now be reloaded when a change to the map file is detected

### Object Layers

* Position objects on the map with Object Layers
* Define a Ruby class to apply entity behavior to an object type
* Set attributes using [Custom Properties](https://doc.mapeditor.org/en/stable/manual/custom-properties/)
* Resolves and caches [Object Templates](https://doc.mapeditor.org/en/stable/manual/using-templates/) from external JSON files so you can reuse objects across multiple maps

### Create boundaries and trigger zones

* Collision detection on tiles that specify collision shapes
* Draw collision object polygons to create boundaries and trigger events using zones
* Set arbitrary points on the map to create entity spawn locations

### Designed for Draco

* Object types matching a registered Draco entity class will create an entity
  and populate it with the Position, Size, Rotation, Sprite, and Visible
  components from draco-common
* Draco ECS files to support map loading and rendering functionality are added to the
  project during post-install for easy integration.

### External tilesets and object templates

* Resolves and caches external [Tilesets](https://doc.mapeditor.org/en/stable/manual/editing-tilesets/) and [Object Templates](https://doc.mapeditor.org/en/stable/manual/using-templates/)
* Share tilesets and metadata between multiple maps
* Create distributable asset packs and package them with Smaug

### Tiled extensions

* Enhances Tiled with new tools and actions

---

## Installation

If you don't already have a game project, run `smaug new` to create one.

```bash
$ smaug add dragontile
$ smaug install
```

You will need to obtain a license key from https://smaug.dev/packages/dragontile/licenses/new and configure it for Dragontile.


```ruby
# app/main.rb
require 'smaug.rb'

def tick args
  Dragontile::Game.configure(args, { license_key: 'YOUR_KEY' }) do
    # Now your world can begin...

    args.state.world ||= HelloDragontile.new
    args.state.world.tick(args)
  end
end
```

Next, create a World and include `Dragontile::World`. This will start the `LoadMaps`, `RenderMaps`, and `ReloadMaps` systems for you, so all you have to do is add a Map entity.


```ruby
# app/worlds/hello_dragontile.rb
class HelloDragontile < Draco::World
  include Dragontile::World
  include Draco::Common::World

  entity Map, map_file: { filename: 'maps/empty.json' }, as: :default_map
end
```

Start the game with `smaug run`, and your map should appear.
