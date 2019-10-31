<Function name="update" doc="Updates a record in table {$entity}">
  <Params>
  {foreach $attributes as $field}
	  {if ($field['name'] !='' && $field['name'][0] != '_' && $field['name'] != 'id_company')}
	    {* Don't add base fields in insert *}
	    <Param name="{$field['name']}" type="{$field['type']|lower}" required="{if $field['key'] == 'PRI'}true{else}false{/if}"/>
	  {/if}
  {/foreach}
  </Params>
  <Begin> 
    
    <Var name="paramData">
      <UtilsLib method="filterNotNull">
        <Param><Var name="PARAMS"/></Param>
      </UtilsLib>
    </Var>
    
    <DataAccess method="update" params="paramData">
      <Param name="_entity">{$entity}</Param>
      <Param name="_base">true</Param>
    </DataAccess>
  </Begin>
</Function>
