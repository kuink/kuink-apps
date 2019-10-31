{nocache}
<Function name="addTestData" doc="Adds a test record in table {$data['entity']}">
  <Params>
  </Params>
  <Return type="int" doc="The inserted record id"/>
  <Begin>
  	<Return>
	    <DataAccess method="insert">
	      <Param name="_entity">{$entity}</Param>
	      <Param name="_base">true</Param>
	      {foreach $attributes as $field}
	        {if ($field['key'] != 'PRI' && $field['name'] !='' && $field['name'][0] != '_' && $field['name'] != 'id_company')}
	           <Param name="{$field['name']}">
	           	{if ($field['type'] == 'Int' || $field['type'] == 'Checkbox' || $field['type'] == 'Select') }
	           		<Int>1</Int>
	           		{else}
			           	{if ($field['type'] == 'Date' || $field['type'] == 'DateTime') }
			           		<Now/>
			           		{else}
												<String>A</String>		           	
			           	{/if}
	           	{/if}
	           </Param>
	        {/if}
	      {/foreach}
	    </DataAccess>
    </Return>
  </Begin>
</Function>
{/nocache}
