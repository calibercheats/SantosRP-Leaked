
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

local plugin = plugin;

plugin.playerHTML = [[
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
			body {
				margin: 0;
				padding: 0;
			}
		</style>
	</head>

	<body>
		<div id="player"></div>

		<script>
			var scriptTag = document.createElement("script");
			scriptTag.src = "https://www.youtube.com/iframe_api";

			var firstScriptTag = document.getElementsByTagName("script")[0];
			firstScriptTag.parentNode.insertBefore(scriptTag, firstScriptTag);

			var player;
			var played = false;

			function onYouTubeIframeAPIReady()
			{
				player = new YT.Player("player", {
					width: "480",
					height: "300",
					events: {
						"onStateChange": onPlayerStateChange
					}
				});
			}

			function play(id, startTime)
			{
				played = false;

				if (player)
				{
					player.loadVideoById(id, startTime, "medium");
				}
			}

			function stop()
			{
				played = false;

				if (player)
				{
					player.stopVideo();
				}
			}

			function pause()
			{
				played = false;
				
				if (player)
				{
					player.pauseVideo();
				}
			}

			function resume()
			{
				if (player)
				{
					player.playVideo();
				}
			}

			function setVolume(volume)
			{
				if (player)
				{
					player.setVolume(volume);
				}
			}

			function onPlayerStateChange(event)
			{
				if (event.data == YT.PlayerState.PLAYING)
				{
					if (played)
					{
						return;
					}

					console.log("sg:playerStarted");
					played = true;
				}
			}
		</script>
	</body>
</html>
]];