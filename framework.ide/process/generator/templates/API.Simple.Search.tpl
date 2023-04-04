<Function name="search" doc="Search records from table {$entity}">
  <Params>
    {foreach $attributes as $field}
    {if $field['search'] == 1 && $field['name'] != ''}
    <Param name="{$field['name']}" type="{$field['type']|lower}"/>
    {/if}
    {/foreach}    
    <Param name="pagenum" type="int"/>
    <Param name="pagesize" type="int"/>
  </Params>
  <Return type="multiple" doc="">
    {foreach $attributes as $field}
      {if $field['name'] != ''}
        <External name="{$field['name']}" type="{$field['type']|lower}" doc=""/>
      {/if}
    {/foreach}    
  </Return>    
  <Begin>
    <Return>
      <DataAccess method="this,this,{$apiSearchNodeName}">
        {foreach $attributes as $field}
          {if $field['search'] == 1 && $field['name'] != ''}
            <Param name="{$field['name']}" {if $field['type'] == 'Text'}wildcard="full"{/if}><Var name="PARAMS" key="{$field['name']}"/></Param>
          {/if}
        {/foreach}    
        <Param name="_pageNum"><Var name="PARAMS" key="pagenum"/></Param>
        <Param name="_pageSize"><Var name="PARAMS" key="pagesize"/></Param>
      </DataAccess>
    </Return>
  </Begin>
</Function>
