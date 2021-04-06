class LoadMaps < Draco::System
  filter MapFile, Tag(:loading)

  def tick(args)
    entities.each do |entity|
      data = $gtk.parse_json_file(entity.map_file.filename)
      map = Dragontile::Map.new(data: OpenStruct.new(data))

      map.layers.each do |layer|
        layer.objects.each do |object|
          world.entities << object
        end
      end

      entity.map_file.data = map

      entity.components.add(Ready.new)
      entity.components.delete(entity.components[:loading])
    end
  end
end
