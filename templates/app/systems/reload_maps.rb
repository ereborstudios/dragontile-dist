class ReloadMaps < Draco::System
  filter MapFile, Tag(:ready)

  def tick(args)
    entities.each do |entity|
      if $gtk.reload_if_needed(entity.map_file.filename)
        puts "Reloading map file '#{entity.map_file.filename}'"
        entity.components.delete(entity.components[:ready])
        entity.components.add(Loading.new)
      end
    end
  end
end
