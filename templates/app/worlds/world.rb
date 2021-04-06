module Dragontile
  module World

    def self.included(mod)
      mod.prepend(WorldPlugin)
    end

    module WorldPlugin

      def after_initialize
        super

        @systems << LoadMaps
        @systems << RenderMaps
        @systems << ReloadMaps
      end

    end

  end
end
