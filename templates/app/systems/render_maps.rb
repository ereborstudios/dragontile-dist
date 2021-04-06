class RenderMaps < Draco::System
  filter MapFile, Tag(:ready)

  def tick(args)
    entities.each do |entity|
      entity.map_file.data.render
    end
  end
end
