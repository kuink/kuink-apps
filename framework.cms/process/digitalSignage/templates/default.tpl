{nocache}
<h1>Digital Signage v0.1</h1>
{if $item['text'] != ''}
	<h3>{$item['text']}</h3>
{/if}

{if $item['type'] == 'video'}
	<video width="400" autoplay muted controls>
		<source src="{$item['uri']}"/>
	</video>
{/if}
{if $item['type'] == image}
	<img src="{$item['uri']}" width="400"></img>
{/if}

<p>{$device}|{$channel}|{$order}/{$total} | {$item['time']} | {$item['type']}</p>
<p><div id="clock-div">##:##:##</div></p>

<!-- Global script -->
<script>
	function getNextContent() {
			console.log('Getting the next content...');	
			$("html").fadeOut();
			setTimeout(function() {
				
				if  ('{$actionUrl}' != '')
					window.location = '{$actionUrl}';
			}, 200);
	}
	{if $item['time'] != 0}
		setInterval(getNextContent, {$item['time']}); //Get the next content after this time
	{/if}
</script>

<!-- Clock -->
<script>
	function renderClock() {
		document.getElementById("clock-div").innerHTML = '<h5>' + moment(new Date()).format("HH:mm:ss") + '</h5>';
	}
	renderClock();
	setInterval(renderClock, 1000); //Update the clock each second
</script>

<!-- Video play settings -->
{if $item['type'] == 'video'}		
	<script>
		function playVideo() {
			console.log('Digital Signage');

			//Auto play the video
			const video = document.querySelector('video');
			//Set start time
			//video.currentTime = 10;
			video.play();

			video.onended = (event) => {
				getNextContent();
			};
		}
		playVideo(); 
	</script>
{/if}

{/nocache}