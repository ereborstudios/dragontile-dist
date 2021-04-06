let runGame = tiled.registerAction('RunGame', function(action) {
  tiled.executeCommand('run');
});

runGame.text = 'Run Game';

tiled.extendMenu("Map", [
    { separator: true },
    { action: "RunGame" },
])
