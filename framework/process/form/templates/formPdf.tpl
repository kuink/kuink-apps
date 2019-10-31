{** include the header **}

<html>
	<body>
		<table id="header" align="center" >
				<tr>
						<td align="left">
								<img src="http://apps.cscm-lx.pt/~docs/imagens/normasGraficas/pagina_04/v1/v1.svg" width="300"/>
						</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>&nbsp;</td>
					<td align="right">
						<p style="font-size: 15px;">{$documentInfo['title']}</p>
						<p style="font-size: 10px;">Data do Documento: {$documentInfo['date']}</p>
						<p style="font-size: 10px;">{$documentInfo['disclaimer']} <br/>Data de impressão: {$now} </p>
					</td>
				</tr>
		</table>
		<table>
			<tr>
				{foreach $formData as $formItem}
					{if ($formItem['type'] == 'header')}
						<td style="font-size: 11pt">{if ($inHeader==0)}<br/><br/>{/if}<strong>{$formItem['name']}</strong></td></tr><tr>
						{$inHeader = 1}
					{else}
						{if ($formItem['type'] != '')}
							{if ($formItem['inline']==0)}<td style="font-size: 10pt">{if ($inHeader==0)}<br/><br/>{else}{$inHeader=0}{/if}{/if}<strong>{$formItem['name']}</strong>&nbsp;|&nbsp;{$formItem['value']}&nbsp;&nbsp;{if ($formItem['newLine']==1)}</td></tr><tr>{/if}
						{/if}
					{/if}
				{/foreach}
			</tr>
		</table>

	</body>
</html>
