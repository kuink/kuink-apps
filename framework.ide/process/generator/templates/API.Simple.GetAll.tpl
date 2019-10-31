
<Function name="getAll" doc="Get all records from table {$entity}">
  <Params/>
  <Return type="multiple" doc="">
    {foreach $attributes as $field}
    {if $field['name'] != ''}
      <External name="{$field['name']}" type="{$field['type']|lower}" doc=""/>
    {/if}
    {/foreach}    
  </Return>    
  <Begin>
    <Return>
      <DataAccess method="getAll">
        <Param name="_entity">{$entity}</Param>
      </DataAccess>
    </Return>
  </Begin>
</Function>

