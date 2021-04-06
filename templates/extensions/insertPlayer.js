var tool = tiled.registerTool('InsertPlayer', {
    name: "Insert Player",
    icon: "insertPlayer.svg",

    mousePressed(button, x, y, modifiers) {
        this.x = x
        this.y = y
      
        var objectLayer = this.map.currentLayer;

        if (objectLayer && objectLayer.isObjectLayer) {
          var object = new MapObject(MapObject.Point);
          object.x = Math.min(this.x);
          object.y = Math.min(this.y);

          object.name = 'player';
          object.type = 'player';

          objectLayer.addObject(object);
          object.selected = true;
        }
    },
})
