{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_main",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_5A76C5C4","path":"rooms/rm_main/rm_main.yy",},
    {"name":"inst_695D7D5D","path":"rooms/rm_main/rm_main.yy",},
    {"name":"inst_1F299776","path":"rooms/rm_main/rm_main.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_695D7D5D","colour":4294902015,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_main","path":"objects/obj_main/obj_main.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-32.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1F299776","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_point","path":"objects/obj_point/obj_point.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":216.0,"y":64.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"RgdBarLayer","depth":100,"effectEnabled":true,"effectType":"_effect_glow","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5A76C5C4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_rgdbar","path":"objects/obj_rgdbar/obj_rgdbar.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":44.0,"y":27.0,},
      ],"layers":[],"properties":[
        {"name":"g_GlowRadius","type":0,"value":"256",},
        {"name":"g_GlowQuality","type":0,"value":"5",},
        {"name":"g_GlowIntensity","type":0,"value":"0.5",},
        {"name":"g_GlowGamma","type":0,"value":"0",},
        {"name":"g_GlowAlpha","type":0,"value":"1",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_decor","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":38,"SerialiseWidth":50,"TileCompressedData":[
-4,0,-8,-2147483648,-5,0,-33,-2147483648,-4,0,-8,-2147483648,-4,0,2,32,33,-44,-2147483648,6,0,43,44,0,89,90,-45,-2147483648,2,100,101,-1735,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tl_bar","path":"tilesets/tl_bar/tl_bar.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_wall","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":38,"SerialiseWidth":50,"TileCompressedData":[
-5,86,4,20,21,22,23,-41,86,-5,31,4,77,78,79,80,-46,31,4,134,135,136,137,-41,31,-5,88,4,191,192,193,194,-41,88,-9,0,-41,-2147483648,-9,0,2,-2147483648,9,-39,-2147483648,1,3,-7,4,3,
5,6,7,-39,-2147483648,1,60,-7,61,3,62,63,64,-1539,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tl_bar","path":"tilesets/tl_bar/tl_bar.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_floor","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":38,"SerialiseWidth":50,"TileCompressedData":[
-1900,57,],"TileDataFormat":1,},"tilesetId":{"name":"tl_bar","path":"tilesets/tl_bar/tl_bar.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "rgd-bar",
    "path": "rgd-bar.yyp",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 600,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 800,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":720,"hspeed":-1,"hview":240,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1080,"wview":360,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}