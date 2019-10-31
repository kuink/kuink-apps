<Function name="getById" doc="Get a record by id from table {$entity}">
  <Params>
    <Param name="id" type="int" required="true"/>
  </Params>
  <Return type="single" doc="">
    {foreach $attributes as $field}
    {if $field['name'] != ''}
      <External name="{$field['name']}" type="{$field['type']|lower}" doc=""/>
    {/if}
    {/foreach}    
  </Return>    
  <Begin>
    <Return>
      <DataAccess method="load">
        <Param name="_entity">{$entity}</Param>
        <Param name="id"><Var name="PARAMS" key="id"/></Param>
      </DataAccess>
    </Return>
  </Begin>
</Function>
