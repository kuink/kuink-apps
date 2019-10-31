

<Function name="add" doc="Adds a record in table {$data['entity']}">
  <Params>
  {foreach $attributes as $field}
  {if ($field['key'] != 'PRI' && $field['name'] !='' && $field['name'][0] != '_' && $field['name'] != 'id_company')}
    {* Don't add primary keys neither base fields in insert *}
    <Param name="{$field['name']}" type="{$field['type']|lower}" required="{$field['required']}"/>
  {/if}
  {/foreach}
  </Params>
  <Return type="int" doc="The inserted record id"/>
  <Begin>
  	<Return>
	    <DataAccess method="insert">
	      <Param name="_entity">{$entity}</Param>
	      <Param name="_base">true</Param>
	      {foreach $attributes as $field}
	        {if ($field['key'] != 'PRI' && $field['name'] !='' && $field['name'][0] != '_' && $field['name'] != 'id_company')}
	           <Param name="{$field['name']}"><Var name="PARAMS" key="{$field['name']}"/></Param>
	        {/if}
	      {/foreach}
	    </DataAccess>
    </Return>
  </Begin>
</Function>

